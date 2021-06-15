import 'file:///C:/Users/OZT-Office/Documents/Flutter%20Projects/accounting/lib/utilities/appBar/appBar.dart';
import 'package:accounting/pages/modulesPage/ledgerBookPage/ledgerBookCategory.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:flutter/material.dart';

class LedgerBook extends StatefulWidget {
  @override
  _LedgerBookState createState() => _LedgerBookState();
}

class _LedgerBookState extends State<LedgerBook> {

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
        child: TopAppBar(title: "LEDGER BOOK"),
      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
          child: Column(
              children:[
                GestureDetector(
                    onTap : (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LedgerBookCategory(category: "Equity"),));
                    },
                    child: LedgerBookButton(name: "Equity"),
                ),
                GestureDetector(
                    onTap : (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LedgerBookCategory(category: "Fixed Assets"),));
                    },
                    child: LedgerBookButton(name: "Fixed Assets"),
                ),
                GestureDetector(
                    onTap : (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LedgerBookCategory(category: "Current Assets"),));
                    },
                    child: LedgerBookButton(name: "Current Assets"),
                ),
                GestureDetector(
                    onTap : (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LedgerBookCategory(category: "Expenses"),));
                    },
                    child: LedgerBookButton(name: "Expenses"),
                ),
                GestureDetector(
                    onTap : (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LedgerBookCategory(category: "Capital"),));
                    },
                    child: LedgerBookButton(name: "Capital"),
                ),
                GestureDetector(
                    onTap : (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LedgerBookCategory(category: "Liabilities"),));
                    },
                    child: LedgerBookButton(name: "Liabilities"),
                ),
              ]),
        ),
      ),

      bottomNavigationBar: NavigationBar(index: 1,),  // passing the index for this page
    );
  }
}

class LedgerBookButton extends StatelessWidget {

  final String name;
  LedgerBookButton({this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: AppColors().lightBlue,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: 0.2, color:  Colors.grey),
      ),
      child: Text(
        "$name".toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

