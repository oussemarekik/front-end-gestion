class Customer {
  Customer({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.consented,
    this.password,
    this.confirmPassword,
    this.locale,
  });

  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  bool consented;
  String? password;
  String? confirmPassword;
  String? locale;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    consented: json["consented"] == 1,
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone_number": phoneNumber,
    "password": password,
    "confirm_password": confirmPassword,
    "locale": 'fr_FR',
    "consented": consented ? "1" : "0",
  };
}
