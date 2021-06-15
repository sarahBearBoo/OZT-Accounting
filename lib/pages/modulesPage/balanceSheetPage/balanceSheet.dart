import 'file:///C:/Users/OZT-Office/Documents/Flutter%20Projects/accounting/lib/utilities/appBar/appBar.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:flutter/material.dart';

import 'balanceSheetList.dart';

class BalanceSheet extends StatefulWidget {

  // Default active tab
  final int active;
  BalanceSheet({this.active});

  @override
  _BalanceSheetState createState() => _BalanceSheetState(active: active);
}

class _BalanceSheetState extends State<BalanceSheet> {

  int active; // Default active tab
  _BalanceSheetState({this.active});

  // Value for the dropdown
  int dropdownYear = 2021;
  String dropdownMonth = "April";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().lightGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: TopAppBar(title: "BALANCE SHEET"),
      ),


      body: SingleChildScrollView(
        child: Column(

            children:[

              // 1. Navigation Tabs for Income & Expenses
              NavigationTabs(active: active),

              // 2. Filter options for Date Range
              // For now, this is just dummy pake textfield jak. Sabar lok laa
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
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
                    Expanded( flex: 1, child: Icon(Icons.more_horiz),),
                    Expanded(
                      flex: 3,
                      child: DropdownButton<String>(
                        value: dropdownMonth,
                        icon: const Icon(Icons.arrow_forward_ios_outlined,),
                        iconSize: 20,
                        elevation: 16,
                        underline: Container(height: 0.3, color: Colors.black),
                        isExpanded: true,
                        onChanged: (String newValue){
                          setState(() {
                            dropdownMonth = newValue;
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

              // 3. Container: To display overall Profit And Loss
              Container(
                margin: EdgeInsets.fromLTRB(20.0,5.0,20.0,20.0),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 0.3, color: Colors.grey, ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        'PROFIT AND LOSS',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'RM -100.00',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 4. Container: Display more on income and expenses
              Container(
                margin: EdgeInsets.fromLTRB(20.0,5.0,20.0,20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 0.2, color: Colors.grey),
                ),
                child: Column(
                  children: [
                    for(int i = 0; i < 2; i++) BalanceSheetList(),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration( border: Border( bottom: BorderSide(width: 0.2, color: Colors.grey)),),
                      child: Row(
                        children: [
                          Expanded( flex: 4, child: Text("TOTAL", style: TextStyle( fontWeight: FontWeight.w600,))),
                          Expanded( flex: 2, child: Text("RM 10,000.00", textAlign: TextAlign.right,style: TextStyle( fontWeight: FontWeight.w600,))),
                        ],
                      ),
                    )
                  ],
                ),
              ),

            ]),
      ),

      bottomNavigationBar: NavigationBar(index: 1,),  // passing the index for this page
    );
  }
}

// Widget: Navigation Tabs for Balance Sheet
class NavigationTabs extends StatelessWidget {

  int active;
  final List tabs = ["Assets", "Liabilities"];


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
                  pageBuilder: (context, animation1, animation2) => BalanceSheet(active: i),
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
                  style: active == i ? TextStyle( fontSize: 16.0, fontWeight: FontWeight.w600,) : TextStyle( fontSize: 16.0,) ,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
