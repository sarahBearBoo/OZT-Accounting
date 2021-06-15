import 'package:accounting/utilities/colors.dart';
import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget {

  final String title;

  TopAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "$title".toUpperCase(),
        style: TextStyle(
          fontSize: 19.0,
          color: Colors.black,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,

      // To create border at the bottom of app bar
      bottom: PreferredSize(
          child: Container(
            color: Colors.black,
            height: 0.1,
          ),
          preferredSize: Size.fromHeight(4.0)
      ),
      // Styling the back button

      leading: BackButton(
        color: title.toUpperCase() != "DASHBOARD" ? AppColors().blue : Colors.transparent,
      ),
    );
  }
}
