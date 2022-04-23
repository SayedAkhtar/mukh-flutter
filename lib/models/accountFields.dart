class AccountFields {
  static final List<String> values = [id, firstName, lastName];

  static final String id = '_id';
  static final String firstName = 'first_name';
  static final String lastName = 'last_name';
  static final String email = 'email';
  static final String type = 'type';
  static final String registrationId = 'registration_id';
  static final String primaryPhone = 'primary_phone';
  static final String alternatePhone = 'alt_phone';
  static final String gender = 'gender';
  static final String city = 'city';
  static final String image = 'image';
  static final String accountVerifiedAt = 'account_verified_at';
  static final String emailVerifiedAt = 'email_verified_at';
  static final String updatedAt = 'updated_at';
  static final String createdAt = 'created_at';
  static final String deletedAt = 'deleted_at';

  static Map<String, Object?> toJson(var result) => {
        AccountFields.id: result['id'],
        AccountFields.firstName: result['first_name'],
        AccountFields.lastName: result['last_name'],
        AccountFields.email: result['email'],
        AccountFields.type: result['type'],
        AccountFields.registrationId: result['registration_id'],
        AccountFields.primaryPhone: result['primary_phone'],
        AccountFields.alternatePhone: result['alternate_phone'],
        AccountFields.accountVerifiedAt: result['account_verified_at'],
        AccountFields.emailVerifiedAt: result['email_verified_at'],
        AccountFields.updatedAt: result['updated_at'],
        AccountFields.createdAt: result['created_at'],
        AccountFields.deletedAt: result['deleted_at'],
        AccountFields.gender: result['gender'],
        AccountFields.city: result['city'],
        AccountFields.image: result['image']
      };
}
