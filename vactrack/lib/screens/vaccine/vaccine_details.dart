import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vactrack/models/vaccine.dart';

class VaccineDetails extends StatelessWidget {
  const VaccineDetails({super.key, required this.vaccine});

  final Vaccine vaccine;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF7B3FAF),
        leading: IconButton(
            onPressed: () => GoRouter.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios)),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      Text(vaccine.name),
                      const SizedBox(height: 8,),
                      const Text("Estimate"),
                      const SizedBox(height: 4,),
                      Text(vaccine.days.toString())
                    ],
                  ),
                ),
              )
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                const Center(child: Text("Usage")),
                const SizedBox(height: 12,),
                Text(vaccine.usage),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
