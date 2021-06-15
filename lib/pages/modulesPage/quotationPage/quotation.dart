import 'file:///C:/Users/OZT-Office/Documents/Flutter%20Projects/accounting/lib/utilities/appBar/appBar.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'createNewQuotation.dart';

class Quotation extends StatefulWidget {
  @override
  _QuotationState createState() => _QuotationState();
}

class _QuotationState extends State<Quotation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().lightGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: TopAppBar(title: "QUOTATION"),
      ),
      body: Column(
          children:[
            // 1 : Quotation Card List
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(20.0),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return QuotationCard(refNo: "Draft",);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                height: 50.0,
                child: TextButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewQuotation(current: 1, add: false,)));
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


// Widget : Quotation Card
class QuotationCard extends StatelessWidget {

  final String refNo;
  QuotationCard({this.refNo});

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
      height: 100.0,
      child: Column(
        children: [

          // 1
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
          ),

          // 2
          Row(
            children: [
              Text(
                refNo,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: refNo != "Draft" ? Colors.black : AppColors().red,
                ),
              ),
              Text(
                  " : " + "Quotation for",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          SizedBox(height: 10.0),

          // 3
         SizedBox(
           width: double.infinity,
           child: Text(
               "Client name",
             textAlign: TextAlign.left,
           ),
         ),

          // 4
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
          ),

        ],
      ),
    );
  }
}

