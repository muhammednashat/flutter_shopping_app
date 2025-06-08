
class User {
  String name;
  String email;
  String password;
  String phone;
  String address;

  User({
    required this.name,
    required this.email,
    required this.password,
    this.phone ="As_123456987",
    this.address = 'unDefiend',
  });

  Map<String, Object> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "address": address,
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'] as String,
        email: json['email'] as String,
        password: json['password'] as String,
        phone: json['phone'] as String,
        address: json['address'] as String,
      );
}