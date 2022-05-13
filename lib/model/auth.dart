// To parse this JSON data, do
//
//     final authresponse = authresponseFromJson(jsonString);

import 'dart:convert';

Authresponse authresponseFromJson(String str) => Authresponse.fromJson(json.decode(str));

String authresponseToJson(Authresponse data) => json.encode(data.toJson());

class Authresponse {
    Authresponse({
        this.body,
        this.stutus,
        this.message,
    });

    Body? body;
    String? stutus;
    String? message;

    factory Authresponse.fromJson(Map<String, dynamic> json) => Authresponse(
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
        stutus: json["stutus"] == null ? null : json["stutus"],
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toJson() => {
        "body": body == null ? null : body!.toJson(),
        "stutus": stutus == null ? null : stutus,
        "message": message == null ? null : message,
    };
}

class Body {
    Body({
        this.jwt,
        this.user,
    });

    String? jwt;
    User? user;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        jwt: json["jwt"] == null ? null : json["jwt"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "jwt": jwt == null ? null : jwt,
        "user": user == null ? null : user!.toJson(),
    };
}

class User {
    User({
        this.uId,
        this.fName,
        this.lName,
        this.addres,
        this.userEmail,
        this.password,
        this.type,
        this.bankaccount,
    });

    int? uId;
    String? fName;
    String? lName;
    String? addres;
    String? userEmail;
    String? password;
    String? type;
    List<Bankaccount>? bankaccount;

    factory User.fromJson(Map<String, dynamic> json) => User(
        uId: json["uId"] == null ? null : json["uId"],
        fName: json["fName"] == null ? null : json["fName"],
        lName: json["lName"] == null ? null : json["lName"],
        addres: json["addres"] == null ? null : json["addres"],
        userEmail: json["userEmail"] == null ? null : json["userEmail"],
        password: json["password"] == null ? null : json["password"],
        type: json["type"] == null ? null : json["type"],
        bankaccount: json["bankaccount"] == null ? null : List<Bankaccount>.from(json["bankaccount"].map((x) => Bankaccount.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "uId": uId == null ? null : uId,
        "fName": fName == null ? null : fName,
        "lName": lName == null ? null : lName,
        "addres": addres == null ? null : addres,
        "userEmail": userEmail == null ? null : userEmail,
        "password": password == null ? null : password,
        "type": type == null ? null : type,
        "bankaccount": bankaccount == null ? null : List<dynamic>.from(bankaccount!.map((x) => x.toJson())),
    };
}

class Bankaccount {
    Bankaccount({
        this.aId,
        this.aNumber,
        this.aBalance,
        this.uId,
        this.transaction,
    });

    int? aId;
    String? aNumber;
    int? aBalance;
    int? uId;
    List<Transaction>? transaction;

    factory Bankaccount.fromJson(Map<String, dynamic> json) => Bankaccount(
        aId: json["aId"] == null ? null : json["aId"],
        aNumber: json["aNumber"] == null ? null : json["aNumber"],
        aBalance: json["aBalance"] == null ? null : json["aBalance"],
        uId: json["uId"] == null ? null : json["uId"],
        transaction: json["transaction"] == null ? null : List<Transaction>.from(json["transaction"].map((x) => Transaction.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "aId": aId == null ? null : aId,
        "aNumber": aNumber == null ? null : aNumber,
        "aBalance": aBalance == null ? null : aBalance,
        "uId": uId == null ? null : uId,
        "transaction": transaction == null ? null : List<dynamic>.from(transaction!.map((x) => x.toJson())),
    };
}

class Transaction {
    Transaction({
        this.tId,
        this.transacAmount,
        this.transacDecription,
        this.transacType,
        this.transacTime,
        this.directDebitDate,
        this.sourceAccId,
        this.destinationAccId,
    });

    int? tId;
    int? transacAmount;
    String? transacDecription;
    String? transacType;
    DateTime? transacTime;
    DateTime? directDebitDate;
    int? sourceAccId;
    int? destinationAccId;

    factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        tId: json["tId"] == null ? null : json["tId"],
        transacAmount: json["transacAmount"] == null ? null : json["transacAmount"],
        transacDecription: json["transacDecription"] == null ? null : json["transacDecription"],
        transacType: json["transacType"] == null ? null : json["transacType"],
        transacTime: json["transacTime"] == null ? null : DateTime.parse(json["transacTime"]),
        directDebitDate: json["directDebitDate"] == null ? null : DateTime.parse(json["directDebitDate"]),
        sourceAccId: json["sourceAccId"] == null ? null : json["sourceAccId"],
        destinationAccId: json["destinationAccId"] == null ? null : json["destinationAccId"],
    );

    Map<String, dynamic> toJson() => {
        "tId": tId == null ? null : tId,
        "transacAmount": transacAmount == null ? null : transacAmount,
        "transacDecription": transacDecription == null ? null : transacDecription,
        "transacType": transacType == null ? null : transacType,
        "transacTime": transacTime == null ? null : transacTime!.toIso8601String(),
        "directDebitDate": directDebitDate == null ? null : directDebitDate!.toIso8601String(),
        "sourceAccId": sourceAccId == null ? null : sourceAccId,
        "destinationAccId": destinationAccId == null ? null : destinationAccId,
    };
}
