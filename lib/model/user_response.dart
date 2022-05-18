// To parse this JSON data, do
//
//     final userresponse = userresponseFromJson(jsonString);

import 'dart:convert';

Userresponse userresponseFromJson(String str) =>
    Userresponse.fromJson(json.decode(str));

String userresponseToJson(Userresponse data) => json.encode(data.toJson());

class Userresponse {
  Userresponse({
    this.body,
    this.stutus,
    this.message,
  });

  List<Body>? body;
  String? stutus;
  String? message;

  factory Userresponse.fromJson(Map<String, dynamic> json) => Userresponse(
        body: json["body"] == null
            ? null
            : List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
        stutus: json["stutus"] == null ? null : json["stutus"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "body": body == null
            ? null
            : List<dynamic>.from(body!.map((x) => x.toJson())),
        "stutus": stutus == null ? null : stutus,
        "message": message == null ? null : message,
      };
}

class Body {
  Body({
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
  Type? type;
  List<Bankaccount>? bankaccount;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        uId: json["uId"] == null ? null : json["uId"],
        fName: json["fName"] == null ? null : json["fName"],
        lName: json["lName"] == null ? null : json["lName"],
        addres: json["addres"] == null ? null : json["addres"],
        userEmail: json["userEmail"] == null ? null : json["userEmail"],
        password: json["password"] == null ? null : json["password"],
        type: json["type"] == null ? null : typeValues.map[json["type"]],
        bankaccount: json["bankaccount"] == null
            ? null
            : List<Bankaccount>.from(
                json["bankaccount"].map((x) => Bankaccount.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uId": uId == null ? null : uId,
        "fName": fName == null ? null : fName,
        "lName": lName == null ? null : lName,
        "addres": addres == null ? null : addres,
        "userEmail": userEmail == null ? null : userEmail,
        "password": password == null ? null : password,
        "type": type == null ? null : typeValues.reverse![type],
        "bankaccount": bankaccount == null
            ? null
            : List<dynamic>.from(bankaccount!.map((x) => x.toJson())),
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
        transaction: json["transaction"] == null
            ? null
            : List<Transaction>.from(
                json["transaction"].map((x) => Transaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "aId": aId == null ? null : aId,
        "aNumber": aNumber == null ? null : aNumber,
        "aBalance": aBalance == null ? null : aBalance,
        "uId": uId == null ? null : uId,
        "transaction": transaction == null
            ? null
            : List<dynamic>.from(transaction!.map((x) => x.toJson())),
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
  TransacDecription? transacDecription;
  TransacType? transacType;
  DateTime? transacTime;
  int? aId;
  int? sourceAccId;
  int? destinationAccId;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        tId: json["tId"] == null ? null : json["tId"],
        transacAmount:
            json["transacAmount"] == null ? null : json["transacAmount"],
        transacDecription: json["transacDecription"] == null
            ? null
            : transacDecriptionValues.map[json["transacDecription"]],
        transacType: json["transacType"] == null
            ? null
            : transacTypeValues.map[json["transacType"]],
        transacTime: json["transacTime"] == null
            ? null
            : DateTime.parse(json["transacTime"]),
        aId: json["aId"] == null ? null : json["aId"],
        sourceAccId: json["sourceAccId"] == null ? null : json["sourceAccId"],
        destinationAccId:
            json["destinationAccId"] == null ? null : json["destinationAccId"],
      );

  Map<String, dynamic> toJson() => {
        "tId": tId == null ? null : tId,
        "transacAmount": transacAmount == null ? null : transacAmount,
        "transacDecription": transacDecription == null
            ? null
            : transacDecriptionValues.reverse![transacDecription],
        "transacType": transacType == null
            ? null
            : transacTypeValues.reverse![transacType],
        "transacTime":
            transacTime == null ? null : transacTime!.toIso8601String(),
        "aId": aId == null ? null : aId,
        "sourceAccId": sourceAccId == null ? null : sourceAccId,
        "destinationAccId": destinationAccId == null ? null : destinationAccId,
      };
}

enum TransacDecription {
  WELCOME_WITHDRAW,
  WELCOME_TRANSFER,
  WELCOME_DEPOSITE,
  TRANSAC_DECRIPTION_WELCOME_DEPOSITE
}

final transacDecriptionValues = EnumValues({
  "Welcome deposite ": TransacDecription.TRANSAC_DECRIPTION_WELCOME_DEPOSITE,
  "Welcome deposite": TransacDecription.WELCOME_DEPOSITE,
  "Welcome transfer": TransacDecription.WELCOME_TRANSFER,
  "Welcome withdraw": TransacDecription.WELCOME_WITHDRAW
});

enum TransacType { W, T, D }

final transacTypeValues =
    EnumValues({"d": TransacType.D, "t": TransacType.T, "w": TransacType.W});

enum Type { A, C, E }

final typeValues = EnumValues({"A": Type.A, "C": Type.C, "E": Type.E});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
