import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:signapp/model/transaction_response.dart';
import 'package:signapp/dashboard.dart';
import 'package:http/http.dart' as http;
import 'package:signapp/main.dart';

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  MyApp({Key? key, required this.token}) : super(key: key);
  String? token;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'View All Transactions',
        theme: ThemeData(
            // primarySwatch: Colors.blue,
            ),
        home: ViewTransaction(
          token: token,
        ));
  }
}

class ViewTransaction extends StatefulWidget {
  // const ViewTransaction({Key? key}) : super(key: key);

  ViewTransaction({Key? key, this.token}) : super(key: key);
  String? token;

  // get token => null;

  @override
  State<ViewTransaction> createState() => _ViewTransactionState();
}

class _ViewTransactionState extends State<ViewTransaction> {
  // var body = {};
  // Transactionresponse? transactionresponse;
  // bool _loading = false;

  // get http => null;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getAllTransaction();
  // }

  // void getAllTransaction() async {
  //   setState(() {
  //     _loading = true;
  //   });
  //   // print("$widget");
  //   var response = await http.get(
  //     Uri.parse("http://localhost:8080/banktransaction"),
  //     headers: {"Authorization": "Bearer ${widget.token}"},
  //   );

  //   print("Status Code");
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     print("call user");
  //     // transactionresponse = transactionresponseFromJson(response.body);
  //     setState(() {});
  //     for (int i = 0; i < transactionresponse!.body!.length; i++) {
  //       print(transactionresponse!.body![i]._sid);
  //     }

  //     setState(() {
  //       _loading = false;
  //     });
  //   }
  // }

  // getAllTransaction();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ABC View All Transactions"),
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
                      "ABC Bank",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  SizedBox(height: 20),
                  Image.asset('lib/assets/Images/ABC-logo.jpg'),
                  SizedBox(height: 150),
                  // Container(
                  //   height: 50,
                  //   width: 500,
                  //   padding: EdgeInsets.only(left: 50, right: 50),
                  //   child: ElevatedButton(
                  //       style: ElevatedButton.styleFrom(
                  //         primary:
                  //             Color.fromARGB(255, 209, 25, 25), // background
                  //         onPrimary: Colors.white, // foreground
                  //       ),
                  //       onPressed: () {
                  //         ScaffoldMessenger.of(context).showSnackBar(
                  //             const SnackBar(
                  //                 content: Text(
                  //                     'Transaction Deleted Successful !')));
                  //       },
                  //       child: Text("Delete Transaction")),
                  // ),
                ],
              )),
        ),
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

                  // SizedBox(height: 30),
                  // Container(
                  //     padding: EdgeInsets.only(top: 10),
                  //     child: Text(
                  //       "ABC @ 2022 All rights reserved",
                  //       style: TextStyle(color: Colors.black, fontSize: 10),
                  //     )),
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.only(top: 40, left: 10, right: 10),
                  //   child: Table(
                  //     border: TableBorder.all(),
                  //     children: const [
                  //       TableRow(children: [
                  //         Text(
                  //           "Transaction ID",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "Amount",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "Description",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "Type",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "Time",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "Source ID",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "Destination ID",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ]),
                  //       TableRow(children: [
                  //         Text(
                  //           "1",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "500000",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "welcome",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "w",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "2022-04-29 15:07:00",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "3",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "5",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ]),
                  //       TableRow(children: [
                  //         Text(
                  //           "2",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "800000",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "welcome",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "w",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "2022-04-29 15:07:00",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "2",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "6",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ]),
                  //       TableRow(children: [
                  //         Text(
                  //           "3",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "250000",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "welcome",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "d",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "2022-04-29 15:07:00",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "2",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "6",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ]),
                  //       TableRow(children: [
                  //         Text(
                  //           "4",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "90000",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "welcome",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "d",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "2022-04-29 15:07:00",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "2",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "6",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ]),
                  //       TableRow(children: [
                  //         Text(
                  //           "5",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "650000",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "welcome",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "t",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "2022-04-29 15:07:00",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "2",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "6",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ]),
                  //       TableRow(children: [
                  //         Text(
                  //           "6",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "750000",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "welcome",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "t",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "2022-04-29 15:07:00",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           "2",
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
  List<Transactionresponse>? transactionresponse;
  bool _loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTransactions();
  }

  void getAllTransactions() async {
    setState(() {
      _loading = true;
    });
    print("${widget.token}");
    var response = await http.get(
      Uri.parse("http://localhost:8080/banktransaction"),
      headers: {"Authorization": "Bearer ${widget.token}"},
    );
    print("Status Code");
    print(response.statusCode);
    if (response.statusCode == 200) {
      transactionresponse = transactionresponseFromJson(response.body);
      setState(() {});
      for (int i = 0; i < transactionresponse!.length; i++) {
        print(transactionresponse![i].tId);
        print(transactionresponse![i].transacAmount);
        print(transactionresponse![i].transacDecription);
        print(transactionresponse![i].transacType);
        print(transactionresponse![i].transacTime);
        print(transactionresponse![i].aId);
        print(transactionresponse![i].sourceAccId);
        print(transactionresponse![i].destinationAccId);
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
                      itemCount: transactionresponse!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            leading: Icon(Icons.monetization_on),
                            trailing: Container(
                                child: Column(
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Icon(Icons.visibility,
                                        color: Colors.black87))
                              ],
                            )),
                            title: Container(
                              child: Column(
                                children: [
                                  Text(transactionresponse![index]
                                              .tId
                                              .toString() +
                                          " " +
                                          transactionresponse![index]
                                              .transacAmount
                                              .toString()
                                      // +  " " +
                                      // transactionresponse![index]
                                      //     .transacDecription
                                      //     .toString()
                                      ),
                                  Text(transactionresponse![index]
                                      .transacAmount
                                      .toString()),
                                  Text(transactionresponse![index]
                                      .transacAmount
                                      .toString()),
                                ],
                              ),
                            ));
                      }),
                )
        ],
      )),
    );
  }
}
