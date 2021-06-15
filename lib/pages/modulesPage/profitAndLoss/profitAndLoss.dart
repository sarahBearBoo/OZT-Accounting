import 'package:accounting/pages/modulesPage/profitAndLoss/profitAndLossList.dart';
import 'file:///C:/Users/OZT-Office/Documents/Flutter%20Projects/accounting/lib/utilities/appBar/appBar.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
//import 'package:date_field/date_field.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

/*
=================================================================================
 TABLE OF CONTENTS
 ------------------
 1. LedgerBookCategory - Defines how each category is layed out (display)
 2. LedgerBookCard - The layout for info of the respective category in card form
 ================================================================================
 */


class ProfitAndLoss extends StatefulWidget {
  @override
  _ProfitAndLossState createState() => _ProfitAndLossState();
}

class _ProfitAndLossState extends State<ProfitAndLoss> {

  String active = "Income";

  final format = DateFormat("yyyy-MM-dd");

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
        child: TopAppBar(title: "PROFIT AND LOSS"),
      ),


      body: SingleChildScrollView(
        child: Column(

            children:[

              // 1. Navigation Tabs for Income & Expenses
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          active = "Income";
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: active == "Income" ? Border(bottom: BorderSide(width: 1.0,),) : Border(bottom: BorderSide(width: 0, color: Colors.white),),
                        ),
                        child: Text(
                          "Income",
                          textAlign: TextAlign.center,
                          style: active == "Income" ? TextStyle( fontSize: 16.0, fontWeight: FontWeight.w600,) : TextStyle( fontSize: 16.0,) ,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          active = "Expenses";
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: active == "Expenses" ? Border(bottom: BorderSide(width: 1.0,),) : Border(bottom: BorderSide(width: 0, color: Colors.white),),
                        ),
                        child: Text(
                          "Expenses",
                          textAlign: TextAlign.center,
                          style: active == "Expenses" ? TextStyle( fontSize: 16.0, fontWeight: FontWeight.w600,) : TextStyle( fontSize: 16.0,) ,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // 2. Filter options for Date Range
              // For now, this is just dummy pake textfield jak. Sabar lok laa
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    // DateTimeField(
                    //   format: format,
                    //   onShowPicker: (context, currentValue) {
                    //     return showDatePicker(
                    //         context: context,
                    //         firstDate: DateTime(1900),
                    //         initialDate: currentValue ?? DateTime.now(),
                    //         lastDate: DateTime(2100));
                    //   },
                    // ),

                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "2021",
                          hintStyle: TextStyle( color: Colors.black,),
                          enabledBorder: UnderlineInputBorder( borderSide: const BorderSide( color: Colors.black, width: 0.3)),
                        ),
                      ),
                    ),
                    Expanded( flex: 1, child: Icon(Icons.more_horiz),),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "April",
                          hintStyle: TextStyle( color: Colors.black,),
                          enabledBorder: UnderlineInputBorder( borderSide: const BorderSide( color: Colors.black, width: 0.3)),
                        ),
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
                    for(int i = 0; i < 2; i++) ProfitAndLossList(),
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


