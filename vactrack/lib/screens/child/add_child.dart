import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vactrack/const.dart';
import 'package:vactrack/screens/child/child_details_form.dart';

class AddChild extends StatefulWidget {
  const AddChild({super.key});

  @override
  State<AddChild> createState() => _AddChildState();
}

class _AddChildState extends State<AddChild> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.appBarTitles[0]),
        elevation: 4,
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
            onPressed: () => GoRouter.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      // floatingActionButton: ,
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: ChildDetailsForm()
      ),
    );
  }
}
