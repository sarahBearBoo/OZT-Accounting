import 'package:accounting/pages/modulesPage/expensesPage/createNewExpenses.dart';
import 'file:///C:/Users/OZT-Office/Documents/Flutter%20Projects/accounting/lib/utilities/appBar/appBar.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().lightGrey,
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: TopAppBar(title: "EXPENSES"),
      ),

      body: Column(
          children:[
            // 1 : Expenses Card List
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(20.0),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return ExpensesCard();
                },
              ),
            ),
            // 2 : NEW button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                height: 50.0,
                child: TextButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewExpenses(current: 1)));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(AppColors().lightBlue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'NEW',
                    style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 1.2,
                      color: AppColors().blue,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ]),



      bottomNavigationBar: NavigationBar(index: 1,),  // passing the index for this page
    );
  }
}

// Widget: Expenses Card
class ExpensesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey,
          width: 0.2,
        ),
      ),
      child: Column(
        children: [


          Row(
            children: [
              Expanded(
                flex: 7,
                child: Text(
                  "Date",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ), // 1 : Date
          Row(
            children: [
              Text(
                "Reference No : ",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Expenses for",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ],
          ), // 2: Reference No & Payment Services
          SizedBox(height: 5.0),

          SizedBox(
            width: double.infinity,
            child: Text(
              "Fixed Assets > Furniture & Fittings",
              textAlign: TextAlign.left,
              style: TextStyle( color: Colors.red, fontSize: 14.0, fontWeight: FontWeight.w600,),
            ),
          ),
          SizedBox(height: 5.0),
          SizedBox(
            width: double.infinity,
            child: Text(
              "Client name",
              textAlign: TextAlign.left,
            ),
          ), // 4
          SizedBox(
            width: double.infinity,
            child: Text(
              "Total price",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ), // 5 : Total Expenses

        ],
      ),
    );
  }
}