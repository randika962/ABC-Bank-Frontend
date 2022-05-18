// To parse this JSON data, do
//
//     final transactionresponse = transactionresponseFromJson(jsonString);

import 'dart:convert';

List<Transactionresponse> transactionresponseFromJson(String str) =>
    List<Transactionresponse>.from(
        json.decode(str).map((x) => Transactionresponse.fromJson(x)));

String transactionresponseToJson(List<Transactionresponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Transactionresponse {
  Transactionresponse({
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

  factory Transactionresponse.fromJson(Map<String, dynamic> json) =>
      Transactionresponse(
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
  WELCOME_DEPOSITE,
  TRANSAC_DECRIPTION_WELCOME_DEPOSITE,
  WELCOME_TRANSFER
}

final transacDecriptionValues = EnumValues({
  "Welcome deposite ": TransacDecription.TRANSAC_DECRIPTION_WELCOME_DEPOSITE,
  "Welcome deposite": TransacDecription.WELCOME_DEPOSITE,
  "Welcome transfer": TransacDecription.WELCOME_TRANSFER,
  "Welcome withdraw": TransacDecription.WELCOME_WITHDRAW
});

enum TransacType { W, D, T }

final transacTypeValues =
    EnumValues({"d": TransacType.D, "t": TransacType.T, "w": TransacType.W});

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
