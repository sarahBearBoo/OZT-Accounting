import 'package:accounting/utilities/colors.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {

  // Index starts with 0
  //  0 - Dashboard / Home
  //  1 - Modules
  //  2 - Inbox
  //  3 - More
  final int index;
  NavigationBar({this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: double.infinity,
      height: 55.0,
      color: Colors.white,

      child: Row(
        children: [

          // Home / Dashboard
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil('/dashboard', (route) => false);
              },
              child: Column(
                  children: [

                    // Icon
                    Expanded(
                        flex: 2,
                        child: Icon(
                          Icons.home,
                          color: index == 0 ? AppColors().blue: Colors.grey[400],
                        )
                    ),
                    SizedBox(height: 3.0),
                    // Name
                    Expanded(
                        flex: 1,
                        child: Text(
                          "Home",
                          style: TextStyle(
                            color: index == 0 ? AppColors().blue: Colors.grey[400],
                            fontSize: 10.0,
                          ),
                        )
                    ),
                  ],
                ),
            ),
          ),

          // Modules
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil('/modules', (route) => false);
              },
              child: Column(
                  children: [

                    // Icon
                    Expanded(
                        flex: 2,
                        child: Icon(
                          Icons.dashboard_customize,
                          color: index == 1 ? AppColors().blue: Colors.grey[400],
                        )
                    ),
                    SizedBox(height: 3.0),
                    // Name
                    Expanded(
                        flex: 1,
                        child: Text(
                          "Modules",
                          style: TextStyle(
                            color: index == 1 ? AppColors().blue: Colors.grey[400],
                            fontSize: 10.0,
                          ),
                        )
                    ),
                  ],
                ),
            ),
          ),

          // Inbox
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil('/textfieldtest', (route) => false);
              },
              child: Column(
                  children: [

                    // Icon
                    Expanded(
                        flex: 2,
                        child: Icon(
                          Icons.mail_outline,
                          color: index == 2 ? AppColors().blue: Colors.grey[400],
                        )
                    ),
                    SizedBox(height: 3.0),
                    // Name
                    Expanded(
                        flex: 1,
                        child: Text(
                          "Inbox",
                          style: TextStyle(
                            color: index == 2 ? AppColors().blue: Colors.grey[400],
                            fontSize: 10.0,
                          ),
                        )
                    ),
                  ],
                ),
            ),
          ),

          // More
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil('/more', (route) => false);
              },
              child: Column(
                  children: [

                    // Icon
                    Expanded(
                        flex: 2,
                        child: Icon(
                          Icons.more_horiz,
                          color: index == 3 ? AppColors().blue: Colors.grey[400],
                        )
                    ),
                    SizedBox(height: 3.0),
                    // Name
                    Expanded(
                        flex: 1,
                        child: Text(
                          "More",
                          style: TextStyle(
                            color: index == 3 ? AppColors().blue: Colors.grey[400],
                            fontSize: 10.0,
                          ),
                        )
                    ),
                  ],
                ),
            ),
          ),
        ]
      ),
    );
  }
}
