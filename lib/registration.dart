import 'dart:html';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:signapp/main.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ABC Registration',
        theme: ThemeData(
            // primarySwatch: Colors.blue,
            ),
        home: Registration(
          token: '',
        ));
  }
}

class Registration extends StatefulWidget {
  // const Registration({Key? key}) : super(key: key);
  Registration({Key? key, required this.token}) : super(key: key);
  String? token;

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String _firstname = "";
  String _lastname = "";
  String _address = "";
  String _email = "";
  String _password = "";
  String _typeuser = "";
  String _thme = "";

  // String _utype = "";
  var body = {};
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
    regidit();
  }

  void regidit() async {
    setState(() {
      _loading = true;
    });
    var body = {};

    body["fName"] = _firstname;
    body["lName"] = _lastname;
    body["address"] = _address;
    body["userEmail"] = _email;
    body["password"] = _password;
    body["type"] = _typeuser;
    String bodyjson = json.encode(body);

    // var data = {'fName' : _firstname, 'lName' : _lastname, 'address' : _address, 'userEmail' : _email, 'password' : _password, 'type' : _typeuser};
    var response = await http.post(
      Uri.parse("http://localhost:8080/createbankusers"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer  ${widget.token}"
      },
      body: bodyjson,
    );
    print("statuscode");
    print(response.statusCode);
    print(widget.token);
  }

  void Mbox(BuildContext context) {
    showAlertDialog(BuildContext context) {
      // set up the button
      Widget okButton = TextButton(
        child: Text("OK"),
        onPressed: () {},
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Success!"),
        content: Text("Welcome! Now you can access to login our site."),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome To ABC Registration !"),
        foregroundColor: Colors.cyan,
        backgroundColor: Colors.black,
        actions: [
          Container(
              padding: EdgeInsets.only(left: 100),
              child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    "Cancel Registration",
                    style: TextStyle(color: Colors.yellow),
                  ))),
        ],
      ),
      body: Container(
        //color: Color.fromARGB(255, 105, 133, 226),
        // color: Color.fromARGB(255, 163, 176, 219),
        color: Color.fromARGB(255, 5, 20, 66),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 220, right: 220),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  style: TextStyle(
                    color: Color.fromARGB(255, 6, 34, 56),
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter Your First Name",
                    hintStyle: TextStyle(color: Colors.black),
                    counterText: 'This Field Must be Required !',
                    counterStyle: TextStyle(
                        color: Color.fromARGB(255, 251, 255, 12), fontSize: 12),
                    suffixIcon:
                        const Icon(Icons.account_box, color: Colors.grey),
                    fillColor: Colors.blueGrey[50],
                    filled: true,
                    alignLabelWithHint: true,
                    contentPadding: const EdgeInsets.only(left: 30),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.green)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey)),
                  ),
                  onChanged: (val) {
                    _firstname = val;
                  },
                ),
              ),
              // SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 220, right: 220),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(255, 6, 34, 56),
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter Your Last Name",
                    hintStyle: TextStyle(color: Colors.black),
                    counterText: 'This Field Must be Required !',
                    counterStyle: TextStyle(
                        color: Color.fromARGB(255, 251, 255, 12), fontSize: 12),
                    suffixIcon: const Icon(Icons.people, color: Colors.grey),
                    fillColor: Colors.blueGrey[50],
                    filled: true,
                    alignLabelWithHint: true,
                    contentPadding: const EdgeInsets.only(left: 30),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.green)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey)),
                  ),
                  onChanged: (val2) {
                    _lastname = val2;
                  },
                ),
              ),
              // SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 220, right: 220),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(255, 6, 34, 56),
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter Your Address",
                    hintStyle: TextStyle(color: Colors.black),
                    counterText: 'This Field Must be Required !',
                    counterStyle: TextStyle(
                        color: Color.fromARGB(255, 251, 255, 12), fontSize: 12),
                    suffixIcon:
                        const Icon(Icons.location_city, color: Colors.grey),
                    fillColor: Colors.blueGrey[50],
                    filled: true,
                    alignLabelWithHint: true,
                    contentPadding: const EdgeInsets.only(left: 30),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.green)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey)),
                  ),
                  onChanged: (val3) {
                    _address = val3;
                  },
                ),
              ),
              // SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 220, right: 220),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(255, 6, 34, 56),
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter Your Email",
                    hintStyle: TextStyle(color: Colors.black),
                    counterText:
                        'This Field Must be Required ! Must be Contain "@" and ".com"',
                    counterStyle: TextStyle(
                        color: Color.fromARGB(255, 251, 255, 12), fontSize: 12),
                    suffixIcon: const Icon(Icons.email, color: Colors.grey),
                    fillColor: Colors.blueGrey[50],
                    filled: true,
                    alignLabelWithHint: true,
                    contentPadding: const EdgeInsets.only(left: 30),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.green)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey)),
                  ),
                  onChanged: (val4) {
                    _email = val4;
                  },
                ),
              ),
              // SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 220, right: 220),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(255, 6, 34, 56),
                    fontSize: 15,
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter Your Password",
                    hintStyle: TextStyle(color: Colors.black),
                    counterText:
                        'This Field Must be Required ! Must be "8 Characters"',
                    counterStyle: TextStyle(
                        color: Color.fromARGB(255, 251, 255, 12), fontSize: 12),
                    suffixIcon: const Icon(Icons.lock, color: Colors.grey),
                    fillColor: Colors.blueGrey[50],
                    filled: true,
                    //  hintText: "Enter Your Password",
                    //  hintStyle: TextStyle(color: Colors.black),
                    alignLabelWithHint: true,
                    contentPadding: const EdgeInsets.only(left: 30),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.green)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey)),
                  ),
                  onChanged: (val5) {
                    //print(val);
                    _password = val5;
                  },
                ),
              ),
              // SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 220, right: 220),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(255, 6, 34, 56),
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    hintText:
                        "If You Are Customer, Enter 'C' Or If You Are Employee, Enter 'E'",
                    hintStyle: TextStyle(color: Colors.black),
                    counterText: 'This Field Must be Required !',
                    counterStyle: TextStyle(
                        color: Color.fromARGB(255, 251, 255, 12), fontSize: 12),
                    suffixIcon: const Icon(Icons.supervised_user_circle_sharp,
                        color: Colors.grey),
                    fillColor: Colors.blueGrey[50],
                    filled: true,
                    alignLabelWithHint: true,
                    contentPadding: const EdgeInsets.only(left: 30),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.green)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey)),
                  ),
                  onChanged: (val6) {
                    _typeuser = val6;
                  },
                ),
              ),
              SizedBox(height: 5),
              Container(
                height: 100,
                width: 500,
                padding: EdgeInsets.only(top: 50),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                                primary: Colors.deepPurple, // background
                                onPrimary: Colors.white, // foreground
                              ),
                    onPressed: () {
                      // showAlertDialog(context);
                      print("User Email : " + _email);
                      regidit();

                      Mbox(context);

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Your Registration Succesfull !')));

                      print("------------------------");
                      print("Registration Success !!!");
                      print("------------------------");
                      print("Your FirstName is : ${_firstname}");
                      print("Your LastName is : ${_lastname}");
                      print("Your Residential Address is : ${_address}");
                      print("Your Email is : ${_email}");
                      print("Your Password is : ${_password}");
                      print("Your User Type is : ${_typeuser}");

                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text("Register")),
              ),
              SizedBox(height: 10),
              Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "ABC @ 2022 All rights reserved",
                    style: TextStyle(color: Color.fromARGB(255, 226, 210, 210), fontSize: 10),
                  )),
              // SizedBox(height: 20),
            ]),
      ),
    );
  }
}
