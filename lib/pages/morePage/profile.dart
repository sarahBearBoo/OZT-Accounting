import 'package:accounting/utilities/appBar/appBar.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:flutter/material.dart';

/*
=================================================================================
 TABLE OF CONTENTS
 ------------------
 1. Profile - Layout for user's profile
 2. EachInfoCard - Layout for each info
 ================================================================================
 */


class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().lightGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: TopAppBar(title: "MY PROFILE"),
      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [

              // 1. Greetings card
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 0.2, color: Colors.grey,),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hello,", style: TextStyle( fontSize: 15.0,),),
                          SizedBox(height: 5.0),
                          Text(
                            "Bridget Skyler!",
                            softWrap: true,
                            style: TextStyle( fontSize: 23.0, fontWeight: FontWeight.w500,),
                          ),
                        ],
                      ),
                    ),
                    Expanded( flex: 1, child: Image.asset('assets/images/client icon.png')),
                  ],
                ),
              ),
              SizedBox(height: 20.0,),

              // 2. User's info
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 20.0),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 0.2, color: Colors.grey,),
                ),

                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    EachInfoCard(name: "Department", data: "Management"),
                    EachInfoCard(name: "Mobile", data: "0123456789"),
                    EachInfoCard(name: "Email", data: "bridgetskyler@gmail.com"),
                    EachInfoCard(name: "Employment Type", data: "Permanent"),
                    EachInfoCard(name: "Gender", data: "Female"),
                    EachInfoCard(name: "Office", data: "Main Branch"),
                    EachInfoCard(name: "Join Date", data: "1 Jan 2020"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: NavigationBar(index: 3,),  // passing the index for this page
    );
  }
}


// Widget: EachInfoCard
class EachInfoCard extends StatelessWidget {

  final String name, data;

  EachInfoCard({this.name, this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //decoration: BoxDecoration( border: Border( bottom: BorderSide(width: 0.3, color: Colors.grey),),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.0),
          Text("$name", style: TextStyle( fontSize: 14.0, color: Colors.grey,),),
          SizedBox(height: 10.0),
          Text(
            "$data",
            softWrap: true,
            style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.w500,),
          ),
          Divider(height: 20.0, thickness: 1.0, ),
        ],
      ),
    );
  }
}
