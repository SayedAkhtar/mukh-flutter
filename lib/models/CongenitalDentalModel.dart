// To parse this JSON data, do
//
//     final congenitalDentalModel = congenitalDentalModelFromJson(jsonString);

import 'dart:convert';

class CongenitalDentalModel {
  CongenitalDentalModel({
    this.earDeformity,
    this.eyeDeformity,
    this.noseDeformity,
    this.micrognathia,
    this.forehead,
    this.teeth,
    this.cleft,
    this.skin,
    this.digits,
    this.hair,
  });

  String? earDeformity;
  String? eyeDeformity;
  String? noseDeformity;
  String? micrognathia;
  String? forehead;
  String? teeth;
  String? cleft;
  String? skin;
  String? digits;
  String? hair;

  factory CongenitalDentalModel.fromRawJson(String str) => CongenitalDentalModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CongenitalDentalModel.fromJson(Map<String, dynamic> json) => CongenitalDentalModel(
    earDeformity: json["ear_deformity"] == null ? null : json["ear_deformity"],
    eyeDeformity: json["eye_deformity"] == null ? null : json["eye_deformity"],
    noseDeformity: json["nose_deformity"] == null ? null : json["nose_deformity"],
    micrognathia: json["micrognathia"] == null ? null : json["micrognathia"],
    forehead: json["forehead"] == null ? null : json["forehead"],
    teeth: json["teeth"] == null ? null : json["teeth"],
    cleft: json["cleft"] == null ? null : json["cleft"],
    skin: json["skin"] == null ? null : json["skin"],
    digits: json["digits"] == null ? null : json["digits"],
    hair: json["hair"] == null ? null : json["hair"],
  );

  Map<String, dynamic> toJson() => {
    "ear_deformity": earDeformity == null ? null : earDeformity,
    "eye_deformity": eyeDeformity == null ? null : eyeDeformity,
    "nose_deformity": noseDeformity == null ? null : noseDeformity,
    "micrognathia": micrognathia == null ? null : micrognathia,
    "forehead": forehead == null ? null : forehead,
    "teeth": teeth == null ? null : teeth,
    "cleft": cleft == null ? null : cleft,
    "skin": skin == null ? null : skin,
    "digits": digits == null ? null : digits,
    "hair": hair == null ? null : hair,
  };
}
