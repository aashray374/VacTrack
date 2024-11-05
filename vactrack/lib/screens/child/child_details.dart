import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vactrack/models/child.dart';
import 'package:vactrack/screens/schedule/schedule_screen.dart';

import '../../const.dart';

class ChildDetails extends StatelessWidget {
  const ChildDetails({super.key, required this.child});

  final Child child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.appBarTitles[0]),
        elevation: 4,
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: 200,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.person),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name
                          Text(
                            child.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Aadhaar
                          Row(
                            children: [
                              const Icon(Icons.credit_card, size: 16, color: Colors.grey),
                              const SizedBox(width: 8),
                              Text(
                                "Aadhaar: ${child.adahar}",
                                style: const TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Date of Birth
                          Row(
                            children: [
                              const Icon(Icons.cake, size: 16, color: Colors.grey),
                              const SizedBox(width: 8),
                              Text(
                                "DOB: ${child.dob}",
                                style: const TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Gender
                          Row(
                            children: [
                              const Icon(Icons.person, size: 16, color: Colors.grey),
                              const SizedBox(width: 8),
                              Text(
                                "Gender: ${child.gender == 1.0 ? 'Male' : 'Female'}",
                                style: const TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ScheduleScreen(child: child)));
                },
                icon: const Icon(Icons.schedule),
                label: const Text("Schedule"),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Action for second button
                },
                icon: const Icon(Icons.video_call),
                label: const Text("Consultation"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
