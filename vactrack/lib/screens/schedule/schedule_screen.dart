import 'package:flutter/material.dart';
import 'package:vactrack/models/child.dart';
import 'package:vactrack/screens/schedule/generate_past_vaccine.dart';
import 'package:vactrack/screens/schedule/generate_timeline.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key, required this.child});

  final Child child;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: "Prev Vaccines"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GeneratePastVaccine(list: child.vaccinesTaken),
          ],
        ),
      ),
    );
  }
}
