import 'package:accounting/models/data/moduleTilesData.dart';
import 'package:accounting/pages/featureUnavailablePage/featureUnavailable.dart';
import 'package:accounting/pages/modulesPage/quotationPage/quotation.dart';
import 'file:///C:/Users/OZT-Office/Documents/Flutter%20Projects/accounting/lib/utilities/appBar/appBar.dart';
import 'package:accounting/pages/modulesPage/cashBookPage/cashBook.dart';
import 'package:accounting/pages/modulesPage/expensesPage/expenses.dart';
import 'package:accounting/pages/modulesPage/ledgerBookPage/ledgerBook.dart';

import 'package:accounting/pages/modulesPage/reportsPage/reports.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:flutter/material.dart';
import '../balanceSheetPage/balanceSheet.dart';
import '../incomePage/income.dart';
import '../invoicePage/invoice.dart';
import '../profitAndLoss/profitAndLoss.dart';
import '../clientPage/client.dart';

class Modules extends StatefulWidget {
  @override
  _ModulesState createState() => _ModulesState();
}

class _ModulesState extends State<Modules> {

  List<ModuleTilesData> tiles;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tiles = getModuleTiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().lightGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: TopAppBar(title: "MODULES"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 0.0,
          crossAxisCount: 2,
          children: List.generate(tiles.length, (index)
          {
            return Center(
              child: ModuleTile(
                imagePath: tiles[index].getImagePath(),
                name: tiles[index].getName(),
                desc: tiles[index].getDesc(),
              ),
            );
          }),
        ),
      ),
      bottomNavigationBar: NavigationBar(index: 1),  // passing the index for this page
    );
  }
}


class ModuleTile extends StatelessWidget {

  final String imagePath, name, desc;
  ModuleTile({@required this.imagePath, @required this.name, @required this.desc});

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
        else if(name.toUpperCase() == "QUICK ENTRY") { Navigator.of(context).push(MaterialPageRoute(builder: (context) => FeatureUnavailable(name: "Quick Entry", navIndex: 1))); }
        else if(name.toUpperCase() == "REPORTS") { Navigator.of(context).push(MaterialPageRoute(builder: (context) => Reports())); }
        else if(name.toUpperCase() == "PROFIT AND LOSS") { Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfitAndLoss())); }
        else if(name.toUpperCase() == "BALANCE SHEET") { Navigator.of(context).push(MaterialPageRoute(builder: (context) => BalanceSheet(active: 0))); }
        else if(name.toUpperCase() == "CLIENT") { Navigator.of(context).push(MaterialPageRoute(builder: (context) => Client())); }
      },

      child: Container(
        width: 150.0,
        height: 350.0,
        margin: EdgeInsets.only(top: 5.0, bottom: 5.0,),
        padding: EdgeInsets.all(10.0,),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: 0.2, color: Colors.grey,),
        ),
        child: Column(
          children: [
            SizedBox(
                height: 80.0,
                child: Image.asset(imagePath)),
            SizedBox(height: 5.0,),
            Text(
              name.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              desc,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
