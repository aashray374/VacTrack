import 'package:intl/intl.dart';
import 'package:vactrack/models/vaccine.dart';

class Child {
  final String name;
  final String adahar;
  final double gender;
  final String dob;
  final String? img;
  final List<Vaccine> vaccinesToBeGiven; // List of vaccines to be given
  final Map<Vaccine, String> vaccinesTaken; // Map of vaccine to the date it was given

  Child({
    required this.name,
    required this.adahar,
    required this.gender,
    required this.dob,
    this.img,
    this.vaccinesToBeGiven = const [],
    this.vaccinesTaken = const {},
  });

  // Method to get due date for each vaccine
  DateTime getVaccineDueDate(Vaccine vaccine) {
    DateTime dobDate = DateTime.parse(dob);
    return dobDate.add(Duration(days: vaccine.days));
  }

  // Method to get formatted date for displaying
  String getFormattedVaccineDueDate(Vaccine vaccine) {
    DateTime dueDate = getVaccineDueDate(vaccine);
    return DateFormat('yyyy-MM-dd').format(dueDate);
  }

  factory Child.fromJson(Map<String, dynamic> data) {
    return Child(
      name: data['name'],
      adahar: data['adahar'],
      gender: data['gender'],
      dob: data['dob'],
      img: data['img'],
      vaccinesToBeGiven: (data['vaccinesToBeGiven'] as List<dynamic>)
          .map((v) => Vaccine.fromJson(v as Map<String, dynamic>))
          .toList(),
      vaccinesTaken: (data['vaccinesTaken'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(Vaccine.fromJson(key as Map<String, dynamic>), value as String),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "adahar": adahar,
    "gender": gender,
    "dob": dob,
    "img": img,
    "vaccinesToBeGiven": vaccinesToBeGiven.map((v) => v.toJson()).toList(),
    "vaccinesTaken": vaccinesTaken.map((key, value) => MapEntry(key.toJson(), value)),
  };
}
