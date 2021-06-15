import 'package:accounting/utilities/colors.dart';
import 'package:flutter/material.dart';

/*
========================================================================================
 TABLE OF CONTENTS
 ------------------
 1. Summary - Defines layout for 'Summary' in Client Module
 2. Sale - Defines layout for 'Sale' in Client Module
 3. Acquisition - Defines layout for 'Acquisition' in Client Module
 =======================================================================================
 */

// Category (Widget): Summary
class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // 1. Client's Personal Info
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(10.0,10.0,10.0,0),
            child: Row(
                children: [

                  // 1.1 Icon
                  Expanded(
                    flex: 1,
                    child: Image.asset('assets/images/client icon.png'),),

                  // 1.2. Client's name & email
                  // Supposedly this one is dynamic not static
                  Expanded(
                    flex: 3,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 1.2.1. Name
                          Text(
                            "Alen Mullin",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          // 1.2.2. Email
                          Text(
                            "alenmullin@gmail.com",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 5.0),

                          // 1.2.3. Address
                          Text(
                            "Jalan Astana, Petra Jaya, Kuching, Sarawak",
                            softWrap: true,
                            style: TextStyle( fontSize: 13.0,),
                          ),
                        ]
                    ),
                  ),
                ]
            ),
          ),

          // 2. Summary
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // 2.1 Quotation
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Quotation", style: TextStyle( fontSize: 14.0, color: Colors.grey,),),
                      SizedBox(height: 10.0),
                      Text(
                        "RM 3,000.00 (2)",
                        style: TextStyle( fontSize: 15.0, fontWeight: FontWeight.w500,),
                      ),
                    ],
                  ),
                  Divider(thickness: 1.0, height: 25.0,),

                  // 2.2 Invoice
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Invoice", style: TextStyle( fontSize: 14.0, color: Colors.grey,),),
                      SizedBox(height: 10.0),
                      Text(
                        "RM 3,000.00 (1)",
                        style: TextStyle( fontSize: 15.0, fontWeight: FontWeight.w500,),
                      ),
                    ],
                  ),
                  Divider(thickness: 1.0, height: 25.0,),

                  // 2.3 Expenses
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Expenses", style: TextStyle( fontSize: 14.0, color: Colors.grey,),),
                      SizedBox(height: 10.0),
                      Text(
                        "RM 0.00 (0)",
                        style: TextStyle( fontSize: 15.0, fontWeight: FontWeight.w500,),
                      ),
                    ],
                  ),
                  Divider(thickness: 1.0, height: 25.0,),

                  // 2.4 Income
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Income", style: TextStyle( fontSize: 14.0, color: Colors.grey,),),
                      SizedBox(height: 10.0),
                      Text(
                        "RM 0.00 (0)",
                        style: TextStyle( fontSize: 15.0, fontWeight: FontWeight.w500,),
                      ),
                    ],
                  ),
                ]
            ),
          ),

        ],
      ),
    );
  }
}


// Category (Widget): Sale
class Sale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // 1. Date
          Text(
            "Date",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 5.0),


          // 2. Name & Price
          Row (
            children: [

              // 2.1 Name
              Expanded(
                flex: 4,
                child: Text(
                  "Payment Services",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // 2.2 Price
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

        ],
      ),
    );
  }
}


// Category (Widget): Acquisition
class Acquisition extends StatelessWidget {
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
