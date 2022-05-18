import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:signapp/dashboard.dart';
import 'package:signapp/main.dart';
import 'package:http/http.dart' as http;
import 'package:signapp/model/account_response.dart';

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  MyApp({Key? key, required this.token}) : super(key: key);
  String? token;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Manage Account',
        theme: ThemeData(
            // primarySwatch: Colors.blue,
            ),
        home: Account(
          token: token,
        ));
  }
}

class Account extends StatefulWidget {
  // const Account({Key? key}) : super(key: key);
  Account({Key? key, this.token}) : super(key: key);
  String? token;

  // get token => null;

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String _aid = "";
  String _utype = "";
  String _uid = "";
  String _ano = "";

  String dropdownvalue = 'User';

  // List of items in our dropdown menu
  var items = [
    'User',
    'Admin',
    'Employer',
  ];

  var _acccontroller = TextEditingController();
  var _usercontroller = TextEditingController();
  var _numcontroller = TextEditingController();

  // var body = {};
  // Accountresponse? accountresponse;
  // bool _loading = false;

  // // get http => null;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getAllAccount();
  // }

  // void getAllAccount() async {
  //   setState(() {
  //     _loading = true;
  //   });
  //   // print("$widget");
  //   var response = await http.get(
  //     Uri.parse("http://localhost:8080/bankaccount"),
  //     headers: {"Authorization": "Bearer ${widget.token}"},
  //   );

  //   print("Status Code");
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     print("call user");
  //     //accountresponseFromJson = accountresponseFromJson(response.body);
  //     setState(() {});
  //     for (int i = 0; i < accountresponse!.body!.length; i++) {
  //       print(accountresponse!.body![i]._uid);
  //     }

  //     setState(() {
  //       _loading = false;
  //     });
  //   }
  // }

  // final TextEditingController _controller = TextEditingController();

  // // This function is triggered when the clear buttion is pressed
  // void _clearTextField() {
  //   // Clear everything in the text field
  //   _controller.clear();
  //   // Call setState to update the UI
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welocome To ABC Manage Accounts !"),
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
                        padding: EdgeInsets.only(left: 50, right: 50),
                        child: TextFormField(
                          controller: _acccontroller,
                          //    controller: nameHolder,
                          style: TextStyle(
                            color: Color.fromARGB(255, 6, 34, 56),
                            fontSize: 15,
                          ),
                          decoration: InputDecoration(
                            hintText: "Account ID",
                            hintStyle: TextStyle(color: Colors.black),
                            suffixIcon: const Icon(Icons.account_circle,
                                color: Colors.grey),
                            fillColor: Colors.blueGrey[50],
                            filled: true,
                            alignLabelWithHint: true,
                            contentPadding: const EdgeInsets.only(left: 30),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.green)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                          ),
                          onChanged: (val) {
                            _aid = val;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
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
                          dropdownColor: Colors.deepPurple,
                          //Color.fromARGB(255, 15, 174, 202),
                          style: TextStyle(
                            color: Colors.white,
                            //backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.only(left: 50, right: 50),
                        child: TextFormField(
                          controller: _usercontroller,
                          //    controller: nameHolder,
                          style: TextStyle(
                            color: Color.fromARGB(255, 6, 34, 56),
                            fontSize: 15,
                          ),
                          decoration: InputDecoration(
                            hintText: "User ID",
                            hintStyle: TextStyle(color: Colors.black),
                            suffixIcon: const Icon(Icons.account_circle,
                                color: Colors.grey),
                            fillColor: Colors.blueGrey[50],
                            filled: true,
                            contentPadding: const EdgeInsets.only(left: 30),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.green)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                          ),
                          onChanged: (val2) {
                            _uid = val2;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.only(left: 50, right: 50),
                        child: TextFormField(
                          controller: _numcontroller,
                          //     controller: nameHolder,
                          style: TextStyle(
                            color: Color.fromARGB(255, 6, 34, 56),
                            fontSize: 15,
                          ),
                          decoration: InputDecoration(
                            hintText: "Account Number",
                            hintStyle: TextStyle(color: Colors.black),
                            suffixIcon: const Icon(Icons.monetization_on,
                                color: Colors.grey),
                            fillColor: Colors.blueGrey[50],
                            filled: true,
                            //  hintText: "Enter Your Password",
                            //  hintStyle: TextStyle(color: Colors.black),
                            alignLabelWithHint: true,
                            contentPadding: const EdgeInsets.only(left: 30),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.green)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                          ),
                          onChanged: (val3) {
                            //print(val);
                            _ano = val3;
                          },
                        ),
                      ),
                      SizedBox(height: 60),
                      Container(
                        height: 50,
                        width: 500,
                        padding: EdgeInsets.only(left: 50, right: 50),
                        child: ElevatedButton(
                            onPressed: () {
                              // getAllAccount();

                              print("------------------------");
                              print("Account Information Added Successful !!!");
                              print("------------------------");
                              print("Your Account ID is : ${_aid}");
                              print(_utype);
                              print("Your User ID is : ${_uid}");
                              print("Your Account Number is : ${_ano}");

                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Account Created Successful !')));
                            },
                            child: Text("Submit")),
                      ),
                      SizedBox(height: 30),
                      Container(
                        height: 50,
                        width: 500,
                        padding: EdgeInsets.only(left: 50, right: 50),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(
                                  255, 212, 98, 22), // background
                              onPrimary: Colors.white, // foreground
                            ),
                            onPressed: () {
                              _acccontroller.clear();
                              _usercontroller.clear();
                              _numcontroller.clear();
                            },
                            child: Text("Clear")),
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Account Deleted Successful !')));
                            },
                            child: Text("Delete")),
                      ),
                    ]),
              )),
          Expanded(
            flex: 9,
            child: Container(
              color: Color.fromARGB(255, 163, 176, 219),
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
                          style: TextStyle(color: Colors.black, fontSize: 10),
                        )),
                    // Padding(
                    //   padding:
                    //       const EdgeInsets.only(top: 40, left: 10, right: 10),
                    //   child: Table(
                    //     border: TableBorder.all(),
                    //     children: const [
                    //       TableRow(children: [
                    //         Text(
                    //           "Account ID",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "Account Number",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "Account Balance",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "User ID",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ]),
                    //       TableRow(children: [
                    //         Text(
                    //           "1",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "acc678954311",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "12450",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "1",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ]),
                    //       TableRow(children: [
                    //         Text(
                    //           "2",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "acc678954311",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "12450",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "2",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ]),
                    //       TableRow(children: [
                    //         Text(
                    //           "3",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "acc678954311",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "12450",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "3",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ]),
                    //       TableRow(children: [
                    //         Text(
                    //           "4",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "acc678954311",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "12450",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "4",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ]),
                    //       TableRow(children: [
                    //         Text(
                    //           "5",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "acc678954311",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "12450",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "5",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ]),
                    //       TableRow(children: [
                    //         Text(
                    //           "6",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "acc678954311",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "12450",
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         Text(
                    //           "6",
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

    // body: Center(
    //     child: Column(children: <Widget>[
    //   Container(
    //     color: Color.fromARGB(255, 105, 133, 226),
    //     margin: EdgeInsets.all(20),
    //     child: Table(
    //       defaultColumnWidth: FixedColumnWidth(120.0),
    //       border: TableBorder.all(
    //           color: Colors.black, style: BorderStyle.solid, width: 2),
    //       children: [
    //         TableRow(children: [
    //           Column(children: [
    //             Text('Account ID', style: TextStyle(fontSize: 20.0))
    //           ]),
    //           Column(children: [
    //             Text('Account Number', style: TextStyle(fontSize: 20.0))
    //           ]),
    //           Column(children: [
    //             Text('Balance', style: TextStyle(fontSize: 20.0))
    //           ]),
    //           Column(children: [
    //             Text('User Type', style: TextStyle(fontSize: 20.0))
    //           ]),
    //         ]),
    //         TableRow(children: [
    //           Column(children: [Text('1')]),
    //           Column(children: [Text('acc678954478')]),
    //           Column(children: [Text('250000')]),
    //           Column(children: [Text('Admin')]),
    //         ]),
    //         TableRow(children: [
    //           Column(children: [Text('2')]),
    //           Column(children: [Text('acc678959732')]),
    //           Column(children: [Text('678000')]),
    //           Column(children: [Text('User')]),
    //         ]),
    //         TableRow(children: [
    //           Column(children: [Text('3')]),
    //           Column(children: [Text('acc67895890')]),
    //           Column(children: [Text('300000')]),
    //           Column(children: [Text('Employer')]),
    //         ]),
    //         TableRow(children: [
    //           Column(children: [Text('4')]),
    //           Column(children: [Text('acc678954789')]),
    //           Column(children: [Text('700000')]),
    //           Column(children: [Text('Employer')]),
    //         ]),
    //         TableRow(children: [
    //           Column(children: [Text('5')]),
    //           Column(children: [Text('acc678954334')]),
    //           Column(children: [Text('800000')]),
    //           Column(children: [Text('User')]),
    //         ]),
    //         TableRow(children: [
    //           Column(children: [Text('6')]),
    //           Column(children: [Text('acc678954318')]),
    //           Column(children: [Text('300000')]),
    //           Column(children: [Text('User')]),
    //         ]),
    //       ],
    //     ),
    //   ),
    //   Container(
    //       padding: EdgeInsets.only(top: 10),
    //       child: Text(
    //         "ABC @ 2022 All rights reserved",
    //         style: TextStyle(color: Colors.white, fontSize: 10),
    //       )),
    // ])),
  }
}

class ListVewBuilder extends StatefulWidget {
  ListVewBuilder({Key? key, this.token}) : super(key: key);
  String? token;
  @override
  State<ListVewBuilder> createState() => _ListVewBuilderState();
}

class _ListVewBuilderState extends State<ListVewBuilder> {
  List<Accountresponse>? accountresponse;
  bool _loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllAccounts();
  }

  void getAllAccounts() async {
    setState(() {
      _loading = true;
    });
    print("${widget.token}");
    var response = await http.get(
      Uri.parse("http://localhost:8080/bankaccount"),
      headers: {"Authorization": "Bearer ${widget.token}"},
    );
    print("Status Code");
    print(response.statusCode);
    if (response.statusCode == 200) {
      accountresponse = accountresponseFromJson(response.body);
      setState(() {});
      for (int i = 0; i < accountresponse!.length; i++) {
        print(accountresponse![i].aId);
        print(accountresponse![i].aNumber);
        print(accountresponse![i].aBalance);
        print(accountresponse![i].uId);
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
                      itemCount: accountresponse!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            leading: Icon(Icons.supervised_user_circle_sharp),
                            trailing: Container(
                                child: Column(
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Icon(Icons.visibility,
                                        color: Colors.black87))
                              ],
                            )),
                            title: Text(accountresponse![index].aId.toString() +
                                " " +
                                accountresponse![index].aNumber.toString() +
                                " " +
                                accountresponse![index].aBalance.toString()));
                      }),
                )
        ],
      )),
    );
  }
}
