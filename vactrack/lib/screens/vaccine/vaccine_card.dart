import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vactrack/models/vaccine.dart';
import 'package:vactrack/router/router_const.dart';

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
            GoRouter.of(context).pushNamed(MyRouteConstants.detailsVaccine,extra: vaccine);
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
