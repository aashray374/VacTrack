import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vactrack/models/vaccine.dart';
import 'package:vactrack/screens/schedule/vaccine_card.dart';

import '../../const.dart';
import '../../models/child.dart';

class GenerateTimeline extends StatelessWidget {
  const GenerateTimeline(
      {super.key, required this.vaccines, required this.child});

  final List<Vaccine> vaccines;
  final Child child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
            itemCount: vaccines.length,
            itemBuilder: (context, index) {
              return VaccineCard(vaccine: vaccines[index], child: child);
            }),
      ),
    );
  }
}
