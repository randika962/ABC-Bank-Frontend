// To parse this JSON data, do
//
//     final singleaccountresponse = singleaccountresponseFromJson(jsonString);

import 'dart:convert';

Singleaccountresponse singleaccountresponseFromJson(String str) => Singleaccountresponse.fromJson(json.decode(str));

String singleaccountresponseToJson(Singleaccountresponse data) => json.encode(data.toJson());

class Singleaccountresponse {
    Singleaccountresponse({
        this.aId,
        this.aNumber,
        this.aBalance,
        this.uId,
        this.owner,
        this.transaction,
    });

    int? aId;
    String? aNumber;
    int? aBalance;
    int? uId;
    Owner? owner;
    List<Transaction>? transaction;

    factory Singleaccountresponse.fromJson(Map<String, dynamic> json) => Singleaccountresponse(
        aId: json["aId"] == null ? null : json["aId"],
        aNumber: json["aNumber"] == null ? null : json["aNumber"],
        aBalance: json["aBalance"] == null ? null : json["aBalance"],
        uId: json["uId"] == null ? null : json["uId"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        transaction: json["transaction"] == null ? null : List<Transaction>.from(json["transaction"].map((x) => Transaction.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "aId": aId == null ? null : aId,
        "aNumber": aNumber == null ? null : aNumber,
        "aBalance": aBalance == null ? null : aBalance,
        "uId": uId == null ? null : uId,
        "owner": owner == null ? null : owner!.toJson(),
        "transaction": transaction == null ? null : List<dynamic>.from(transaction!.map((x) => x.toJson())),
    };
}

class Owner {
    Owner({
        this.uId,
        this.fName,
        this.lName,
        this.addres,
        this.userEmail,
        this.password,
        this.type,
    });

    int? uId;
    String? fName;
    String? lName;
    String? addres;
    String? userEmail;
    String? password;
    String? type;

    factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        uId: json["uId"] == null ? null : json["uId"],
        fName: json["fName"] == null ? null : json["fName"],
        lName: json["lName"] == null ? null : json["lName"],
        addres: json["addres"] == null ? null : json["addres"],
        userEmail: json["userEmail"] == null ? null : json["userEmail"],
        password: json["password"] == null ? null : json["password"],
        type: json["type"] == null ? null : json["type"],
    );

    Map<String, dynamic> toJson() => {
        "uId": uId == null ? null : uId,
        "fName": fName == null ? null : fName,
        "lName": lName == null ? null : lName,
        "addres": addres == null ? null : addres,
        "userEmail": userEmail == null ? null : userEmail,
        "password": password == null ? null : password,
        "type": type == null ? null : type,
    };
}

class Transaction {
    Transaction({
        this.tId,
        this.transacAmount,
        this.transacDecription,
        this.transacType,
        this.transacTime,
        this.aId,
        this.sourceAccId,
        this.destinationAccId,
    });

    int? tId;
    int? transacAmount;
    String? transacDecription;
    String? transacType;
    DateTime? transacTime;
    int? aId;
    int? sourceAccId;
    int? destinationAccId;

    factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        tId: json["tId"] == null ? null : json["tId"],
        transacAmount: json["transacAmount"] == null ? null : json["transacAmount"],
        transacDecription: json["transacDecription"] == null ? null : json["transacDecription"],
        transacType: json["transacType"] == null ? null : json["transacType"],
        transacTime: json["transacTime"] == null ? null : DateTime.parse(json["transacTime"]),
        aId: json["aId"] == null ? null : json["aId"],
        sourceAccId: json["sourceAccId"] == null ? null : json["sourceAccId"],
        destinationAccId: json["destinationAccId"] == null ? null : json["destinationAccId"],
    );

    Map<String, dynamic> toJson() => {
        "tId": tId == null ? null : tId,
        "transacAmount": transacAmount == null ? null : transacAmount,
        "transacDecription": transacDecription == null ? null : transacDecription,
        "transacType": transacType == null ? null : transacType,
        "transacTime": transacTime == null ? null : transacTime!.toIso8601String(),
        "aId": aId == null ? null : aId,
        "sourceAccId": sourceAccId == null ? null : sourceAccId,
        "destinationAccId": destinationAccId == null ? null : destinationAccId,
    };
}
