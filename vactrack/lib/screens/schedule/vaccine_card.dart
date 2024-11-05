import 'package:flutter/material.dart';
import 'package:vactrack/models/vaccine.dart';

import '../../models/child.dart';

class VaccineCard extends StatelessWidget {
  const VaccineCard({super.key, required this.vaccine, required this.child});

  final Vaccine vaccine;
  final Child child;

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
                subtitle: Text(child.getFormattedVaccineDueDate(vaccine)),
              ),
            )
        ),
      ),
    );
  }
}
