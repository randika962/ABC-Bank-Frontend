import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:signapp/dashboard.dart';
import 'package:signapp/userdashboard.dart';
import 'package:signapp/employeedashboard.dart';
import 'package:signapp/main.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Transaction',
        theme: ThemeData(
            // primarySwatch: Colors.blue,
            ),
        home: Transaction());
  }
}

class Transaction extends StatefulWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  String _tid = "";
  String _ttype = "";
  String _sid = "";
  String _did = "";

  String dropdownvalue = 'Withdraw fund';

  // List of items in our dropdown menu
  var items = [
    'Withdraw fund',
    'Deposit fund',
    'Transaction fund',
  ];

  String _utype = "";

  String dropvalue = 'Select Your User Type';

  // List of items in our dropdown menu
  var ims = [
    'Select Your User Type',
    'User',
    'Employee',
  ];

  final nameHolder = TextEditingController();

  clearTextInput() {
    nameHolder.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Welocome To ABC Transaction !"),
          foregroundColor: Colors.cyan,
          backgroundColor: Colors.black,
          actions: [
            Container(
              height: 40,
              padding: EdgeInsets.only(left: 30),
              child: DropdownButton(
                // Initial Value
                value: dropvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: ims.map((String ims) {
                  return DropdownMenuItem(
                    value: ims,
                    child: Text(ims),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropvalue = newValue!;
                    _utype = dropvalue;
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
                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (context) => Dashboard()));

                      if (_utype == "User") {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserDashboard()));
                      } else if (_utype == "Employee") {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EmployeeDashboard()));
                      }
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
                        SizedBox(height: 70),
                        Container(
                          padding: EdgeInsets.only(left: 50, right: 50),
                          child: TextFormField(
                            //   controller: nameHolder,
                            style: TextStyle(
                              color: Color.fromARGB(255, 6, 34, 56),
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              hintText: "Transaction ID",
                              hintStyle: TextStyle(color: Colors.black),
                              suffixIcon: const Icon(Icons.account_box,
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
                              _tid = val;
                            },
                          ),
                        ),
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
                                _ttype = dropdownvalue;
                              });
                            },
                            dropdownColor: Colors.deepPurple,
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
                            //  controller: nameHolder,
                            style: TextStyle(
                              color: Color.fromARGB(255, 6, 34, 56),
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              hintText: "Source Account ID",
                              hintStyle: TextStyle(color: Colors.black),
                              suffixIcon: const Icon(Icons.account_box,
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
                              _sid = val2;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.only(left: 50, right: 50),
                          child: TextFormField(
                            //    controller: nameHolder,
                            style: TextStyle(
                              color: Color.fromARGB(255, 6, 34, 56),
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              hintText: "Destination Account ID",
                              hintStyle: TextStyle(color: Colors.black),
                              suffixIcon: const Icon(Icons.account_box,
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
                              _did = val3;
                            },
                          ),
                        ),
                        SizedBox(height: 100),
                        Container(
                          height: 50,
                          width: 500,
                          padding: EdgeInsets.only(left: 50, right: 50),
                          child: ElevatedButton(
                              onPressed: () {
                                print("------------------------");
                                print("Transaction Successful !!!");
                                print("------------------------");
                                print("Your Transaction ID is : ${_tid}");
                                print(_ttype);
                                print("Your Source Account ID is : ${_sid}");
                                print(
                                    "Your Destination Account ID is : ${_did}");
                              },
                              child: Text("Submit")),
                        ),
                        SizedBox(height: 30),
                        Container(
                          height: 50,
                          width: 500,
                          padding: EdgeInsets.only(left: 50, right: 50),
                          child: ElevatedButton(
                              onPressed: () {}, child: Text("Clear")),
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
                      SizedBox(height: 30),
                      Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "ABC @ 2022 All rights reserved",
                            style: TextStyle(color: Colors.black, fontSize: 10),
                          )),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 40, left: 10, right: 10),
                        child: Table(
                          border: TableBorder.all(),
                          children: const [
                            TableRow(children: [
                              Text(
                                "Transaction ID",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Amount",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Description",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Type",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Time",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Source ID",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Destination ID",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                            TableRow(children: [
                              Text(
                                "1",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "500000",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "welcome",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "w",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "2022-04-29 15:07:00",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "3",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "5",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                            TableRow(children: [
                              Text(
                                "2",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "800000",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "welcome",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "w",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "2022-04-29 15:07:00",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "2",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "6",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                            TableRow(children: [
                              Text(
                                "3",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "250000",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "welcome",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "d",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "2022-04-29 15:07:00",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "2",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "6",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                            TableRow(children: [
                              Text(
                                "4",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "90000",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "welcome",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "d",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "2022-04-29 15:07:00",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "2",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "6",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                            TableRow(children: [
                              Text(
                                "5",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "650000",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "welcome",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "t",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "2022-04-29 15:07:00",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "2",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "6",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                            TableRow(children: [
                              Text(
                                "6",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "750000",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "welcome",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "t",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "2022-04-29 15:07:00",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "2",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "6",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          ]),
        )

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
        //             Text('Transaction ID', style: TextStyle(fontSize: 20.0))
        //           ]),
        //           Column(children: [
        //             Text('Transaction Amount', style: TextStyle(fontSize: 20.0))
        //           ]),
        //           Column(children: [
        //             Text('Transaction Description',
        //                 style: TextStyle(fontSize: 20.0))
        //           ]),
        //           Column(children: [
        //             Text('Transaction Type', style: TextStyle(fontSize: 20.0))
        //           ]),
        //           Column(children: [
        //             Text('Transaction Time', style: TextStyle(fontSize: 20.0))
        //           ]),
        //           Column(children: [
        //             Text('Direct Debit Date', style: TextStyle(fontSize: 20.0))
        //           ]),
        //           Column(children: [
        //             Text('Source Account ID', style: TextStyle(fontSize: 20.0))
        //           ]),
        //           Column(children: [
        //             Text('Destination Account ID',
        //                 style: TextStyle(fontSize: 20.0))
        //           ]),
        //         ]),
        //         TableRow(children: [
        //           Column(children: [Text('1')]),
        //           Column(children: [Text('500000')]),
        //           Column(children: [Text('Welcome withdraw')]),
        //           Column(children: [Text('Withdraw')]),
        //           Column(children: [Text('2022-04-29 15:07:00')]),
        //           Column(children: [Text('2022-04-29 15:07:00')]),
        //           Column(children: [Text('1')]),
        //           Column(children: [Text('3')]),
        //         ]),
        //         TableRow(children: [
        //           Column(children: [Text('2')]),
        //           Column(children: [Text('400000')]),
        //           Column(children: [Text('Welcome withdraw')]),
        //           Column(children: [Text('Withdraw')]),
        //           Column(children: [Text('2022-04-29 15:07:00')]),
        //           Column(children: [Text('2022-04-29 15:07:00')]),
        //           Column(children: [Text('1')]),
        //           Column(children: [Text('6')]),
        //         ]),
        //         TableRow(children: [
        //           Column(children: [Text('3')]),
        //           Column(children: [Text('900000')]),
        //           Column(children: [Text('Welcome deposit')]),
        //           Column(children: [Text('deposit')]),
        //           Column(children: [Text('2022-04-29 15:07:00')]),
        //           Column(children: [Text('2022-04-29 15:07:00')]),
        //           Column(children: [Text('4')]),
        //           Column(children: [Text('6')]),
        //         ]),
        //         TableRow(children: [
        //           Column(children: [Text('4')]),
        //           Column(children: [Text('450000')]),
        //           Column(children: [Text('Welcome deposit')]),
        //           Column(children: [Text('deposit')]),
        //           Column(children: [Text('2022-04-29 15:07:00')]),
        //           Column(children: [Text('2022-04-29 15:07:00')]),
        //           Column(children: [Text('5')]),
        //           Column(children: [Text('6')]),
        //         ]),
        //         TableRow(children: [
        //           Column(children: [Text('5')]),
        //           Column(children: [Text('8900000')]),
        //           Column(children: [Text('Welcome transaction')]),
        //           Column(children: [Text('transaction')]),
        //           Column(children: [Text('2022-04-29 15:07:00')]),
        //           Column(children: [Text('2022-04-29 15:07:00')]),
        //           Column(children: [Text('5')]),
        //           Column(children: [Text('4')]),
        //         ]),
        //         TableRow(children: [
        //           Column(children: [Text('6')]),
        //           Column(children: [Text('3000000')]),
        //           Column(children: [Text('Welcome transaction')]),
        //           Column(children: [Text('transaction')]),
        //           Column(children: [Text('2022-04-29 15:07:00')]),
        //           Column(children: [Text('2022-04-29 15:07:00')]),
        //           Column(children: [Text('3')]),
        //           Column(children: [Text('2')]),
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
        );
  }
}
