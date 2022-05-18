import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
//         title: 'View Own Account',
//         theme: ThemeData(
//             // primarySwatch: Colors.blue,
//             ),
//         home: ViewAccount());
//   }
// }

class ViewAccount extends StatefulWidget {
  // const ViewAccount({Key? key}) : super(key: key);
  // ViewAccount({Key? key,  required this.variable}) : super(key: key);
  // String? variable;
  ViewAccount({Key? key, required this.token}) : super(key: key);
  String? token;

  @override
  State<ViewAccount> createState() => _ViewAccountState();
}

class _ViewAccountState extends State<ViewAccount> {
  //   final List<String> _type = [
  //   'Customer',
  //   'Employee',
  // ];

  // String _utype = "";

  // String dropdownvalue = 'Select Your User Type';

  // // List of items in our dropdown menu
  // var items = [
  //   'Select Your User Type',
  //   'Customer',
  //   'Employee',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Account Details"),
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
                    // if (_type == "Customer") {
                    //   Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => UserDashboard()));
                    // } else if (_type == "Employee") {
                    //   Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => EmployeeDashboard()));
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
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
                color: Color.fromARGB(255, 0, 10, 39),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(50),
                      child: const Text(
                        "View My Account Details",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                    SizedBox(height: 20),
                    Image.asset('lib/assets/Images/ABC-logo.jpg'),
                  ],
                )),
          ),
          Expanded(
              flex: 9,
              child: Container(
                color: Color.fromARGB(255, 163, 176, 219),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    const Icon(
                      Icons.account_circle_outlined,
                      color: Colors.black,
                      size: 100,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 100),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // Icon(Icons.person,size: 50,),
                              Text(
                                "Account ID - 2",
                                style: TextStyle(fontSize: 15),
                              ),
                              Padding(padding: EdgeInsets.all(30)),
                            ],
                          ),
                          Row(
                            children: [
                              // Icon(Icons.nam,size: 50,),
                              Text(
                                "Account Number - acc008674351",
                                style: TextStyle(fontSize: 15),
                              ),
                              Padding(padding: EdgeInsets.all(30)),
                            ],
                          ),
                          Row(
                            children: [
                              // Icon(Icons.person,size: 50,),
                              Text(
                                "Account Balance - 500000",
                                style: TextStyle(fontSize: 15),
                              ),
                              Padding(padding: EdgeInsets.all(30)),
                            ],
                          ),
                          Row(
                            children: [
                              // Icon(Icons.person,size: 50,),
                              Text(
                                "User ID - 2",
                                style: TextStyle(fontSize: 15),
                              ),
                              Padding(padding: EdgeInsets.all(30)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
