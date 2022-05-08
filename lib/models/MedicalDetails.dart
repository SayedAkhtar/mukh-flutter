class MedicalDetails {
  String id;
  String patientId;
  String diabetes;
  String hypertension;
  String thyroidType;
  String createdAt;
  String updatedAt;
  String deletedAt;
  List medicalDocs;
  List<MedicalCondition> medicalConditions;

  MedicalDetails({
    required this.id,
    required this.patientId,
    required this.diabetes,
    required this.hypertension,
    required this.thyroidType,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.medicalDocs,
    required this.medicalConditions,
  });
}

class MedicalCondition {
  String id, medHistId, desc, createdAt, updatedAt;

  MedicalCondition({
    required this.id,
    required this.medHistId,
    required this.desc,
    required this.createdAt,
    required this.updatedAt,
  });
}
