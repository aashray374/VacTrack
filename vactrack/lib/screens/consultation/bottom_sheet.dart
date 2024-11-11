import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vactrack/models/doctor.dart';
import 'package:vactrack/router/router_const.dart';
// import 'package:vactrack/screens/consultation/call_page.dart';

class BottomSheetDoctor extends StatelessWidget {
  const BottomSheetDoctor({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    final userId = TextEditingController();
    final username = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/doctor.jpg'),
          ),
          const SizedBox(height: 16),
          Text(
            doctor.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            doctor.specialization,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Video consultation action
                  // print("Video Consultation started");
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> CallPage(callID: "12345", user_id: userId.text, user_name: username.text)));
                },
                child: const Text("Video Consultation"),
              ),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).pushNamed(MyRouteConstants.chatScreen, extra: "parent_1_doctor_1");
                },
                child: const Text("Chat"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
