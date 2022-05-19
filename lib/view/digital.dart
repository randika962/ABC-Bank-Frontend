import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:signapp/dashboard.dart';
import 'package:signapp/employeedashboard.dart';
import 'package:signapp/main.dart';
import 'package:signapp/userdashboard.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Digital Banking',
//         theme: ThemeData(
//             // primarySwatch: Colors.blue,
//             ),
//         home: Digital(variable: '',));
//   }
// }

class Digital extends StatefulWidget {
  // const Digital({Key? key}) : super(key: key);
  // Digital({Key? key,  required this.variable}) : super(key: key);
  // String? variable;
  Digital({Key? key, required this.token}) : super(key: key);
  String? token;
  // String? variable;

  @override
  State<Digital> createState() => _DigitalState();
}

class _DigitalState extends State<Digital> {
  //   final List<String> _type = [
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
        title: Text("Welocome To ABC Digital Banking !"),
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
                                Dashboard(token: widget.token)));
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(color: Colors.yellow),
                  ))),
        ],
      ),
      body: Container(
        // color: Color.fromARGB(255, 163, 176, 219),
        color: Color.fromARGB(255, 5, 20, 66),
        child: Column(
          children: [
            SizedBox(height: 40),
            Container(
                child: Text(
              "ABC Digital",
              style: TextStyle(
                  color: Color.fromARGB(255, 226, 210, 210), fontSize: 30),
            )),
            SizedBox(height: 10),
            Container(
                child: Text(
              "Bank ABC offers retail banking products and services through its subsidiaries in Algeria, Egypt, Jordan and Tunisia. Led by the Digital Banking and Retail department at the head office in Bahrain, the Bank’s retail business has established a significant distribution footprint and has invested substantially in technology to offer diversified regional and segment specific products and service delivery across all the geographies. Bank ABC offers traditional and bespoke products and services through a team of well-trained and customer-centric staff and on a variety of distribution platforms. The Retail Banking teams are committed to provide impeccable customer experience across a variety of service platforms and customer touch points. By developing holistic personalised financial solutions built around customer needs and aspirations, our products and services are lifestyle aligned enabling our customers to realize their financial goals. ​Bank ABC has embraced digital in a number of innovative initiatives. With ABC Digital, the Bank’s state-of the art online banking platform, it has successfully implemented one of the most vital phases of its digital strategy that aims at providing seamless and comprehensive online banking services to clients.",
              style: TextStyle(color: Color.fromARGB(255, 226, 210, 210), fontSize: 15),
            )),
            SizedBox(height: 20),
            Container(
                child: Text(
              "​A variety of functions and features",
              style: TextStyle(
                  color: Color.fromARGB(255, 226, 210, 210), fontSize: 30),
            )),
            SizedBox(height: 5),
            Container(
                child: Text(
              "\n 1. Grant access to multiple users through an Entitlements Engine. \n 2. Electronic transfer of funds both domestically and internationally. \n 3. Manage your accounts. \n 4. Create recurring payments. \n 5. View transaction history. ",
              style: TextStyle(color: Color.fromARGB(255, 226, 210, 210), fontSize: 15),
            )),
            Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "ABC @ 2022 All rights reserved",
                  style: TextStyle(color: Color.fromARGB(255, 226, 210, 210), fontSize: 10),
                )),
            Image.asset('lib/assets/Images/digital.png'),
          ],
        ),
      ),
    );
  }
}
