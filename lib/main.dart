import 'package:flutter/material.dart';
import 'package:signapp/registration.dart';
import 'package:signapp/userdashboard.dart';
import 'package:signapp/dashboard.dart';
import 'package:signapp/employeedashboard.dart';
import 'package:http/http.dart' as http;

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
  const LoginPage({Key? key}) : super(key: key);


  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {


 void autenticate (
 
)
async{var response = await http.post(Uri.parse("http://localhost:8080/authenticate"),headers: {"Content-Type": "application/json"},body: {  "userEmail": "sri@gmail.com",
        "password": "1234uiyt"});
print("statuscode");
print(response.statusCode);

}


  String _email = "";
  String _password = "";
  String _utype = "";

  String dropdownvalue = 'Select Your User Type';

  // List of items in our dropdown menu
  var items = [
    'Select Your User Type',
    'User',
    'Admin',
    'Employee',
  ];

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
                        style: TextStyle(color: Color.fromARGB(255, 6, 34, 56)),
                        decoration: InputDecoration(
                          labelText: "UserMail",
                          labelStyle: TextStyle(color: Colors.black),
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
                          counterText: 'Forgot password?',
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
                    Container(
                      height: 40,
                      width: 500,
                      child: DropdownButton(
                        // Initial Value
                        value: dropdownvalue,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            _utype = dropdownvalue;
                          });
                        },
                        dropdownColor:  Colors.blueGrey[50],
                        //Color.fromARGB(255, 15, 174, 202),
                        style: TextStyle(
                          color: Color.fromARGB(255, 65, 64, 64),
                          //backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                      Container(
                      height: 3,
                      width: 500,
                      padding: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 51, 47, 47),
                            blurRadius: 3,
                            offset: Offset(3, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 500,
                      padding: EdgeInsets.only(top: 30),
                      child: ElevatedButton(
                          onPressed: () {
                            
                            autenticate();

                            print("-----------------");
                            print("Login Success !!!");
                            print("-----------------");
                            print("Welcome ${_email} !");
                            print("Your Password is : ${_password}");
                            if (_utype == "Admin") {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard()));
                            } else if (_utype == "Employee") {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EmployeeDashboard()));
                            } else if (_utype == "User") {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserDashboard()));
                            }
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
                                    builder: (context) => Registration()));
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
