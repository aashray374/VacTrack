import 'package:flutter/material.dart';
import 'package:vactrack/models/vaccine.dart';

class VaccineCard extends StatelessWidget {
  const VaccineCard({super.key, required this.vaccine});

  final Vaccine vaccine;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        child: GestureDetector(
          onTap: (){
            //navigate to vaccine details page
          },
          child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: ListTile(
                  leading: const Icon(Icons.vaccines),
                  title: Text(vaccine.name),
                ),
              )
          ),
        ),
      ),
    );
  }
}
