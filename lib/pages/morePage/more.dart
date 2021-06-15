import 'package:accounting/pages/featureUnavailablePage/featureUnavailable.dart';
import 'file:///C:/Users/OZT-Office/Documents/Flutter%20Projects/accounting/lib/utilities/appBar/appBar.dart';
import 'package:accounting/pages/morePage/changePassword.dart';
import 'package:accounting/pages/morePage/profile.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'changeLanguage.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().lightGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: TopAppBar(title: "MORE"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[

                // 1. Top section: Icon & Name
                Center(child: Image.asset('assets/images/client icon.png',)),
                SizedBox(height: 5.0),
                Center(
                  child: Text(
                    "Bridget Skyler",
                    style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.w600,),
                  ),
                ),
                SizedBox(height: 5.0),
                Center(child: Text("One or Zero Technologies Sdn Bhd", style: TextStyle(fontSize: 13.0,),),),
                SizedBox(height: 15.0),

                // 2. Section: Account
                Text(
                  "Account",
                  style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.w600,),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0, bottom: 20.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(width: 0.2, color: Colors.grey,),
                  ),

                  child: Column(
                    children: [
                      // 2.1 Profile
                      Container(
                        height: 40.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile()));
                          },
                          child: Row(
                          children: [
                            Expanded( flex: 7, child: Text("My profile", style: TextStyle( fontSize: 15.0,),)),
                            Expanded( flex: 1, child: Icon(Icons.arrow_forward_ios_outlined)),
                          ],
                          ),
                        ),
                      ),

                      // 2.2 Change Password
                      Container(
                        height: 40.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangePassword()));
                          },
                          child: Row(
                            children: [
                              Expanded( flex: 7, child: Text("Change password", style: TextStyle( fontSize: 15.0,),)),
                              Expanded( flex: 1, child: Icon(Icons.arrow_forward_ios_outlined)),
                            ],
                          ),
                        ),
                      ),

                      // 2.3 Change language
                      Container(
                        height: 40.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangeLanguage()));
                          },
                          child: Row(
                            children: [
                              Expanded( flex: 7, child: Text("Change language", style: TextStyle( fontSize: 15.0,),)),
                              Expanded( flex: 1, child: Icon(Icons.arrow_forward_ios_outlined)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // 3. Section: Support
                Text(
                  "Support",
                  style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.w600,),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0, bottom: 20.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(width: 0.2, color: Colors.grey,),
                  ),

                  child: Column(
                    children: [
                      // 3.1 Help Center
                      Container(
                        height: 40.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => FeatureUnavailable(name: "Help Center", navIndex: 3,)));
                          },
                          child: Row(
                            children: [
                              Expanded( flex: 7, child: Text("Help center", style: TextStyle( fontSize: 15.0,),)),
                              Expanded( flex: 1, child: Icon(Icons.arrow_forward_ios_outlined)),
                            ],
                          ),
                        ),
                      ),
                      // 3.2 Contact us
                      Container(
                        height: 40.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => FeatureUnavailable(name: "Contact Us", navIndex: 3,)));
                          },
                          child: Row(
                            children: [
                              Expanded( flex: 7, child: Text("Contact us", style: TextStyle( fontSize: 15.0,),)),
                              Expanded( flex: 1, child: Icon(Icons.arrow_forward_ios_outlined)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // 4. Section: Legal
                Text(
                  "Legal",
                  style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.w600,),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0, bottom: 25.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(width: 0.2, color: Colors.grey,),
                  ),

                  child: Column(
                    children: [
                      // 4.1 Terms of service
                      Container(
                        height: 40.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => FeatureUnavailable(name: "Terms of Service", navIndex: 3,)));
                          },
                          child: Row(
                            children: [
                              Expanded( flex: 7, child: Text("Terms of service", style: TextStyle( fontSize: 15.0,),)),
                              Expanded( flex: 1, child: Icon(Icons.arrow_forward_ios_outlined)),
                            ],
                          ),
                        ),
                      ),
                      // 4.2 Privacy policy
                      Container(
                        height: 40.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => FeatureUnavailable(name: "Privacy Policy", navIndex: 3,)));
                          },
                          child: Row(
                            children: [
                              Expanded( flex: 7, child: Text("Privacy policy", style: TextStyle( fontSize: 15.0,),)),
                              Expanded( flex: 1, child: Icon(Icons.arrow_forward_ios_outlined)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // 5. Log Out button
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: TextButton(
                    onPressed: (){
                      /* Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Dashboard()),
                            (Route<dynamic> route) => false,
                      );

                       */
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red[50]),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'LOG OUT',
                      style: TextStyle(
                        fontSize: 18.0,
                        letterSpacing: 1.2,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

              ]),
        ),
      ),

      bottomNavigationBar: NavigationBar(index: 3),  // passing the index for this page
    );
  }
}
