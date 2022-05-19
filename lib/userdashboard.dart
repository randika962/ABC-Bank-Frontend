import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:signapp/dashboard.dart';
import 'package:signapp/controller/transaction.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:signapp/employeedashboard.dart';
import 'package:signapp/view/about.dart';
import 'package:signapp/view/contact.dart';
import 'package:signapp/view/creditcard.dart';
import 'package:signapp/view/digital.dart';
import 'package:signapp/main.dart';
import 'package:signapp/view/profile.dart';
import 'package:signapp/view/view_account.dart';

class UserDashboard extends StatefulWidget {
  // const UserDashboard({Key? key}) : super(key: key);
  // UserDashboard({Key? key, required this.variable, String? token}) : super(key: key);
  // String? variable;
  UserDashboard({Key? key, required this.token}) : super(key: key);
  String? token;

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  // final List<String> _type = [
  //   'Admin',
  //   'Customer',
  //   'Employee',
  // ];

  final List<String> imgList = [
    'lib/assets/Images/blog.jpg',
    'lib/assets/Images/blog2.jpg',
    'lib/assets/Images/blog3.jpg',
    'lib/assets/Images/blog4.jpg',
    'lib/assets/Images/blog5.jpg',
    'lib/assets/Images/blog6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ABC Customer Dashboard"),
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
                    "Customer SignOut",
                    style: TextStyle(color: Colors.yellow),
                  ))),
        ],
      ),
      body: Container(
        child: Row(children: [
          Expanded(
              flex: 3,
              child: Container(
                color: Color.fromARGB(255, 0, 10, 39),
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox(height: 80),
                      Image.asset('lib/assets/Images/dashboard.png'),
                      SizedBox(width: 20),
                      Container(
                          padding: EdgeInsets.only(bottom: 25),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Dashboard(token: widget.token)));
                            },
                            child: Text(
                              "Dashboard",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          )),
                      SizedBox(width: 12),
                      Image.asset('lib/assets/Images/info.png'),
                      SizedBox(width: 20),
                      Container(
                          padding: EdgeInsets.only(bottom: 25),
                          child: TextButton(
                            onPressed: () {
                              // if (_type == "Admin") {
                              //   Navigator.pushReplacement(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => Dashboard(
                              //               token: '', variable: _type[0])));
                              // } else if (_type == "Customer") {
                              //   Navigator.pushReplacement(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) =>
                              //               UserDashboard(variable: _type[1])));
                              // } else if (_type == "Employee") {
                              //   Navigator.pushReplacement(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => EmployeeDashboard(
                              //               variable: _type[2])));
                              // }
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          About(token: widget.token)));
                            },
                            child: Text(
                              "Info",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          )),
                      SizedBox(width: 12),
                      Image.asset('lib/assets/Images/users.png'),
                      SizedBox(width: 20),
                      Container(
                          padding: EdgeInsets.only(bottom: 25),
                          child: TextButton(
                            onPressed: () {
                              // if (_type == "Customer") {
                              //   Navigator.pushReplacement(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) =>
                              //               UserDashboard(variable: _type[0])));
                              // } else if (_type == "Employee") {
                              //   Navigator.pushReplacement(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => EmployeeDashboard(
                              //               variable: _type[1])));
                              // }
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Profile(token: widget.token)));
                            },
                            child: Text(
                              "User Profile",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          )),
                      SizedBox(width: 12),
                      Image.asset('lib/assets/Images/users.png'),
                      SizedBox(width: 20),
                      Container(
                          padding: EdgeInsets.only(bottom: 25),
                          child: TextButton(
                            onPressed: () {
                              // if (_type == "Customer") {
                              //   Navigator.pushReplacement(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) =>
                              //               UserDashboard(variable: _type[0])));
                              // } else if (_type == "Employee") {
                              //   Navigator.pushReplacement(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => EmployeeDashboard(
                              //               variable: _type[1])));
                              // }
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ViewAccount(token: widget.token)));
                            },
                            child: Text(
                              "View Account",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          )),
                      SizedBox(width: 12),
                      Image.asset('lib/assets/Images/transac.png'),
                      SizedBox(width: 20),
                      Container(
                          padding: EdgeInsets.only(bottom: 25),
                          child: TextButton(
                            onPressed: () {
                              // if (_type == "Customer") {
                              //   Navigator.pushReplacement(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) =>
                              //               UserDashboard(variable: _type[0])));
                              // } else if (_type == "Employee") {
                              //   Navigator.pushReplacement(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => EmployeeDashboard(
                              //               variable: _type[1])));
                              // }
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Transaction(token: widget.token)));
                            },
                            child: Text(
                              "Transaction",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          )),
                      SizedBox(width: 12),
                      Image.asset('lib/assets/Images/deposit.png'),
                      SizedBox(width: 20),
                      Container(
                          padding: EdgeInsets.only(bottom: 25),
                          child: TextButton(
                            onPressed: () {
                              // if (_type == "Admin") {
                              //   Navigator.pushReplacement(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => Dashboard(
                              //               token: '', variable: _type[0])));
                              // } else if (_type == "Customer") {
                              //   Navigator.pushReplacement(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) =>
                              //               UserDashboard(variable: _type[1])));
                              // } else if (_type == "Employee") {
                              //   Navigator.pushReplacement(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => EmployeeDashboard(
                              //               variable: _type[2])));
                              // }
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CreditCard(token: widget.token)));
                            },
                            child: Text(
                              "Credit Cards",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          )),
                      SizedBox(width: 12),
                      Image.asset('lib/assets/Images/withdraw.png'),
                      SizedBox(width: 20),
                      Container(
                          padding: EdgeInsets.only(bottom: 25),
                          child: TextButton(
                            onPressed: () {
                              // if (_type == "Admin") {
                              //   Navigator.pushReplacement(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => Dashboard(
                              //               token: '', variable: _type[0])));
                              // } else if (_type == "Customer") {
                              //   Navigator.pushReplacement(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) =>
                              //               UserDashboard(variable: _type[1])));
                              // } else if (_type == "Employee") {
                              //   Navigator.pushReplacement(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => EmployeeDashboard(
                              //               variable: _type[2])));
                              // }
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Digital(token: widget.token)));
                            },
                            child: Text(
                              "Digital Banking",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          )),
                      SizedBox(width: 12),
                      Image.asset('lib/assets/Images/help.png'),
                      SizedBox(width: 20),
                      Container(
                          padding: EdgeInsets.only(bottom: 25),
                          child: TextButton(
                            onPressed: () {
                              // if (_type == "Admin") {
                              //   Navigator.pushReplacement(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => Dashboard(
                              //               token: '', variable: _type[0])));
                              // } else if (_type == "Customer") {
                              //   Navigator.pushReplacement(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) =>
                              //               UserDashboard(variable: _type[1])));
                              // } else if (_type == "Employee") {
                              //   Navigator.pushReplacement(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => EmployeeDashboard(
                              //               variable: _type[2])));
                              // }
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Contact(token: widget.token)));
                            },
                            child: Text(
                              "Help & Contact",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          )),
                    ]),
              )),
          Expanded(
              flex: 9,
              child: Container(
                //color: Color.fromARGB(255, 105, 133, 226),
                // color: Color.fromARGB(255, 163, 176, 219),
                color: Color.fromARGB(255, 5, 20, 66),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: CarouselSlider(
                          options: CarouselOptions(
                              autoPlay: true,
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                              disableCenter: true,
                              height: 300.0),
                          items: [1, 2, 3, 4, 5].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(

                                    // margin:
                                    //     EdgeInsets.symmetric(horizontal: 0),
                                    // decoration:
                                    //     BoxDecoration(color: Colors.amber),
                                    child: Image.asset(imgList[i]));
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      // Image.asset('lib/assets/Images/blog.jpg'),
                      SizedBox(height: 60),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              color: Color.fromARGB(255, 5, 20, 66),
                              height: 160,
                              width: 30,
                            ),
                            Container(
                              alignment: Alignment.center,
                              color: Color.fromARGB(255, 230, 150, 30),
                              height: 160,
                              width: 300,
                              child: Text(
                                r"Balance $",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              color: Color.fromARGB(255, 5, 20, 66),
                              height: 160,
                              width: 30,
                            ),
                            Container(
                              alignment: Alignment.center,
                              color: Color.fromARGB(255, 61, 151, 117),
                              height: 160,
                              width: 300,
                              child: Text(
                                "Savings #",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              color: Color.fromARGB(255, 5, 20, 66),
                              height: 160,
                              width: 30,
                            ),
                            Container(
                              alignment: Alignment.center,
                              color: Color.fromARGB(255, 189, 49, 49),
                              height: 160,
                              width: 300,
                              child: Text(
                                "Interests %",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 40),
                          child: Text(
                            "ABC @ 2022 All rights reserved",
                            style: TextStyle(color: Color.fromARGB(255, 226, 210, 210), fontSize: 10),
                          )),
                    ]),
              ))
        ]),
      ),
    );
  }
}
