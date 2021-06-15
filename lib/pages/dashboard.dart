import 'package:accounting/models/data/moduleTilesData.dart';
import 'package:accounting/pages/featureUnavailablePage/featureUnavailable.dart';
import 'file:///C:/Users/OZT-Office/Documents/Flutter%20Projects/accounting/lib/utilities/appBar/appBar.dart';
import 'package:accounting/utilities/charts/acquisitionChart.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'modulesPage/balanceSheetPage/balanceSheet.dart';
import 'modulesPage/cashBookPage/cashBook.dart';
import 'modulesPage/expensesPage/expenses.dart';
import 'modulesPage/incomePage/income.dart';
import 'modulesPage/invoicePage/invoice.dart';
import 'modulesPage/ledgerBookPage/ledgerBook.dart';
import 'modulesPage/profitAndLoss/profitAndLoss.dart';

import 'modulesPage/quotationPage/quotation.dart';
import 'modulesPage/reportsPage/reports.dart';
import 'modulesPage/clientPage/client.dart';

/*
=================================================================================
 TABLE OF CONTENTS
 ------------------
 1. Dashboard - Layout for 'Dashboard'
 2. ModuleButtons - Layout for buttons to access modules
 ================================================================================
 */



class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  List<ModuleTilesData> module;

  // Later needs to be changed to dynamic data
  List<FlSpot> expenses = [
    FlSpot(0, 5),
    FlSpot(1, 8),
    FlSpot(2, 4),
    FlSpot(3, 3),
    FlSpot(4, 6),
    FlSpot(5, 2),
  ];
  List<FlSpot> income = [
    FlSpot(0, 3),
    FlSpot(1, 2),
    FlSpot(2, 5),
    FlSpot(3, 3.1),
    FlSpot(4, 4),
    FlSpot(5, 8),
  ];




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    module = getModuleTiles();
    //isShowingMainData = true;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().lightGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: TopAppBar(title: "DASHBOARD"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 1. The Greeting
              SizedBox(height: 20.0),
              Center(child: Text("Welcome back,", style: TextStyle( fontSize: 15.0, color: Colors.grey),)),
              Center(child: SizedBox(height: 5.0)),
              Center(
                child: Text(
                  "Bridget Skyler",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle( fontSize: 23.0, fontWeight: FontWeight.w500,),
                ),
              ),
              SizedBox(height: 40.0),

              // 2. Buttons
              SizedBox(
                height: 140.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: module.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: ModuleButton(
                          imagePath: module[index].getImagePath(),
                          name: module[index].getName()),
                    );
                  },
                ),
              ),
              SizedBox(height: 30.0),

              // 3. Acquisition
              Text("Acquisition", style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.w600),),
              SizedBox(height: 10.0),
              SizedBox(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0,30.0,20.0),
                  width: double.infinity,
                  //height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(width: 0.1, color: Colors.grey),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.circle, color: Colors.redAccent, size: 14.0,),
                          SizedBox(width: 5.0),
                          Text("Expenses", style: TextStyle(fontSize: 12.0,)),
                          SizedBox(width: 20.0),
                          Icon(Icons.circle, color: gradientColors[1], size: 14.0,),
                          SizedBox(width: 5.0),
                          Text("Income", style: TextStyle(fontSize: 12.0)),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        height: 200,
                        child: LineChart(acquisitionChart(expenses, income)),
                      ),
                      SizedBox(height: 20.0),

                      // Total Profit & Total Expenses
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(20.0,10.0,20.0,10.0),
                              decoration: BoxDecoration(
                                color: AppColors().green3,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Column(
                                children: [
                                  Text("Profit", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600,)),
                                  SizedBox(height: 5.0),
                                  Text("RM 10,000.00", textAlign: TextAlign.center, style: TextStyle(color: Colors.teal, fontSize: 15.0, fontWeight: FontWeight.w600,)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(20.0,10.0,20.0,10.0),
                              decoration: BoxDecoration(
                                color: AppColors().lightRed,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Column(
                                children: [
                                  Text("Expenses", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600,)),
                                  SizedBox(height: 5.0),
                                  Text("RM 10,000.00", textAlign: TextAlign.center, style: TextStyle(color: Colors.redAccent, fontSize: 15.0, fontWeight: FontWeight.w600,)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(index: 0),
    );
  }

}

// Widget: Module Button
class ModuleButton extends StatelessWidget {

  final String imagePath, name;
  ModuleButton({this.imagePath, this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(name.toUpperCase() == "QUOTATION") { Navigator.of(context).push(MaterialPageRoute(builder: (context) => Quotation())); }
        else if(name.toUpperCase() == "INVOICE") { Navigator.of(context).push(MaterialPageRoute(builder: (context) => Invoice())); }
        else if(name.toUpperCase() == "EXPENSES") { Navigator.of(context).push(MaterialPageRoute(builder: (context) => Expenses())); }
        else if(name.toUpperCase() == "INCOME") { Navigator.of(context).push(MaterialPageRoute(builder: (context) => Income())); }
        else if(name.toUpperCase() == "CASH BOOK") { Navigator.of(context).push(MaterialPageRoute(builder: (context) => CashBook())); }
        else if(name.toUpperCase() == "LEDGER BOOK") { Navigator.of(context).push(MaterialPageRoute(builder: (context) => LedgerBook())); }
        else if(name.toUpperCase() == "QUICK ENTRY") { Navigator.of(context).push(MaterialPageRoute(builder: (context) => FeatureUnavailable(name: "QUICK ENTRY", navIndex: 1))); }
        else if(name.toUpperCase() == "REPORTS") { Navigator.of(context).push(MaterialPageRoute(builder: (context) => Reports())); }
        else if(name.toUpperCase() == "PROFIT AND LOSS") { Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfitAndLoss())); }
        else if(name.toUpperCase() == "BALANCE SHEET") { Navigator.of(context).push(MaterialPageRoute(builder: (context) => BalanceSheet(active: 0))); }
        else if(name.toUpperCase() == "CLIENT") { Navigator.of(context).push(MaterialPageRoute(builder: (context) => Client())); }
      },
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 100,
                height: 100,
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(width: 0.2, color: Colors.grey),
                  color: Colors.white,
                ),
                child: Image.asset(imagePath,),
              ),

              Positioned(
                bottom: 20.0,
                right: -5.0,
                child: Icon(Icons.add_circle, color: Colors.green,),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text(name, style: TextStyle(fontWeight: FontWeight.w500,)),
        ],
      ),
    );
  }
}




