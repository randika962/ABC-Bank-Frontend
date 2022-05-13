import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:signapp/dashboard.dart';
import 'package:signapp/employeedashboard.dart';
import 'package:signapp/userdashboard.dart';
import 'package:signapp/main.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'About Us',
        theme: ThemeData(
            // primarySwatch: Colors.blue,
            ),
        home: About());
  }
}

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {

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
      appBar: AppBar(
        title: Text("Welocome To ABC Info !"),
        foregroundColor: Colors.cyan,
        backgroundColor: Colors.black,
        actions: [
           Container(
            height: 40,
            padding: EdgeInsets.only(left: 30),
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
              dropdownColor: Colors.blueGrey[50],
              //Color.fromARGB(255, 15, 174, 202),
              style: TextStyle(
                color: Color.fromARGB(255, 65, 64, 64),
                //backgroundColor: Colors.white,
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 100),
              child: TextButton(
                  onPressed: () {
                     if (_utype == "Admin") {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Dashboard()));
                    } else if (_utype == "Employee") {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmployeeDashboard()));
                    } else if (_utype == "User") {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserDashboard()));
                    }
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(color: Colors.yellow),
                  ))),
        ],
      ),
      body: Container(
        //color: Color.fromARGB(255, 105, 133, 226),
        color: Color.fromARGB(255, 163, 176, 219),
        child: Column(
          children: [
            Image.asset('lib/assets/Images/history.png'),
            SizedBox(height: 20),
            Container(
                child: Text(
              "HISTORY",
              style: TextStyle(
                  color: Color.fromARGB(255, 77, 13, 13), fontSize: 30),
            )),
            SizedBox(height: 10),
            Container(
                child: Text(
              "The American Bank of Commerce first opened for business as Wolfforth State Bank on September 11, 1962 with James S. Moore as chairman of the board.  In January 1963, Wolfforth State Bank moved from temporary facilities to its first home in downtown Wolfforth, Texas.  Wolfforth State Bank changed its name to American Bank of Commerce at Wolfforth on June 1, 1972.",
              style: TextStyle(color: Colors.black, fontSize: 15),
            )),
            SizedBox(height: 20),
            Container(
                child: Text(
              "EXPANSION AND GROWTH",
              style: TextStyle(
                  color: Color.fromARGB(255, 77, 13, 13), fontSize: 30),
            )),
            SizedBox(height: 10),
            Container(
                child: Text(
              "Over the years, the bank has focused on healthy expansion and growth.  American Bank of Commerce now operates four banking centers in Lubbock, Texas, six banking centers in Austin, Texas, two in the Dallas area, one in Colorado Springs, and one in Pueblo, Colorado. In March 2019, American Bank of Commerce purchased Infinity Mortgage Holdings, LLC as a wholly owned subsidiary of American Bank of Commerce.  The bank is excited to now offer a full suite of mortgage products, programs, and resources to our valued customers. In June 2020, American Bank of Commerce expanded its services once again with the launch of American Insurance Partners, LLC.  American Insurance Partners is an independent insurance agency located in Georgetown, Texas and provides a broad range of insurance products and services from the finest insurance carriers. In February 2022, American Bank of Commerce merged Infinity Mortgage into the bank, and our mortgage division now operates under the dba ABC Bank Home Loans.  The bank is proud to continue to extend its mortgage services with Mortgage Loan Originators serving Texas and Colorado offering Conventional, FHA and VA loan programs with competitive rates and fees.",
              style: TextStyle(color: Colors.black, fontSize: 15),
            )),
            SizedBox(height: 30),
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
