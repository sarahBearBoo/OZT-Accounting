import 'package:accounting/utilities/appBar/appBar.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:flutter/material.dart';

import 'createNewInvoice.dart';

class Invoice extends StatefulWidget {
  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().lightGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: TopAppBar(title: "INVOICE"),
      ),
      body: Column(
          children:[
            // 1 : Invoice Card List
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(20.0),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return InvoiceCard(status: "Unpaid",);
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewInvoice(current: 1, add: false,)));
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



      bottomNavigationBar: NavigationBar(index: 1,), // passing the index for this page
    );
  }
}


// Widget: Invoice Card
class InvoiceCard extends StatelessWidget {

  final String status;
  
  InvoiceCard({this.status});

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

          // 1 : Date
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

          // 2 : Reference No
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
                "Invoice for",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.0),

          // 3 : Client name
          SizedBox(
            width: double.infinity,
            child: Text(
              "Client name",
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 5.0),

          // 4 : Status & Total
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                  color : (() {
                    if(status == "Paid") return AppColors().green1;
                    else if(status == "Unpaid") return AppColors().red;
                    else if(status == "Pending") return AppColors().gold;
                    }()),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(child: Text(status, style: TextStyle(color: status != "Pending" ? Colors.white : Colors.black,),),),
                ),
              ),

              Expanded(
                flex: 4,
                child: Text(
                    "Total Price",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
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