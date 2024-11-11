import 'dart:ffi';

import 'package:vactrack/models/doctor.dart';

class Hospital {
  int id;
  String name;
  String location;
  double lat;
  double long;
  String contactNumber;
  List<Doctor> doctors;

  Hospital({
    required this.id,
    required this.name,
    required this.location,
    required this.lat,
    required this.long,
    required this.contactNumber,
    required this.doctors,
  });

  // Factory method to create a Hospital from JSON
  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      id: json['id'] as int,
      name: json['name'] as String,
      location: json['location'] as String,
      lat: json['lat'] as double,
      long: json['long'] as double,
      contactNumber: json['contactNumber'] as String,
      doctors: (json['doctors'] as List<dynamic>)
          .map((doctorJson) => Doctor.fromJson(doctorJson as Map<String, dynamic>))
          .toList(),
    );
  }

  // Method to convert a Hospital instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'lat': lat,
      'long': long,
      'contactNumber': contactNumber,
      'doctors': doctors.map((doctor) => doctor.toJson()).toList(),
    };
  }
}
