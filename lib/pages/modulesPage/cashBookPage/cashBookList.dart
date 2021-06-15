import 'package:accounting/utilities/colors.dart';
import 'package:flutter/material.dart';


// 1. Widget: Card for Income / Expenses
class CashBookCard extends StatelessWidget {

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
          SizedBox(height: 5.0),

          // 2. Income Name
          SizedBox(
            width: double.infinity,
            child: Text(
              "Payment Services",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 5.0),

          // 3. Income & Price
          Row (
            children: [
              Expanded(
                flex: 4,
                child: Text(
                  "Fixed Assets > Furniture & Fittings",
                  textAlign: TextAlign.left,
                  style: TextStyle( color: AppColors().blue, fontSize: 14.0, fontWeight: FontWeight.w600,),
                ),
              ),

              Expanded(
                flex: 2,
                child: Text(
                  "Total price",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.0),

        ],
      ),
    );

  }
}

