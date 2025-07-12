

import 'package:hive/hive.dart';
// part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String name;
  @HiveField(1)
  String email;
  @HiveField(2)
  String phone;
  @HiveField(3)
  String address;
  @HiveField(4)
  String id;

  User({
    required this.name,
    required this.email,

    required this.phone,
    required this.address,
    required this.id,

  });

  Map<String, Object> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "id":id
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'] as String,
        email: json['email'] as String,
        phone: json['phone'] as String,
        address: json['address'] as String,
        id: json['_id'] as String,

      );



 @override
String toString() {
  return 'User{id: $id,name: $name, email: $email, phone: $phone, address: $address}';
}
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    return User(
      name: reader.readString(),
      email: reader.readString(),
      phone: reader.readString(),
      address: reader.readString(),
      id: reader.readString(),

    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.email);
    writer.writeString(obj.phone);
    writer.writeString(obj.address);
    writer.writeString(obj.id); 

  }
}
