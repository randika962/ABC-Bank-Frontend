import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:signapp/dashboard.dart';
import 'package:signapp/main.dart';

class Userz extends StatefulWidget {
  const Userz({Key? key}) : super(key: key);

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
  ];

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
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Dashboard()));
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
                        SizedBox(height: 100),
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
                                print("------------------------");
                                print("Activation Successful !!!");
                                print("------------------------");
                                print("Your ID is : ${_uid}");
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
                                    255, 209, 25, 25), // background
                                onPrimary: Colors.white, // foreground
                              ),
                              onPressed: () {},
                              child: Text("Deactivate")),
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
                                "User ID",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "First Name",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Last Name",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Address",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Email",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Type",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                            TableRow(children: [
                              Text(
                                "1",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Kumara",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Bandara",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "900/Colombo",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "kkumar@gmail.com",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "User",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                            TableRow(children: [
                              Text(
                                "2",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Chathura",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Withana",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "700/Colombo",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "ccumar@gmail.com",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "User",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                            TableRow(children: [
                              Text(
                                "3",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Amara",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Dinesh",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "670/Colombo",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "dine@gmail.com",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Employee",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                            TableRow(children: [
                              Text(
                                "4",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Damith",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Sadun",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "430/Colombo",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "sadun@gmail.com",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Employee",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                            TableRow(children: [
                              Text(
                                "5",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Ravi",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Hasitha",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "900/Kandy",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "ravi@gmail.com",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "User",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                            TableRow(children: [
                              Text(
                                "6",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Vashima",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Udara",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "900/Galle",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "vashi@gmail.com",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Employee",
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
        ),);
  }
}
