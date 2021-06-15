import 'package:accounting/pages/modulesPage/clientPage/clientInfoCategory.dart';
import 'file:///C:/Users/OZT-Office/Documents/Flutter%20Projects/accounting/lib/utilities/appBar/appBar.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:flutter/material.dart';

/*
========================================================================================
 TABLE OF CONTENTS
 ------------------
 1. ClientInfo - Defines layout for each client's info
 2. NavigationTabs - Tabs to toggle between categories: Summary, Sale or Acquisition
 =======================================================================================
 */

class ClientInfo extends StatefulWidget {

  // Default active tab
  final int active;
  ClientInfo({this.active});

  @override
  _ClientInfoState createState() => _ClientInfoState(active: active);
}

class _ClientInfoState extends State<ClientInfo> {

  int active; // Default active tab
  _ClientInfoState({this.active});

  // Value for dropdown (filter options)
  int dropdownYear = 2021;
  String dropdownMonth = "April";

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
        child: TopAppBar(title: "CLIENT"),
      ),


      body: Column(

          children:[

            // Navigation Tabs for Summary, Sale & Acquisition
            NavigationTabs(active: active),

            // Dropdown for Year and Month (Filter)
            if(active == 1 || active == 2)  Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: DropdownButton<int>(
                      value: dropdownYear,
                      icon: const Icon(Icons.arrow_forward_ios_outlined,),
                      iconSize: 20,
                      elevation: 16,
                      underline: Container(height: 0.3, color: Colors.black),
                      isExpanded: true,
                      onChanged: (int newValue){
                        setState(() {
                          dropdownYear = newValue;
                        });
                      },
                      items: <int>[2021, 2020, 2019, 2018].map<DropdownMenuItem<int>>
                        ((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text('$value'),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Expanded(
                    flex: 1,
                    child: DropdownButton<String>(
                      value: dropdownMonth,
                      icon: const Icon(Icons.arrow_forward_ios_outlined,),
                      iconSize: 20,
                      elevation: 16,
                      underline: Container(height: 0.3, color: Colors.black),
                      isExpanded: true,
                      onChanged: (String newValue){
                        setState(() {
                          dropdownMonth= newValue;
                        });
                      },
                      items: <String>["January", "February", "March", "April"].map<DropdownMenuItem<String>>
                        ((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            // 3. Container: To display each categories
            if(active == 0) Summary(),
            if(active == 1) Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(20.0),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index ) {
                  return Sale();
                },
              ),
            ),
            if(active == 2) Expanded(
              child: ListView.builder(
                padding: EdgeInsets.fromLTRB(20.0, 10.0,20.0,20.0),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index ) {
                  return Acquisition();
                },
              ),
            ),


          ]),

      bottomNavigationBar: NavigationBar(index: 1,),  // passing the index for this page
    );
  }
}

// Widget: Navigation Tabs for Client
class NavigationTabs extends StatelessWidget {

  int active;
  final List tabs = ["Summary", "Sale", "Acquisition"];


  NavigationTabs({this.active});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for(var i = 0; i < tabs.length; i++)
          Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              active = i;
              Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => ClientInfo(active: i),
                transitionDuration: Duration(seconds: 0),
              ),);
            },
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: active == i ? Border(bottom: BorderSide(width: 1.0,),) : Border(bottom: BorderSide(width: 0, color: Colors.white),),
              ),
              child: Text(
                tabs[i],
                textAlign: TextAlign.center,
                style: active == i ? TextStyle( fontSize: 13.0, fontWeight: FontWeight.w600,) : TextStyle( fontSize: 13.0,) ,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
