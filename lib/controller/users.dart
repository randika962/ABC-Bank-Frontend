import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:signapp/dashboard.dart';
import 'package:signapp/main.dart';
import 'package:signapp/model/user_response.dart';
import 'package:http/http.dart' as http;
// import 'package:http/http.dart' as http;
// import 'package:signapp/model/user_response.dart';

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  MyApp({Key? key, required this.token}) : super(key: key);
  String? token;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Users',
        theme: ThemeData(
            // primarySwatch: Colors.blue,
            ),
        home: Userz(
          token: token,
        ));
  }
}

class Userz extends StatefulWidget {
  Userz({Key? key, this.token}) : super(key: key);
  String? token;
  // const Userz({Key? key}) : super(key: key);

  @override
  State<Userz> createState() => _UserzState();
}

class _UserzState extends State<Userz> {
  String _uid = "";

  String dropdownvalue = 'User ID';

  // List of items in our dropdown menu
  var items = [
    'User ID',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];

  Userresponse? userresponse;
  bool _loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    deleteByIdUser();
  }

  void  deleteByIdUser() async {
    setState(() {
      _loading = true;
    });
    print("${widget.token}");
    var response = await http.get(
      Uri.parse("http://localhost:8080/bankusersdelete/{uId}"),
      headers: {"Authorization": "Bearer ${widget.token}"},
    );
    print("Status Code");
    print(response.statusCode);
    if (response.statusCode == 200) {
      userresponse = userresponseFromJson(response.body);
      setState(() {});
        print("Delete User");
        print("----------------------------");

      setState(() {
        _loading = false;
      });
    }
  }

  // var body = {};
  // Userresponse? userresponse;
  // bool _loading = false;

  // get http => null;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getAllUsers();
  // }

  // void getAllUsers() async {
  //   setState(() {
  //     _loading = true;
  //   });
  //   // print("$widget");
  //   var response = await http.get(
  //     Uri.parse("http://localhost:8080/bankusers"),
  //     headers: {"Authorization": "Bearer ${widget.token}"},
  //   );

  //   print("Status Code");
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     print("call user");
  //     userresponse = userresponseFromJson(response.body);
  //     setState(() {});
  //     for (int i = 0; i < userresponse!.body!.length; i++) {
  //       print(userresponse!.body![i].fName);

  //     }

  //     setState(() {
  //       _loading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welocome To ABC Manage Users !"),
        foregroundColor: Colors.cyan,
        backgroundColor: Colors.black,
        actions: [
          Container(
              padding: EdgeInsets.only(left: 100),
              child: TextButton(
                  onPressed: () {
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
        child: Row(children: [
          Expanded(
              flex: 3,
              child: Container(
                color: Color.fromARGB(255, 0, 10, 39),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Container(
                        height: 50,
                        width: 500,
                        padding: EdgeInsets.only(left: 50, right: 50),
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
                              _uid = dropdownvalue;
                            });
                          },
                          dropdownColor: Colors.deepPurple,
                          style: TextStyle(
                            color: Colors.white,
                            //backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 250),
                      Container(
                        height: 50,
                        width: 500,
                        padding: EdgeInsets.only(left: 50, right: 50),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(
                                  255, 35, 168, 79), // background
                              onPrimary: Colors.white, // foreground
                            ),
                            onPressed: () {
                              // getAllUsers();

                              print("------------------------");
                              print("Activation Successful !!!");
                              print("------------------------");
                              print("Your ID is : ${_uid}");

                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('User Activated Successful !')));
                            },
                            child: Text("Activate")),
                      ),
                      SizedBox(height: 30),
                      Container(
                        height: 50,
                        width: 500,
                        padding: EdgeInsets.only(left: 50, right: 50),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(
                                  255, 223, 34, 150), // background
                              onPrimary: Colors.white, // foreground
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'User Deactivated Successful !')));
                            },
                            child: Text("Deactivate")),
                      ),
                      SizedBox(height: 30),
                      Container(
                        height: 50,
                        width: 500,
                        padding: EdgeInsets.only(left: 50, right: 50),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(
                                  255, 209, 25, 25), // background
                              onPrimary: Colors.white, // foreground
                            ),
                            onPressed: () {
                              deleteByIdUser();

                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('User Deleted Successful !')));
                            },
                            child: Text("Delete User")),
                      ),
                    ]),
              )),
          Expanded(
            flex: 9,
            child: Container(
              // color: Color.fromARGB(255, 163, 176, 219),
              color: Color.fromARGB(255, 5, 20, 66),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                    //     child: Column(
                    //   children: [
                    //     _loading
                    //         ? Container(
                    //             child: CircularProgressIndicator(
                    //             color: Colors.red,
                    //           ))
                    //         : Container(
                    //             width: 500,
                    //             height: 500,
                    //             child: ListView.builder(
                    //                 itemCount: userresponse!.body!.length,
                    //                 itemBuilder:
                    //                     (BuildContext context, int index) {
                    //                   return ListTile(
                    //                       leading: Icon(Icons.list),
                    //                       trailing: Text(
                    //                         "GFG",
                    //                         style: TextStyle(
                    //                             color: Colors.green,
                    //                             fontSize: 15),
                    //                       ),
                    //                       title: Text(userresponse!
                    //                           .body![index].fName
                    //                           .toString()));
                    //                 }),
                    //           )
                    //   ],
                    // )),
                    // Padding(
                    //   padding:
                    //       const EdgeInsets.only(top: 40, left: 10, right: 10),
                    //   child: Table(
                    //     border: TableBorder.all(),
                    //     children: const [
                    //       TableRow(children: [
                    //         Text(
                    //           "User ID",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "First Name",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "Last Name",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "Address",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "Email",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "Type",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ]),
                    //       TableRow(children: [
                    //         Text(
                    //           "1",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "Kumara",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "Bandara",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "900/Colombo",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "kkumar@gmail.com",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "C",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ]),
                    //       TableRow(children: [
                    //         Text(
                    //           "2",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "Chathura",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "Withana",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "700/Colombo",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "ccumar@gmail.com",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "C",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ]),
                    //       TableRow(children: [
                    //         Text(
                    //           "3",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "Amara",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "Dinesh",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "670/Colombo",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "dine@gmail.com",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "E",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ]),
                    //       TableRow(children: [
                    //         Text(
                    //           "4",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "Damith",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "Sadun",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "430/Colombo",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "sadun@gmail.com",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "E",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ]),
                    //       TableRow(children: [
                    //         Text(
                    //           "5",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "Ravi",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "Hasitha",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "900/Kandy",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "ravi@gmail.com",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "C",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ]),
                    //       TableRow(children: [
                    //         Text(
                    //           "6",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "Vashima",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "Udara",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "900/Galle",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "vashi@gmail.com",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "E",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ]),
                    //     ],
                    //   ),
                    // )
                  ]),
            ),
          ),
        ]),
      ),
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
  Userresponse? userresponse;
  bool _loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllUsers();
  }

  void getAllUsers() async {
    setState(() {
      _loading = true;
    });
    print("${widget.token}");
    var response = await http.get(
      Uri.parse("http://localhost:8080/bankusers"),
      headers: {"Authorization": "Bearer ${widget.token}"},
    );
    print("Status Code");
    print(response.statusCode);
    if (response.statusCode == 200) {
      userresponse = userresponseFromJson(response.body);
      setState(() {});
      for (int i = 0; i < userresponse!.body!.length; i++) {
        print(userresponse!.body![i].uId);
        print(userresponse!.body![i].fName);
        print(userresponse!.body![i].lName);
        print(userresponse!.body![i].addres);
        print(userresponse!.body![i].userEmail);
        print(userresponse!.body![i].type);
        print("----------------------------");
      }

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
                      itemCount: userresponse!.body!.length,
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
                            title: Text(userresponse!.body![index].uId
                                    .toString() +
                                " " +
                                userresponse!.body![index].fName.toString() +
                                " " +
                                userresponse!.body![index].lName.toString()));
                      }),
                )
        ],
      )),
      // body: ListView.builder(
      //     itemCount: userresponse!.body!.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       return ListTile(
      //           leading: Icon(Icons.list),
      //           trailing: Text(
      //             "GFG",
      //             style: TextStyle(color: Colors.green, fontSize: 15),
      //           ),
      //           title: Text(userresponse!.body![index].ufname.toString()));
      //     }),
    );
  }
}
