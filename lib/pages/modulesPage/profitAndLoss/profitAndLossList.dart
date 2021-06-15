import 'package:flutter/material.dart';

/*
=================================================================================
 TABLE OF CONTENTS
 ------------------
 1. ProfitAndLossList - Layout for each P&L's Income / Expense Category in List
 2. ProfitAndLossTile - Layout for each tile in the category
 ================================================================================
 */

class ProfitAndLossList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: double.infinity,
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(border: Border( bottom: BorderSide(width: 0.2, color: Colors.grey)),),
              child: Text("EQUITY", style: TextStyle( fontWeight: FontWeight.w600,))),
          ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true, children: List.generate(2, (index) => ProfitAndLossTile())),

        ],
      ),
    );
  }
}

class ProfitAndLossTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25.0, 15.0, 15.0, 15.0),
      decoration: BoxDecoration(
        border: Border( bottom: BorderSide(width: 0.2, color: Colors.grey)),
      ),
      child: Row(
        children: [
          Expanded( flex: 4, child: Text("Something")),
          Expanded( flex: 2, child: Text("RM 10,000.00", textAlign: TextAlign.right,style: TextStyle( fontWeight: FontWeight.w600,))),
        ],
      ),
    );
  }
}

