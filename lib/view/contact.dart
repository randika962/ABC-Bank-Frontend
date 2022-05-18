import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:signapp/dashboard.dart';
import 'package:signapp/userdashboard.dart';
import 'package:signapp/employeedashboard.dart';
import 'package:signapp/main.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Help & Contact',
//         theme: ThemeData(
//             // primarySwatch: Colors.blue,
//             ),
//         home: Contact());
//   }
// }

class Contact extends StatefulWidget {
  // const Contact({Key? key}) : super(key: key);
  // Contact({Key? key,  required this.variable}) : super(key: key);
  // String? variable;
  Contact({Key? key, required this.token}) : super(key: key);
  String? token;
  // String? variable;

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  String _helpy = "";

  //  final List<String> _type = [
  //   'Admin',
  //   'Customer',
  //   'Employee',
  // ];

  // String _utype = "";

  // String dropdownvalue = 'Select Your User Type';

  // // List of items in our dropdown menu
  // var items = [
  //   'Select Your User Type',
  //   'Customer',
  //   'Admin',
  //   'Employee',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help & Contact"),
        foregroundColor: Colors.cyan,
        backgroundColor: Colors.black,
        actions: [
          // Container(
          //   height: 40,
          //   padding: EdgeInsets.only(left: 30),
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
              padding: EdgeInsets.only(left: 100),
              child: TextButton(
                  onPressed: () {
                    // if (_type == "Admin") {
                    //   Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => Dashboard(
                    //                 token: '',variable: _type[0]
                    //               )));
                    // } else if (_type == "Customer") {
                    //   Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => UserDashboard(variable: _type[1])));
                    // } else if (_type == "Employee") {
                    //   Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => EmployeeDashboard(variable: _type[2])));
                    // }
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UserDashboard(token: widget.token)));
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(color: Colors.yellow),
                  ))),
        ],
      ),
      body: Container(
        color: Color.fromARGB(255, 163, 176, 219),
        child: Column(
          children: [
            SizedBox(height: 40),
            Container(
                child: Text(
              "CONTACT US",
              style: TextStyle(
                  color: Color.fromARGB(255, 77, 13, 13), fontSize: 30),
            )),
            SizedBox(height: 10),
            Container(
                child: Text(
              "American Bank of Commerce welcomes your questions and comments. Please contact us toll free at 888-902-2552, at one of our local branch phone numbers listed below or complete our easy Email Us form at the bottom of this page.",
              style: TextStyle(color: Colors.black, fontSize: 15),
            )),
            SizedBox(height: 20),
            Container(
                child: Text(
              "LOCAL TELEBANK PHONE NUMBERS",
              style: TextStyle(
                  /*color: Color.fromARGB(255, 170, 236, 13),*/ color:
                      Color.fromARGB(255, 77, 13, 13),
                  fontSize: 30),
            )),
            SizedBox(height: 5),
            Container(
                child: Text(
              "\n West Texas: (806) 775-5090 \n Austin: (512) 391-5999 \n Addison: (972) 386-1290 \n Colorado Springs: (719) 667-8090 \n Pueblo, Colorado: (719) 595-7390 ",
              style: TextStyle(color: Colors.black, fontSize: 15),
            )),
            SizedBox(height: 20),
            Container(
                child: Text(
              "Help",
              style: TextStyle(
                  color: Color.fromARGB(255, 77, 13, 13), fontSize: 30),
            )),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 220, right: 220),
              child: TextFormField(
                style: TextStyle(
                  color: Color.fromARGB(255, 6, 34, 56),
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  labelText: "What can we help you with? ",
                  labelStyle: TextStyle(color: Colors.black),
                  suffixIcon: const Icon(Icons.help, color: Colors.grey),
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
                  _helpy = val;
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
                padding: EdgeInsets.only(left: 220, right: 220),
                child: Text(
                  "Caution: Please do not send your account number, social security number, passwords, or any other confidential information via regular email. Such information is transmitted over an unsecured connection.",
                  style: TextStyle(
                      color: Color.fromARGB(255, 23, 92, 14), fontSize: 15),
                )),
            SizedBox(height: 30),
            Container(
              height: 50,
              width: 500,
              padding: EdgeInsets.only(left: 120, right: 120),
              child: ElevatedButton(
                  onPressed: () {
                    print("------------------------");
                    print("Contact Success !!!");
                    print("------------------------");
                    print(_helpy);

                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Message Submit Successful !')));

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Dashboard(
                                  token: '',
                                )));
                  },
                  child: Text("Submit")),
            ),
            // SizedBox(height: 20),
            Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "ABC @ 2022 All rights reserved",
                  style: TextStyle(color: Colors.black, fontSize: 10),
                )),
          ],
        ),
      ),
    );
  }
}
