import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:signapp/dashboard.dart';
import 'package:signapp/userdashboard.dart';
import 'package:signapp/employeedashboard.dart';
import 'package:signapp/main.dart';
import 'package:signapp/model/transaction_response.dart';
import 'package:http/http.dart' as http;

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Transaction',
//         theme: ThemeData(
//             // primarySwatch: Colors.blue,
//             ),
//         home: Transaction());
//   }
// }

class Transaction extends StatefulWidget {
  // const Transaction({Key? key}) : super(key: key);
  // Transaction({Key? key,  required this.variable}) : super(key: key);
  // String? variable;
  Transaction({Key? key, required this.token}) : super(key: key);
  String? token;

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  // final List<String> _type = [
  //   'Customer',
  //   'Employee',
  // ];

  String _tid = "";
  String _amount = "";
  String _ttype = "";
  String _sid = "";
  String _did = "";

  // String dropdownvalue = 'Withdraw fund';

  // // List of items in our dropdown menu
  // var items = [
  //   'Withdraw fund',
  //   'Deposit fund',
  //   'Transaction fund',
  // ];

  // String _utype = "";

  // String dropvalue = 'Select Your User Type';

  // // List of items in our dropdown menu
  // var ims = [
  //   'Select Your User Type',
  //   'Customer',
  //   'Employee',
  // ];

  // final nameHolder = TextEditingController();

  // clearTextInput() {
  //   nameHolder.clear();
  // }

  var _transcontroller = TextEditingController();
  var _amscontroller = TextEditingController();
  var _sourcontroller = TextEditingController();
  var _descontroller = TextEditingController();

  Transactionresponse? transactionresponse;
  bool _loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getByIdTransactions();
    calwithdraw();
    caldeposit();
    caltransfer();
  }

  void calwithdraw() async {
    setState(() {
      _loading = true;
    });
    print("${widget.token}");
    var response = await http.get(
      Uri.parse("http://localhost:8080/withdraw"),
      headers: {"Authorization": "Bearer ${widget.token}"},
    );
    print("Status Code");
    print(response.statusCode);
    if (response.statusCode == 200) {
      transactionresponse =
          transactionresponseFromJson(response.body) as Transactionresponse?;
      setState(() {});
      print(transactionresponse!.tId);
      print("Sucsess Withdraw");
      print("----------------------------");

      setState(() {
        _loading = false;
      });
    }
  }

  void caldeposit() async {
    setState(() {
      _loading = true;
    });
    print("${widget.token}");
    var response = await http.post(
      Uri.parse("http://localhost:8080/deposit"),
      headers: {"Authorization": "Bearer ${widget.token}"},
    );
    print("Status Code");
    print(response.statusCode);
    if (response.statusCode == 200) {
      transactionresponse =
          transactionresponseFromJson(response.body) as Transactionresponse?;
      setState(() {});
      print(transactionresponse!.tId);
      print("Sucsess Deposit");
      print("----------------------------");

      setState(() {
        _loading = false;
      });
    }
  }

  void caltransfer() async {
    setState(() {
      _loading = true;
    });
    print("${widget.token}");
    var response = await http.post(
      Uri.parse("http://localhost:8080/transfer"),
      headers: {"Authorization": "Bearer ${widget.token}"},
    );
    print("Status Code");
    print(response.statusCode);
    if (response.statusCode == 200) {
      transactionresponse =
          transactionresponseFromJson(response.body) as Transactionresponse?;
      setState(() {});
      print(transactionresponse!.tId);
      print("Sucsess Transfer");
      print("----------------------------");

      setState(() {
        _loading = false;
      });
    }
  }

  void getByIdTransactions() async {
    setState(() {
      _loading = true;
    });
    print("${widget.token}");
    var response = await http.get(
      Uri.parse("http://localhost:8080/bankstransaction/ABC Transaction/{id}"),
      headers: {"Authorization": "Bearer ${widget.token}"},
    );
    print("Status Code");
    print(response.statusCode);
    if (response.statusCode == 200) {
      transactionresponse =
          transactionresponseFromJson(response.body) as Transactionresponse?;
      setState(() {});
      print(transactionresponse!.tId);
      print(transactionresponse!.transacAmount);
      print(transactionresponse!.transacDecription);
      print(transactionresponse!.transacType);
      print(transactionresponse!.transacTime);
      print(transactionresponse!.aId);
      print(transactionresponse!.sourceAccId);
      print(transactionresponse!.destinationAccId);
      print("----------------------------");

      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Welocome To ABC Transaction !"),
          foregroundColor: Colors.cyan,
          backgroundColor: Colors.black,
          actions: [
            // Container(
            //   height: 40,
            //   padding: EdgeInsets.only(left: 30),
            //   child: DropdownButton(
            //     // Initial Value
            //     value: dropvalue,

            //     // Down Arrow Icon
            //     icon: const Icon(Icons.keyboard_arrow_down),

            //     // Array list of items
            //     items: ims.map((String ims) {
            //       return DropdownMenuItem(
            //         value: ims,
            //         child: Text(ims),
            //       );
            //     }).toList(),
            //     // After selecting the desired option,it will
            //     // change button value to selected value
            //     onChanged: (String? newValue) {
            //       setState(() {
            //         dropvalue = newValue!;
            //         _utype = dropvalue;
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
                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (context) => Dashboard()));

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
        body: Container(
          child: Row(children: [
            Expanded(
                flex: 3,
                child: Container(
                  color: Color.fromARGB(255, 0, 10, 39),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        Container(
                          padding: EdgeInsets.only(left: 50, right: 50),
                          child: TextFormField(
                            controller: _transcontroller,
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
                          padding: EdgeInsets.only(left: 50, right: 50),
                          child: TextFormField(
                            controller: _amscontroller,
                            //  controller: nameHolder,
                            style: TextStyle(
                              color: Color.fromARGB(255, 6, 34, 56),
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              hintText: "Transaction Amount",
                              hintStyle: TextStyle(color: Colors.black),
                              suffixIcon: const Icon(Icons.monetization_on,
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
                              _amount = val2;
                            },
                          ),
                        ),
                        // SizedBox(height: 20),
                        // Container(
                        //   height: 50,
                        //   width: 500,
                        //   padding: EdgeInsets.only(left: 50, right: 50),
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
                        //         _ttype = dropdownvalue;
                        //       });
                        //     },
                        //     dropdownColor: Colors.deepPurple,
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //       //backgroundColor: Colors.white,
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.only(left: 50, right: 50),
                          child: TextFormField(
                            controller: _sourcontroller,
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
                            onChanged: (val3) {
                              _sid = val3;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.only(left: 50, right: 50),
                          child: TextFormField(
                            controller: _descontroller,
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
                            onChanged: (val4) {
                              //print(val);
                              _did = val4;
                            },
                          ),
                        ),
                        SizedBox(height: 60),
                        Container(
                          height: 50,
                          width: 500,
                          padding: EdgeInsets.only(left: 50, right: 50),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.deepPurple, // background
                                onPrimary: Colors.white, // foreground
                              ),
                              onPressed: () {
                                calwithdraw();

                                // print("------------------------");
                                // print("Transaction Successful !!!");
                                // print("------------------------");
                                // print("Your Transaction ID is : ${_tid}");
                                // print(
                                //     "Your Transaction Amount is : ${_amount}");
                                // print(_ttype);
                                // print("Your Source Account ID is : ${_sid}");
                                // print(
                                //     "Your Destination Account ID is : ${_did}");

                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Withdraw Successful !')));
                              },
                              child: Text("Withdraw")),
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
                                caldeposit();

                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Deposit Successful !')));
                                // _transcontroller.clear();
                                // _amscontroller.clear();
                                // _sourcontroller.clear();
                                // _descontroller.clear();
                              },
                              child: Text("Deposit")),
                        ),
                        SizedBox(height: 30),
                        Container(
                          height: 50,
                          width: 500,
                          padding: EdgeInsets.only(left: 50, right: 50),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(
                                    255, 22, 112, 14), // background
                                onPrimary: Colors.white, // foreground
                              ),
                              onPressed: () {
                                caltransfer();

                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Transfer Successful !')));
                                // _transcontroller.clear();
                                // _amscontroller.clear();
                                // _sourcontroller.clear();
                                // _descontroller.clear();
                              },
                              child: Text("Transfer")),
                        ),
                        SizedBox(height: 30),
                        Container(
                          height: 50,
                          width: 500,
                          padding: EdgeInsets.only(left: 50, right: 50),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(
                                    255, 63, 184, 189), // background
                                onPrimary: Colors.white, // foreground
                              ),
                              onPressed: () {
                                getByIdTransactions();
                              },
                              child: Text("View")),
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
                  children: [],
                ),
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
