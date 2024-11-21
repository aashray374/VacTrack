import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vactrack/models/child.dart';
import 'package:vactrack/router/router_const.dart';
import 'package:vactrack/services/child_services.dart';
import 'package:vactrack/widgets/child/child_list_tile.dart';

import '../../const.dart';

class ChildList extends StatefulWidget {
  const ChildList({super.key});

  @override
  State<ChildList> createState() => _ChildListState();
}

class _ChildListState extends State<ChildList> {
  List<Child> children = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchList();
  }

  Future<void> _fetchList() async{
    await ChildServices.fetchChildren();
    setState(() {
      isLoading = false;
      children.addAll(ChildServices.children);
    });
  }

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
      floatingActionButton: FloatingActionButton(onPressed: (){
        GoRouter.of(context).pushReplacementNamed(MyRouteConstants.addChild);
      },
      child: const Icon(Icons.add),),
      body: isLoading? const Center(
        child: CircularProgressIndicator(),
      ): children.isEmpty?const Center(
        child: Text("No Data Found"),
      ): Padding(padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        itemCount: children.length,
          itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              Child child = children[index];
              GoRouter.of(context).pushNamed(MyRouteConstants.childInfo,extra: child);
            },
              child: ChildListTile(child: children[index],));
          },),
      ),
    );
  }
}
