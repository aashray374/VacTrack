import 'package:flutter/material.dart';

import '../../models/child.dart';

class ChildListTile extends StatelessWidget {
  const ChildListTile({super.key, required this.child});

  final Child child;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(20),
      child: SizedBox(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: ListTile(
              leading: CircleAvatar(child: Icon(Icons.person),),
              title: Text(child.name),
              subtitle: Text(child.dob.toString()),
            ),
          )
        ),
      ),
    );
  }
}
