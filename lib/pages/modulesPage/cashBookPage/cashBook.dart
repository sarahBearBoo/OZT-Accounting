import 'package:accounting/utilities/appBar/appBar.dart';
import 'package:accounting/pages/modulesPage/cashBookPage/cashBookList.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:flutter/material.dart';

class CashBook extends StatefulWidget {
  @override
  _CashBookState createState() => _CashBookState();
}

class _CashBookState extends State<CashBook> {
  
  // The current active page on cash book
  String active = "Income";

  // Initial values for dropdown (filter options)
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
        child: TopAppBar(title: "CASH BOOK"),
      ),


      body: Column(

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

            // 2. Filter options for Year and Month
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
                      icon: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.black),
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

            // 3. Container: To display Income / Expenses
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(20.0),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index ) {
                  return CashBookCard();
                },
              ),
            ),

            // 4. Total
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(width: 0.2, color: Colors.grey,),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      "TOTAL",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                        "RM4,500.00",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),

      bottomNavigationBar: NavigationBar(index: 1,),  // passing the index for this page
    );
  }
}
