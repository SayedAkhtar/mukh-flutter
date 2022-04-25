class Patient {
  String id;
  String firstName, lastName;
  String email;
  String city;
  String dateOfBirth;
  String doctorId;
  String type;
  String primaryPhone;
  String? alternatePhone;
  String gender;
  String address;
  String bloodGroup;
  String createdAt, updatedAt, deletedAt;
  String? image;

  Patient(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.dateOfBirth,
      required this.primaryPhone,
      required this.address,
      this.alternatePhone = '',
      required this.city,
      required this.type,
      required this.doctorId,
      required this.createdAt,
      required this.updatedAt,
      required this.deletedAt,
      this.image = '',
      required this.bloodGroup,
      required this.gender});
}
