import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:signapp/employeedashboard.dart';
import 'package:signapp/userdashboard.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:math_expressions/math_expressions.dart';
import 'controller/indicator.dart';
import 'package:signapp/view/about.dart';
import 'package:signapp/controller/account.dart';
import 'package:signapp/view/contact.dart';
import 'package:signapp/view/creditcard.dart';
import 'package:signapp/view/digital.dart';
import 'package:signapp/controller/transaction.dart';
import 'package:signapp/main.dart';
import 'package:signapp/controller/users.dart';
import 'package:signapp/model/user_response.dart';
import 'package:signapp/view/view_transaction.dart';

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  MyApp({Key? key, required this.token}) : super(key: key);
  String? token;
  // String? variable;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ABC Dashboard',
        theme: ThemeData(
            // primarySwatch: Colors.blue,
            ),
        home: Dashboard(
          token: token,
        ));
  }
}

class Dashboard extends StatefulWidget {
  Dashboard({Key? key, required this.token}) : super(key: key);
  String? token;
  // String? variable;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // final List<String> _type = [
  //   'Admin',
  //   'Customer',
  //   'Employee',
  // ];

  // String atype = "Admin";
  // String ctype = "Customer";
  // String etype = "Employee";

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
          title: Text("ABC Admin Dashboard"),
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
                      "Admin SignOut",
                      style: TextStyle(color: Colors.yellow),
                    ))),
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
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
                        Container(
                            padding: EdgeInsets.only(bottom: 20),
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
                        Image.asset('lib/assets/Images/info.png'),
                        SizedBox(width: 8),
                        Container(
                            padding: EdgeInsets.only(bottom: 20),
                            child: TextButton(
                              onPressed: () {
                                // print(_type);
                                //   if (_type == "Admin") {
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
                        Image.asset('lib/assets/Images/users.png'),
                        SizedBox(width: 8),
                        Container(
                            padding: EdgeInsets.only(bottom: 20),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Account(
                                              token: widget.token,
                                            )));
                              },
                              child: Text(
                                "Manage Accounts",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            )),
                        Image.asset('lib/assets/Images/users.png'),
                        SizedBox(width: 8),
                        Container(
                            padding: EdgeInsets.only(bottom: 20),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Userz(token: widget.token)));
                              },
                              child: Text(
                                "Manage Users",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            )),
                        Image.asset('lib/assets/Images/deposit.png'),
                        SizedBox(width: 8),
                        Container(
                            padding: EdgeInsets.only(bottom: 20),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewTransaction(
                                            token: widget.token)));
                              },
                              child: Text(
                                "View Transactions",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            )),
                        Image.asset('lib/assets/Images/deposit.png'),
                        SizedBox(width: 8),
                        Container(
                            padding: EdgeInsets.only(bottom: 20),
                            child: TextButton(
                              onPressed: () {
                                //   if (_type == "Admin") {
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
                        Image.asset('lib/assets/Images/withdraw.png'),
                        SizedBox(width: 8),
                        Container(
                            padding: EdgeInsets.only(bottom: 20),
                            child: TextButton(
                              onPressed: () {
                                //   if (_type == "Admin") {
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
                        Image.asset('lib/assets/Images/help.png'),
                        SizedBox(width: 8),
                        Container(
                            padding: EdgeInsets.only(bottom: 20),
                            child: TextButton(
                              onPressed: () {
                                //   if (_type == "Admin") {
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

            // -------------------------Carousel Slider Code-------------------------

            // Carousel(
            //   dotSpacing: 15.0,
            //   dotSize: 6.0,
            //   dotIncreasedColor: Colors.red,
            //   dotBgColor: Colors.transparent,
            //   indicatorBgPadding: 10.0,
            //   dotPosition: DotPosition.topCenter,
            //   images: images
            //       .map((item) => Container(
            //             child: Image.asset(
            //               item,
            //               fit: BoxFit.cover,
            //             ),
            //           ))
            //       .toList(),
            // ),

            Expanded(
                flex: 9,
                child: Container(
                  //   //color: Color.fromARGB(255, 105, 133, 226),
                  // color: Color.fromARGB(255, 163, 176, 219),
                  color: Color.fromARGB(255, 5, 20, 66),
                  width: MediaQuery.of(context).size.width,
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
                              // Container(
                              // decoration: BoxDecoration(
                              //     color: Colors.blue,
                              //     borderRadius: BorderRadius.circular(30),
                              //     boxShadow: [
                              //       BoxShadow(
                              //           color: Colors.deepPurple,
                              //           spreadRadius: 10,
                              //           blurRadius: 20),
                              //     ]),
                              // child: PieChartSample2(),
                              // width: 300,
                              // ),
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
                              style:
                                  TextStyle(color: Color.fromARGB(255, 226, 210, 210), fontSize: 10),
                            )),
                      ]),
                )),
          ]),
        ));
  }
}

// class PieChartSample2 extends StatefulWidget {
//   const PieChartSample2({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => PieChart2State();
// }

// class PieChart2State extends State {
//   int touchedIndex = -1;

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1.3,
//       child: Card(
//         color: Colors.white,
//         child: Row(
//           children: <Widget>[
//             Container(
//                 child: Column(
//               children: [
//                 Expanded(
//                   child: AspectRatio(
//                     aspectRatio: 1,
//                     child: PieChart(
//                       PieChartData(
//                           pieTouchData: PieTouchData(touchCallback:
//                               (FlTouchEvent event, pieTouchResponse) {
//                             setState(() {
//                               if (!event.isInterestedForInteractions ||
//                                   pieTouchResponse == null ||
//                                   pieTouchResponse.touchedSection == null) {
//                                 touchedIndex = -1;
//                                 return;
//                               }
//                               touchedIndex = pieTouchResponse
//                                   .touchedSection!.touchedSectionIndex;
//                             });
//                           }),
//                           borderData: FlBorderData(
//                             show: false,
//                           ),
//                           sectionsSpace: 0,
//                           centerSpaceRadius: 40,
//                           sections: showingSections()),
//                     ),
//                   ),
//                 ),
//                 Column(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const <Widget>[
//                     Indicator(
//                       color: Color.fromARGB(255, 59, 52, 252),
//                       text: 'Employees',
//                       isSquare: true,
//                     ),
//                     SizedBox(
//                       height: 4,
//                     ),
//                     Indicator(
//                       color: Color.fromARGB(255, 224, 232, 0),
//                       text: 'Customers',
//                       isSquare: true,
//                     ),
//                     SizedBox(
//                       height: 4,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(),
//               ],
//             ))
//           ],
//         ),
//       ),
//     );
//   }

//   List<PieChartSectionData> showingSections() {
//     return List.generate(2, (i) {
//       final isTouched = i == touchedIndex;
//       final fontSize = isTouched ? 25.0 : 16.0;
//       final radius = isTouched ? 60.0 : 50.0;
//       switch (i) {
//         case 0:
//           return PieChartSectionData(
//             color: Color.fromARGB(255, 59, 52, 252),
//             value: 10,
//             title: '10%',
//             radius: radius,
//             titleStyle: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffffffff)),
//           );
//         case 1:
//           return PieChartSectionData(
//             color: Color.fromARGB(255, 224, 232, 0),
//             value: 90,
//             title: '90%',
//             radius: radius,
//             titleStyle: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffffffff)),
//           );

//         default:
//           throw Error();
//       }
//     });
//   }
// }
