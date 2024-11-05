import 'package:flutter/material.dart';
import 'package:vactrack_admin/screens/login/form.dart';


class HospitalDetailsForm extends StatefulWidget {
  const HospitalDetailsForm({super.key});

  @override
  _HospitalDetailsFormState createState() => _HospitalDetailsFormState();
}

class _HospitalDetailsFormState extends State<HospitalDetailsForm> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeData().primaryColor,
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 450),
              child: Column(
                children: [
                  const Text("Please Fill All Details to Continue" ,style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),),
                  const SizedBox(height: 40,),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: SignUpForm(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
