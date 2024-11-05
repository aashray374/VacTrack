import 'package:vactrack/models/child.dart';

class Parent {
  final String email;
  final String? name;
  final String? adahar;
  final String? location;
  final List<Child> children;

  Parent({
    required this.email,
    this.name,
    this.adahar,
    this.location,
    required this.children,
  });

  factory Parent.fromJson(Map<String, dynamic> data) {
    return Parent(
      email: data['email'],
      name: data['name'],
      adahar: data['adahar'],
      location: data['location'],
      children: (data['children'] as List)
          .map((childData) => Child.fromJson(childData))
          .toList(),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'adahar': adahar,
      'location': location,
      'children': children.map((child) => child.toJson()).toList(),
    };
  }
}
