class User {
  final int idClient;
  final String nameClient;
  final String surnameClient;
  final String loginClient;
  final String phoneNumberClient;
  final String emailClient;
  final String passwordClient;
  final String salt;
  final int passportNumberClient;
  final int passportSeriesClient;

  User({
    required this.idClient, 
    required this.nameClient, 
    required this.surnameClient, 
    required this.loginClient, 
    required this.phoneNumberClient, 
    required this.emailClient, 
    required this.passwordClient, 
    required this.salt, 
    required this.passportNumberClient, 
    required this.passportSeriesClient
  }); 

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idClient: json['idClient'],
      nameClient: json['nameClient'] ?? '',
      surnameClient: json['surnameClient'] ?? '',
      loginClient: json['loginClient'] ?? '',
      phoneNumberClient: json['phoneNumberClient'] ?? '',
      emailClient: json['emailClient'] ?? '',
      passwordClient: json['passwordClient'] ?? '',
      salt: json['salt'] ?? '',
      passportNumberClient: json['passportNumberClient'],
      passportSeriesClient: json['passportSeriesClient']
    );
  }

}


