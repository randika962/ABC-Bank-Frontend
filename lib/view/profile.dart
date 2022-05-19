import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:signapp/employeedashboard.dart';
import 'package:signapp/model/singleuser_response.dart';
import 'package:signapp/userdashboard.dart';
import 'package:signapp/main.dart';
import 'package:http/http.dart' as http;

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Profile',
//         theme: ThemeData(
//             // primarySwatch: Colors.blue,
//             ),
//         home: Profile());
//   }
// }

class Profile extends StatefulWidget {
  // const Profile({Key? key}) : super(key: key);
  // Profile({Key? key,  required this.variable}) : super(key: key);
  // String? variable;
  Profile({Key? key, required this.token}) : super(key: key);
  String? token;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
        title: Text("Welocome To ABC Profile !"),
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
                    //           builder: (context) => UserDashboard(variable: _type[0])));
                    // } else if (_type == "Employee") {
                    //   Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => EmployeeDashboard(variable: _type[1])));
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
      body: Row(children: [
        Expanded(
          flex: 3,
          child: Container(
              color: Color.fromARGB(255, 0, 10, 39),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(50),
                    child: const Text(
                      "ABC Bank Profile",
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
              // color: Color.fromARGB(255, 163, 176, 219),
              color: Color.fromARGB(255, 5, 20, 66),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  const Icon(
                    Icons.account_circle_outlined,
                    color: Color.fromARGB(255, 226, 210, 210),
                    size: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   Container(
                      height: 540,
                      width: MediaQuery.of(context).size.width,
                      child: new ListVewBuilder(token: widget.token),
                      // getAllUsers();
                    ),
                     SizedBox(height: 30),
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "ABC @ 2022 All rights reserved",
                          style: TextStyle(color: Color.fromARGB(255, 226, 210, 210), fontSize: 10),
                        )),
                  // Container(
                  //   padding: EdgeInsets.only(left: 100),
                  //   child: Column(
                  //     children: [
                  //       Row(
                  //         children: [
                  //           // Icon(Icons.person,size: 50,),
                  //           Text(
                  //             "User ID - 2",
                  //             style: TextStyle(color: Color.fromARGB(255, 226, 210, 210), fontSize: 15),
                  //           ),
                  //           Padding(padding: EdgeInsets.all(30)),
                  //         ],
                  //       ),
                  //       Row(
                  //         children: [
                  //           // Icon(Icons.nam,size: 50,),
                  //           Text(
                  //             "User First Name - Sulakshana",
                  //             style: TextStyle(color: Color.fromARGB(255, 226, 210, 210), fontSize: 15),
                  //           ),
                  //           Padding(padding: EdgeInsets.all(30)),
                  //         ],
                  //       ),
                  //       Row(
                  //         children: [
                  //           // Icon(Icons.person,size: 50,),
                  //           Text(
                  //             "User Last Name - Gunathilakke",
                  //             style: TextStyle(color: Color.fromARGB(255, 226, 210, 210), fontSize: 15),
                  //           ),
                  //           Padding(padding: EdgeInsets.all(30)),
                  //         ],
                  //       ),
                  //       Row(
                  //         children: [
                  //           // Icon(Icons.person,size: 50,),
                  //           Text(
                  //             "User Address - 567/Alawathugoda",
                  //             style: TextStyle(color: Color.fromARGB(255, 226, 210, 210), fontSize: 15),
                  //           ),
                  //           Padding(padding: EdgeInsets.all(30)),
                  //         ],
                  //       ),
                  //       Row(
                  //         children: [
                  //           // Icon(Icons.person,size: 50,),
                  //           Text(
                  //             "User Mail - sula@gmail.com",
                  //             style: TextStyle(color: Color.fromARGB(255, 226, 210, 210), fontSize: 15),
                  //           ),
                  //           Padding(padding: EdgeInsets.all(30)),
                  //         ],
                  //       ),
                  //       Row(
                  //         children: [
                  //           // Icon(Icons.person,size: 50,),
                  //           Text(
                  //             "User Password - 0987cvbn",
                  //             style: TextStyle(color: Color.fromARGB(255, 226, 210, 210), fontSize: 15),
                  //           ),
                  //           Padding(padding: EdgeInsets.all(30)),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            )),
      ]),
      
    );
  }
}


class ListVewBuilder extends StatefulWidget {
  ListVewBuilder({Key? key, this.token}) : super(key: key);
  String? token;
  @override
  State<ListVewBuilder> createState() => _ListVewBuilderState();
}

class _ListVewBuilderState extends State<ListVewBuilder> {
  Singleuserresponse? singleuserresponse;
  bool _loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getByIdUsers();
  }

  void getByIdUsers() async {
    setState(() {
      _loading = true;
    });
    print("${widget.token}");
    var response = await http.get(
      Uri.parse("http://localhost:8080/bankusers/{uId}"),
      headers: {"Authorization": "Bearer ${widget.token}"},
    );
    print("Status Code");
    print(response.statusCode);
    if (response.statusCode == 200) {
      singleuserresponse = singleuserresponseFromJson(response.body);
      setState(() {});
        print(singleuserresponse!.uId);
        print(singleuserresponse!.fName);
        print(singleuserresponse!.lName);
        print(singleuserresponse!.addres);
        print(singleuserresponse!.userEmail);
        print(singleuserresponse!.type);
        print("----------------------------");

      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("ListView.builder"),
      // ),
      body: Container(
          child: Column(
        children: [
          _loading
              ? Container(
                  padding: EdgeInsets.all(200),
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ))
              : Container(
                  width: 1200,
                  height: 500,
                  child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            leading: Icon(Icons.person),
                            trailing: Container(
                                child: Column(
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Icon(Icons.visibility,
                                        color: Colors.black87))
                              ],
                            )),
                            title: Text(singleuserresponse!.uId
                                    .toString() +
                                " " +
                                singleuserresponse!.fName.toString() +
                                " " +
                                singleuserresponse!.lName.toString() +
                                " " +
                                singleuserresponse!.addres.toString() +
                                " " +
                                singleuserresponse!.userEmail.toString() +
                                " " +
                                singleuserresponse!.password.toString()));
                      }),
                )
        ],
      )),

    );
  }
}

