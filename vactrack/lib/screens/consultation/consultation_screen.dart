import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vactrack/screens/consultation/consultation_tile.dart';
import 'package:vactrack/models/doctor.dart';
import 'package:vactrack/services/child_sample_data.dart';

import '../../const.dart';

class ConsultationScreen extends StatelessWidget {
  const ConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Doctor> doctors = SampleData().doctors;
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.appBarTitles[0]),
        elevation: 4,
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
            onPressed: () => GoRouter.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              return ConsultationTile(doctor: doctors[index],);
            }),
      ),
    );
  }
}
