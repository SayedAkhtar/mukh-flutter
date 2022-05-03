class Prescription {
  String id, patientId, notes, createdAt, updatedAt, deletedAt;
  List<dynamic> medicines;

  Prescription({
    required this.id,
    required this.patientId,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.medicines,
  });

  static Prescription fromJson(i) {
    return Prescription(
      id: i['id'].toString(),
      patientId: i['patient_id'].toString(),
      notes: i['notes'].toString(),
      createdAt: i['created_at'].toString(),
      updatedAt: i['updated_at'].toString(),
      deletedAt: i['deleted_at'].toString(),
      medicines: i['medicines'].map((x) => Medicines.fromJson(x)).toList(),
    );
  }
}

class Medicines {
  String id,
      prescriptionId,
      name,
      dosage,
      dosageStart,
      dosageEnd,
      instructions,
      createdAt,
      updatedAt,
      deletedAt;

  Medicines({
    required this.id,
    required this.prescriptionId,
    required this.name,
    required this.dosage,
    required this.dosageStart,
    required this.dosageEnd,
    required this.instructions,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  static Medicines fromJson(i) {
    return Medicines(
      id: i['id'].toString(),
      prescriptionId: i['prescription_id'].toString(),
      name: i['name'].toString(),
      dosage: i['dosage'].toString(),
      dosageStart: i['dosage_start'].toString(),
      dosageEnd: i['dosage_end'].toString(),
      instructions: i['instructions'].toString(),
      createdAt: i['created_at'].toString(),
      updatedAt: i['updated_at'].toString(),
      deletedAt: i['deleted_at'].toString(),
    );
  }
}
