// To parse this JSON data, do
//
//     final acquiredDentalRecord = acquiredDentalRecordFromJson(jsonString);

import 'dart:convert';

class AcquiredDentalModel {
  AcquiredDentalModel({
    this.dentalRecordGroupId,
    required this.facePart,
    this.tobacco,
    this.trauma,
    this.pain,
    this.discharge,
    this.burn,
    this.surgery,
    this.radiation,
    this.swelling,
  });

  int? dentalRecordGroupId;
  String facePart;
  String? tobacco;
  String? trauma;
  String? pain;
  String? discharge;
  String? burn;
  String? surgery;
  String? radiation;
  String? swelling;

  factory AcquiredDentalModel.fromRawJson(String str) => AcquiredDentalModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AcquiredDentalModel.fromJson(Map<String, dynamic> json) => AcquiredDentalModel(
    dentalRecordGroupId: json["dental_record_group_id"] == null ? null : json["dental_record_group_id"],
    facePart: json["face_part"] == null ? null : json["face_part"],
    tobacco: json["tobacco"] == null ? null : json["tobacco"],
    trauma: json["trauma"] == null ? null : json["trauma"],
    pain: json["pain"] == null ? null : json["pain"],
    discharge: json["discharge"] == null ? null : json["discharge"],
    burn: json["burn"] == null ? null : json["burn"],
    surgery: json["surgery"] == null ? null : json["surgery"],
    radiation: json["radiation"] == null ? null : json["radiation"],
    swelling: json["swelling"] == null ? null : json["swelling"],
  );

  Map<String, dynamic> toJson() => {
    "face_part": facePart == null ? null : facePart,
    "tobacco": tobacco == null ? null : tobacco,
    "trauma": trauma == null ? null : trauma,
    "pain": pain == null ? null : pain,
    "discharge": discharge == null ? null : discharge,
    "burn": burn == null ? null : burn,
    "surgery": surgery == null ? null : surgery,
    "radiation": radiation == null ? null : radiation,
    "swelling": swelling == null ? null : swelling,
  };
}
