import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:signapp/model/auth.dart';
import 'package:signapp/registration.dart';
import 'package:signapp/userdashboard.dart';
import 'package:signapp/dashboard.dart';
import 'package:signapp/employeedashboard.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ABC Bank Management',
        theme: ThemeData(

            //  primarySwatch: Colors.blue,
            ),
        home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, String? token}) : super(key: key);

  // get token => null;

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String _email = "";
  String _password = "";
  // String _utype = "";
  var body = {};
  Authresponse? authresponse;
  bool _loading = false;

//  void autenticate ()
//     async{var response = await http.post(Uri.parse("http://localhost:8080/authenticate"),headers: {"Content-Type": "application/json"},body: {  "userEmail": "sri@gmail.com",
//         "password": "1234uiyt"});
//          print("statuscode");
//          print(response.statusCode);

// }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authenticate();
  }

  void authenticate() async {
    setState(() {
      _loading = true;
    });
    var body = {};

    //  if(_email == ){
    //   body["userEmail"] = "sri@gmail.com";
    //   body["password"] = "1234uiyt";
    //  }
    //  if(_email == "sula@gmail.com"){
    //   body["userEmail"] = "sula@gmail.com";
    //   body["password"] = "0987cvbn";
    //  }
    //  if(_email == "dana@gmail.com"){
    //   body["userEmail"] = "dana@gmail.com";
    //   body["password"] = "3456cdfg";
    //  }
    body["userEmail"] = _email;
    body["password"] = _password;
    String bodyJson = json.encode(body);

    var response = await http.post(
        Uri.parse("http://localhost:8080/authenticate"),
        headers: {"Content-Type": "application/json"},
        body: bodyJson);
    print("statuscode");
    print(response.statusCode);
    if (response.statusCode == 200) {
      authresponse = authresponseFromJson(response.body);
      print(authresponse!.body!.user);
      print(authresponse!.body!.jwt);
      print(authresponse!.body!.user!.type);
      if (authresponse!.body!.user!.type == 'A') {
        print("admin");
        Fluttertoast.showToast(
            msg: "Welcome Admin ! ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Dashboard(
                      token: authresponse!.body!.jwt.toString(),
                    )));
      } else if (authresponse!.body!.user!.type == 'C') {
        Fluttertoast.showToast(
            msg: "Welcome Customer ! Now You can Access Our Transactions",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => UserDashboard(
                      token: authresponse!.body!.jwt.toString(),
                    )));
      } else if (authresponse!.body!.user!.type == 'E') {
        Fluttertoast.showToast(
            msg: "Welcome Employee ! Now You can Access Our Transactions",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => EmployeeDashboard(
                      token: authresponse!.body!.jwt.toString(),
                    )));
      } else {
        print('invalid');
      }

      setState(() {
        _loading = false;
      });
    }
  }

  // String dropdownvalue = 'Select Your User Type';

  // // List of items in our dropdown menu
  // var items = [
  //   'Select Your User Type',
  //   'Customer',
  //   'Admin',
  //   'Employee',
  // ];

  // bool _isHidden = true;

  // void _togglePasswordView() {
  //   setState(() {
  //     _isHidden = !_isHidden;

  //   });
  // }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      child: Row(children: [
        //color: Color.fromARGB(255, 13, 137, 238),
        Expanded(
            flex: 3,
            child: Container(
              // color: Colors.blueAccent[700],
              color: Color.fromARGB(255, 0, 10, 39),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.only(bottom: 50),
                        child: Text(
                          "ABC Bank",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                          ),
                        )),
                    Container(
                        child: Text(
                      "Welcome To The ABC Bank",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                    SizedBox(height: 20),
                    Image.asset('lib/assets/Images/ABC-logo.jpg'),
                  ]),
            )),

        //Expanded(flex: 12, child: Container(color: Color.fromARGB(255, 105, 187, 255)))
        Expanded(
            flex: 9,
            child: Container(
              // color: Color.fromARGB(255, 111, 189, 241),
              //color: Color.fromARGB(255, 105, 133, 226),
              color: Color.fromARGB(255, 163, 176, 219),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('lib/assets/Images/ABC-bank.png'),
                    Container(
                        padding: EdgeInsets.only(top: 40),
                        child: Text(
                          "Please Sign In With Your Details",
                          style: TextStyle(
                            color: Color.fromARGB(255, 83, 70, 70),
                            fontSize: 30,
                          ),
                        )),
                    Container(
                      width: 500,
                      padding: EdgeInsets.only(top: 40),
                      child: TextFormField(
                        validator: (_email) {
                          if (_email == null || _email.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        style: TextStyle(color: Color.fromARGB(255, 6, 34, 56)),
                        decoration: InputDecoration(
                          labelText: "UserMail",
                          labelStyle: TextStyle(color: Colors.black),
                          counterText: 'Please Enter Valid Email Address !',
                          counterStyle: TextStyle(
                              color: Color.fromARGB(255, 207, 11, 11),
                              fontSize: 12),
                          suffixIcon: const Icon(Icons.email_outlined,
                              color: Colors.grey),
                          fillColor: Colors.blueGrey[50],
                          filled: true,
                          // hintText: "Enter Your User Name",
                          // hintStyle: TextStyle(color: Colors.black),
                          alignLabelWithHint: true,
                          contentPadding: const EdgeInsets.only(left: 30),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.green)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.grey)),
                        ),
                        onChanged: (val) {
                          _email = val;
                        },
                      ),
                    ),
                    Container(
                      width: 500,
                      padding: EdgeInsets.only(top: 30),
                      child: TextFormField(
                        style: TextStyle(color: Color.fromARGB(255, 6, 34, 56)),
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.black),
                          counterText:
                              'You Forgot password? Please Contact Our CustomerCare',
                          counterStyle: TextStyle(
                              color: Color.fromARGB(255, 31, 11, 4),
                              fontSize: 12),
                          // suffix: InkWell(
                          //   onTap: _togglePasswordView,

                          //   /// This is Magical Function
                          //   child: Icon(
                          //     _isHidden
                          //         ?

                          //         /// CHeck Show & Hide.
                          //         Icons.visibility_outlined
                          //         : Icons.visibility_off_outlined,
                          //   ),
                          // ),
                          suffixIcon: const Icon(Icons.visibility_off_outlined,
                              color: Colors.grey),
                          fillColor: Colors.blueGrey[50],
                          filled: true,
                          //  hintText: "Enter Your Password",
                          //  hintStyle: TextStyle(color: Colors.black),
                          alignLabelWithHint: true,
                          contentPadding: const EdgeInsets.only(left: 30),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.green)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.grey)),
                        ),
                        onChanged: (val2) {
                          //print(val);
                          _password = val2;
                        },
                      ),
                    ),
                    // Container(
                    //   height: 40,
                    //   width: 500,
                    //   child: DropdownButton(
                    //     // Initial Value
                    //     value: dropdownvalue,

                    //     // Down Arrow Icon
                    //     icon: const Icon(Icons.keyboard_arrow_down),

                    //     // Array list of items
                    //     items: items.map((String items) {
                    //       return DropdownMenuItem(
                    //         value: items,
                    //         child: Text(items),
                    //       );
                    //     }).toList(),
                    //     // After selecting the desired option,it will
                    //     // change button value to selected value
                    //     onChanged: (String? newValue) {
                    //       setState(() {
                    //         dropdownvalue = newValue!;
                    //         _utype = dropdownvalue;
                    //       });
                    //     },
                    //     dropdownColor: Colors.blueGrey[50],
                    //     //Color.fromARGB(255, 15, 174, 202),
                    //     style: TextStyle(
                    //       color: Color.fromARGB(255, 65, 64, 64),
                    //       //backgroundColor: Colors.white,
                    //     ),
                    //   ),
                    // ),

                    Container(
                      height: 70,
                      width: 500,
                      padding: EdgeInsets.only(top: 30),
                      child: ElevatedButton(
                          onPressed: () {
                            print("User Name : " + _email);
                            print("Password : " + _password);
                            authenticate();

                            // if(!_formKey.currentState.validate(_email)){
                            //     return;
                            // }

                            print("-----------------");
                            print("Login Success !!!");
                            print("-----------------");
                            print("Welcome ${_email} !");
                            print("Your Password is : ${_password}");
                            // if (_utype == "Admin") {
                            //   Fluttertoast.showToast(
                            //       msg: "Welcome Admin ! ",
                            //       toastLength: Toast.LENGTH_SHORT,
                            //       gravity: ToastGravity.CENTER,
                            //       timeInSecForIosWeb: 3,
                            //       backgroundColor: Colors.red,
                            //       textColor: Colors.white,
                            //       fontSize: 16.0);

                            // if (_formKey.currentState!.validate()) {
                            //   // If the form is valid, display a snackbar. In the real world,
                            //   // you'd often call a server or save the information in a database.
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(
                            //         content: Text('Processing Data')),
                            //   );
                            // }

                            //   Navigator.pushReplacement(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => Dashboard(
                            //                 token: '',
                            //               )));
                            // } else if (_utype == "Employee") {
                            // Fluttertoast.showToast(
                            //     msg:
                            //         "Welcome Employee ! Now You can Access Our Transactions",
                            //     toastLength: Toast.LENGTH_LONG,
                            //     gravity: ToastGravity.CENTER,
                            //     timeInSecForIosWeb: 3,
                            //     backgroundColor: Colors.red,
                            //     textColor: Colors.white,
                            //     fontSize: 16.0);

                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             EmployeeDashboard()));
                            // } else if (_utype == "Customer") {
                            //   Fluttertoast.showToast(
                            //       msg:
                            //           "Welcome Customer ! Now You can Access Our Transactions",
                            //       toastLength: Toast.LENGTH_LONG,
                            //       gravity: ToastGravity.CENTER,
                            //       timeInSecForIosWeb: 3,
                            //       backgroundColor: Colors.red,
                            //       textColor: Colors.white,
                            //       fontSize: 16.0);

                            //   Navigator.pushReplacement(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => UserDashboard()));
                            // }
                          },
                          child: Text("Sign")),
                    ),
                    Container(
                      /*child: Text("Create a new account", style: TextStyle(decoration: TextDecoration.underline, color: Color.fromARGB(240, 4, 35, 61), fontSize: 20, 
                        
                  
                  )),*/

                      child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Registration(
                                          token: '',
                                        )));
                          },
                          child: Text("Create a new account",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color.fromARGB(240, 4, 35, 61),
                                fontSize: 15,
                              ))),
                    )
                  ]),
            ))

        /*   height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                 image: DecorationImage(
                   image: NetworkImage("Image.network('https://picsum.photos/250?image=9'),"),
                 fit: BoxFit.cover),
              ),
            )
            )*/
      ]),
    ));
  }
}
