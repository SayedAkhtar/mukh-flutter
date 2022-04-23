class Doctor {
  String id;
  String firstName, lastName;
  String email;
  String city;
  String regId;
  String type;
  String primaryPhone;
  String? alternatePhone;
  String gender;
  String createdAt, updatedAt, deletedAt;
  String? image;
  String emailVerifiedAt, accountVerifiedAt;

  Doctor(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.primaryPhone,
      this.alternatePhone = '',
      required this.city,
      required this.type,
      required this.regId,
      required this.createdAt,
      required this.updatedAt,
      required this.deletedAt,
      this.image = '',
      required this.accountVerifiedAt,
      required this.emailVerifiedAt,
      required this.gender});
}
