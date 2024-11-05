import 'package:flutter/material.dart';
import 'package:vactrack/models/vaccine.dart';

class VaccineCardPrev extends StatelessWidget {
  const VaccineCardPrev({super.key, required this.vaccine, required this.date});

  final Vaccine vaccine;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListTile(
                leading: const Icon(Icons.bookmark_border),
                title: Text(vaccine.name),
                subtitle: Text(date),
              ),
            )
        ),
      ),
    );
  }
}
