import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:signapp/dashboard.dart';
import 'package:signapp/employeedashboard.dart';
import 'package:signapp/userdashboard.dart';
import 'package:signapp/main.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Credit Card',
//         theme: ThemeData(
//             // primarySwatch: Colors.blue,
//             ),
//         home: CreditCard());
//   }
// }

class CreditCard extends StatefulWidget {
  // const CreditCard({Key? key}) : super(key: key);
  // CreditCard({Key? key,  required this.variable}) : super(key: key);
  // String? variable;
  CreditCard({Key? key, required this.token}) : super(key: key);
  String? token;
  // String? variable;

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  //    final List<String> _type = [
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
        title: Text("ABC Credit Card Section"),
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
              "Featured Credit Cards",
              style: TextStyle(
                  color: Color.fromARGB(255, 226, 210, 210), fontSize: 30),
            )),
            SizedBox(height: 10),
            Container(
                child: Text(
              "Explore Cities credit card offers, featuring exclusive perks and benefits to reward your spending. From cash back and travel cards, to low introductory APR on balance transfers, Citi has the right credit card for you. Browse our full range of credit card categories, or use Citi's card comparison tool to discover features and help you choose the best credit card to fit your needs. Simply check the box next to your 3 favorite cards to compare the various benefits, rewards, fees and offers. When you're ready, select the credit card you would like to learn more about and apply online.",
              style: TextStyle(color: Color.fromARGB(255, 226, 210, 210), fontSize: 15),
            )),
            SizedBox(height: 30),
            Image.asset('lib/assets/Images/credit.png'),
            Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "ABC @ 2022 All rights reserved",
                  style: TextStyle(color: Color.fromARGB(255, 226, 210, 210), fontSize: 10),
                )),
          ],
        ),
      ),
    );
  }
}
