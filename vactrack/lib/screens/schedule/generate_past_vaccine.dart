import 'package:flutter/material.dart';
import 'package:vactrack/models/vaccine.dart';
import 'package:vactrack/screens/schedule/vaccine_card_prev.dart';

class GeneratePastVaccine extends StatelessWidget {
  const GeneratePastVaccine({super.key, required this.list});

  final Map<Vaccine,String> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding:  const EdgeInsets.only(top: 20),
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context,index){
        Vaccine key = list.keys.elementAt(index);
        String value = list[key]!;

        return VaccineCardPrev(vaccine: key, date: value);
      }),),
    );
  }
}
