import 'package:flutter/material.dart';
import 'package:vactrack/models/doctor.dart';
import 'package:vactrack/screens/consultation/bottom_sheet.dart';

class ConsultationTile extends StatelessWidget {
  const ConsultationTile({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        child: GestureDetector(
          onTap: (){
            showModalBottomSheet(
              context: context,
              isScrollControlled: true, // Allow bottom sheet height to be controlled
              builder: (BuildContext context) {
                return BottomSheetDoctor(doctor: doctor);
              },
            );
          },
          child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/doctor.jpg'),
                  ),
                    title: Text(doctor.name),
                  subtitle: Text(doctor.specialization),
                ),
              )
          ),
        ),
      ),
    );
  }
}
