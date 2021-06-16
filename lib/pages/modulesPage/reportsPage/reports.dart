import 'package:accounting/utilities/appBar/appBar.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:flutter/material.dart';

class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {

  // Initial values for dropdown
  int dropdownYear = 2021;
  String dropdownMonth = "April";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().lightGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: TopAppBar(title: "REPORTS"),
      ),


      body: Column(

          children:[

            // 1. Filter options for Year and Month
            // For now, this is just dummy pake textfield jak. Sabar lok laa
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: DropdownButton<int>(
                      value: dropdownYear,
                      icon: const Icon(Icons.arrow_forward_ios_outlined),
                      iconSize: 20.0,
                      elevation: 16,
                      underline: Container(height: 0.3, color: Colors.black),
                      isExpanded: true,
                      onChanged: (int newValue){
                        setState(() {
                          dropdownYear = newValue;
                        });
                      },
                      items: <int> [2021,2020,2019,2018].map<DropdownMenuItem<int>>
                        ((int value){
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
                    child: DropdownButton(
                      value: dropdownMonth,
                      icon: const Icon(Icons.arrow_forward_ios_outlined),
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
                        ((String value){
                          return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                          );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            // 3. Container: To display Income / Expenses
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(20.0),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index ) {
                  return ReportCard(name: "Quotation");
                },
              ),
            ),


          ]),

      bottomNavigationBar: NavigationBar(index: 1,),
    );
  }
}


// Widget : Report Card
class ReportCard extends StatelessWidget {

  final String name;
  ReportCard({this.name});

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
          // 1. Category Name
         Text(
             "$name".toUpperCase(),
           style: TextStyle(
             fontSize: 16.0,
             fontWeight: FontWeight.w600,
           ),
         ),

          SizedBox(height: 10.0),

          // 2. Quantity & Amount
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(width: 0.3, color: Colors.black,), ),
                  ),
                  child: Column(
                    children: [
                      Text("Quantity", style: TextStyle( fontSize: 13.0,),),
                      SizedBox(height: 5.0),
                      Text(
                        "10",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: AppColors().blue,
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
                    Text("Amount", style: TextStyle( fontSize: 13.0,),),
                    SizedBox(height: 5.0),
                    Text(
                      "10,000.00",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors().red,
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