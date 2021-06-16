import 'package:accounting/utilities/appBar/appBar.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:flutter/material.dart';

class FeatureUnavailable extends StatelessWidget {

  final String name;
  final int navIndex;
  FeatureUnavailable({this.name, this.navIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors().lightGrey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.0),
          child: TopAppBar(title: name),
        ),
      body: Center(
        child: Container(
          height: 300.0,
          child: Column(
            children: [
              Icon(Icons.error_outline, size: 80.0, color: Colors.grey,),
              SizedBox(height: 20.0),
              Text("Sorry! This feature is not available."),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(index: navIndex,),
    );
  }
}
