import 'file:///C:/Users/OZT-Office/Documents/Flutter%20Projects/accounting/lib/utilities/appBar/appBar.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:flutter/material.dart';

/*
=================================================================================
 TABLE OF CONTENTS
 ------------------
 1. LedgerBookCategory - Defines how each category is layed out (display)
 2. LedgerBookCard - The layout for info of the respective category in card form
 ================================================================================
 */


class LedgerBookCategory extends StatefulWidget {

  String category;

  LedgerBookCategory({this.category});

  @override
  _LedgerBookCategoryState createState() => _LedgerBookCategoryState(category: category);
}

class _LedgerBookCategoryState extends State<LedgerBookCategory> {

  String category;
  _LedgerBookCategoryState({this.category});

  // Value for dropdown
  int dropdownYear = 2021;
  String dropdownMonth = "April";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().lightGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: TopAppBar(title: category),
      ),


      body: Column(

          children:[

            // 1. Filter options for Year and Month
            Padding(
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
                      items: <int> [2018,2019,2020,2021].map<DropdownMenuItem<int>>
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
                      onChanged: (String newValue) {
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

            // Content
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(20.0),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index ) {
                  return LedgerBookCard();
                },
              ),
            ),


          ]),

      bottomNavigationBar: NavigationBar(index: 1,),
    );
  }
}

// Widget : Ledger Book Card
class LedgerBookCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0,),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: 0.2, color: Colors.grey),
      ),

      child:  Column(
        children: [
          // 1. Name
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_right, color: AppColors().blue,), // not the right icon
              Text("110-000", style: TextStyle( fontSize: 16.0,),),
              SizedBox(width: 5.0),
              Text(
                "Owners Equity",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          SizedBox(height: 10.0),
          // 2. Debit, Credit & Balance
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text("Debit", style: TextStyle( fontSize: 13.0,),),
                    SizedBox(height: 5.0),
                    Text(
                      "0.00",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(left: BorderSide(width: 0.3, color: Colors.black,), right: BorderSide(width: 0.3, color: Colors.black,), ),
                  ),
                  child: Column(
                    children: [
                      Text("Credit", style: TextStyle( fontSize: 13.0,),),
                      SizedBox(height: 5.0),
                      Text(
                        "1,000.00",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text("Balance", style: TextStyle( fontSize: 13.0,),),
                    SizedBox(height: 5.0),
                    Text(
                      "1,000.00",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

