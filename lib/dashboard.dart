import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:signapp/about.dart';
import 'package:signapp/account.dart';
import 'package:signapp/contact.dart';
import 'package:signapp/creditcard.dart';
import 'package:signapp/digital.dart';
import 'package:signapp/transaction.dart';
import 'package:signapp/main.dart';
import 'package:signapp/users.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ABC Dashboard',
        theme: ThemeData(
            // primarySwatch: Colors.blue,
            ),
        home: Dashboard());
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
                            padding: EdgeInsets.only(bottom: 25),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Dashboard()));
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
                        SizedBox(width: 20),
                        Container(
                            padding: EdgeInsets.only(bottom: 25),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => About()));
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
                        SizedBox(width: 20),
                        Container(
                            padding: EdgeInsets.only(bottom: 25),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Account()));
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
                        SizedBox(width: 20),
                        Container(
                            padding: EdgeInsets.only(bottom: 25),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Userz()));
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
                        SizedBox(width: 20),
                        Container(
                            padding: EdgeInsets.only(bottom: 25),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CreditCard()));
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
                        SizedBox(width: 20),
                        Container(
                            padding: EdgeInsets.only(bottom: 25),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Digital()));
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
                        SizedBox(width: 20),
                        Container(
                            padding: EdgeInsets.only(bottom: 25),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Contact()));
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
                  color: Color.fromARGB(255, 163, 176, 219),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('lib/assets/Images/blog.jpg'),
                        SizedBox(height: 60),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                color: Color.fromARGB(255, 163, 176, 219),
                                height: 160,
                                width: 30,
                              ),
                              Container(
                                alignment: Alignment.center,
                                color: Color.fromARGB(255, 253, 164, 31),
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
                                color: Color.fromARGB(255, 163, 176, 219),
                                height: 160,
                                width: 30,
                              ),
                              Container(
                                alignment: Alignment.center,
                                color: Color.fromARGB(255, 78, 216, 163),
                                height: 160,
                                width: 300,
                                child: Text(
                                  "Total Users *",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                color: Color.fromARGB(255, 163, 176, 219),
                                height: 160,
                                width: 30,
                              ),
                              Container(
                                alignment: Alignment.center,
                                color: Color.fromARGB(255, 187, 94, 94),
                                height: 160,
                                width: 300,
                                child: Text(
                                  "Percentage %",
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
                                  TextStyle(color: Colors.black, fontSize: 10),
                            )),
                      ]),
                ))
          ]),
        ));
  }
}
