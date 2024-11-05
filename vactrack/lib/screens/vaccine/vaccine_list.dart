import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vactrack/models/vaccine.dart';
import 'package:vactrack/screens/vaccine/vaccine_card.dart';
import 'package:vactrack/services/child_sample_data.dart';

import '../../const.dart';

class VaccineList extends StatelessWidget {
  const VaccineList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Vaccine> list = SampleData().allVaccines;
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.appBarTitles[0]),
        elevation: 4,
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
            onPressed: () => GoRouter.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        itemCount: list.length,
          itemBuilder: (context,index){
        return VaccineCard(vaccine: list[index],);
      }),)
    );
  }
}
