import 'file:///C:/Users/OZT-Office/Documents/Flutter%20Projects/accounting/lib/utilities/appBar/appBar.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:flutter/material.dart';

/*
=================================================================================
 TABLE OF CONTENTS
 ------------------
 1. ChangeLanguage - Layout for 'Change Language'
 ================================================================================
 */


class ChangeLanguage extends StatefulWidget {
  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {

  // Set the default language
  bool english = true;
  bool malay = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().lightGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: TopAppBar(title: "change language"),
      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Label : Select Language
                Text("Select Language", style: TextStyle( fontSize: 15.0, color: Colors.grey,),),
                SizedBox(height: 10.0),

                // 2. Language options
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(width: 0.2, color: Colors.grey,),
                  ),

                  child: Column(
                    children: [

                      // 2.1 English
                      SizedBox(
                        height: 30.0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              english = true;
                              malay = false;
                            });
                          },
                          child: Row(
                              children: [
                                Expanded( flex: 7, child: Text("English", style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.w600),)),
                                if(english) Expanded( flex: 1, child: Icon(Icons.check_outlined, color: AppColors().blue)),
                              ],
                            ),
                        ),
                      ),
                      Divider(thickness: 1.0),

                      // 2.2 Malay
                      SizedBox(
                        height: 30.0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              malay = true;
                              english = false;
                            });
                          },
                          child: Row(
                            children: [
                              Expanded( flex: 7, child: Text("Malay", style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.w600),)),
                              if(malay) Expanded( flex: 1, child: Icon(Icons.check_outlined, color: AppColors().blue,)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),

        ),
      ),

      bottomNavigationBar: NavigationBar(index: 3,),
    );
  }
}
