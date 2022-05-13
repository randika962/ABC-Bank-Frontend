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
        home: Registration());
  }
}

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String _firstname = "";
  String _lastname = "";
  String _address = "";
  String _email = "";
  String _password = "";
  String _thme = "";

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
        color: Color.fromARGB(255, 163, 176, 219),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: 220, right: 220),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(255, 6, 34, 56),
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    labelText: "Enter Your First Name",
                    labelStyle: TextStyle(color: Colors.black),
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
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: 220, right: 220),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(255, 6, 34, 56),
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    labelText: "Enter Your Last Name",
                    labelStyle: TextStyle(color: Colors.black),
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
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: 220, right: 220),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(255, 6, 34, 56),
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    labelText: "Enter Your Address",
                    labelStyle: TextStyle(color: Colors.black),
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
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: 220, right: 220),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(255, 6, 34, 56),
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    labelText: "Enter Your Email",
                    labelStyle: TextStyle(color: Colors.black),
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
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: 220, right: 220),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(255, 6, 34, 56),
                    fontSize: 15,
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Enter Your Password",
                    labelStyle: TextStyle(color: Colors.black),
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
              SizedBox(height: 40),
              Container(
                height: 100,
                width: 500,
                padding: EdgeInsets.only(top: 50),
                child: ElevatedButton(
                    onPressed: () {
                      
                      showAlertDialog(context);  

                      print("------------------------");
                      print("Registration Success !!!");
                      print("------------------------");
                      print("Your FirstName is : ${_firstname}");
                      print("Your LastName is : ${_lastname}");
                      print("Your Residential Address is : ${_address}");
                      print("Your Email is : ${_email}");
                      print("Your Password is : ${_password}");

                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text("Register")),
              ),
              SizedBox(height: 50),
              Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "ABC @ 2022 All rights reserved",
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  )),
              // SizedBox(height: 20),
            ]),
      ),
    );
  }
}
