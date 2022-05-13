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
        title: 'Credit Card',
        theme: ThemeData(
            // primarySwatch: Colors.blue,
            ),
        home: CreditCard());
  }
}

class CreditCard extends StatefulWidget {
  const CreditCard({Key? key}) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
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
        title: Text("ABC Credit Card Section"),
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
        color: Color.fromARGB(255, 163, 176, 219),
        child: Column(
          children: [
            SizedBox(height: 40),
            Container(
                child: Text(
              "Featured Credit Cards",
              style: TextStyle(
                  color: Color.fromARGB(255, 77, 13, 13), fontSize: 30),
            )),
            SizedBox(height: 10),
            Container(
                child: Text(
              "Explore Cities credit card offers, featuring exclusive perks and benefits to reward your spending. From cash back and travel cards, to low introductory APR on balance transfers, Citi has the right credit card for you. Browse our full range of credit card categories, or use Citi's card comparison tool to discover features and help you choose the best credit card to fit your needs. Simply check the box next to your 3 favorite cards to compare the various benefits, rewards, fees and offers. When you're ready, select the credit card you would like to learn more about and apply online.",
              style: TextStyle(color: Colors.black, fontSize: 15),
            )),
            SizedBox(height: 30),
            Image.asset('lib/assets/Images/credit.png'),
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
