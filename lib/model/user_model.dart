import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserMode {
  final String id;
  final String name;
  final String user;
  final String password;
  final String position;
  UserMode({
    required this.id,
    required this.name,
    required this.user,
    required this.password,
    required this.position,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'user': user,
      'password': password,
      'position': position,
    };
  }

  factory UserMode.fromMap(Map<String, dynamic> map) {
    return UserMode(
      id: map['id'] as String,
      name: map['name'] as String,
      user: map['user'] as String,
      password: map['password'] as String,
      position: map['position'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserMode.fromJson(String source) =>
      UserMode.fromMap(json.decode(source) as Map<String, dynamic>);
}
