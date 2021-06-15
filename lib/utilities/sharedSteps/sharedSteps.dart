import 'package:accounting/pages/modulesPage/invoicePage/createNewInvoice.dart';
import 'package:accounting/pages/modulesPage/quotationPage/createNewQuotation.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

// CustomerDetails
class CustomerDetails extends StatefulWidget {

  final String module;
  CustomerDetails({this.module});

  @override
  _CustomerDetailsState createState() => _CustomerDetailsState(module: module);
}

class _CustomerDetailsState extends State<CustomerDetails> {

  final String module;
  String dropdownCity;

  _CustomerDetailsState({this.module});

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              // Form
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration( color: Colors.white, borderRadius: BorderRadius.circular(10.0),),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            // Section: Customer Details
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Name',
                                hintStyle: TextStyle( color: Colors.black,),
                                enabledBorder: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.black, width: 0.3,),),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Address',
                                hintStyle: TextStyle( color: Colors.black,),
                                enabledBorder: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.black, width: 0.3,),),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Postcode",
                                      hintStyle: TextStyle( color: Colors.black,),
                                      enabledBorder: UnderlineInputBorder( borderSide: const BorderSide( color: Colors.black, width: 0.3)),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.0,),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.3, color: Colors.black))),
                                    child: DropdownButton(
                                      value: dropdownCity,
                                      hint: Text("Select city", style: TextStyle(color: Colors.black,)),
                                      icon: Icon(Icons.arrow_forward_ios_outlined),
                                      iconSize: 20.0,
                                      isExpanded: true,
                                      underline: Container(color: Colors.transparent), // disable this underline because its position does not align with the position of the underline of the Postcode textfield
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownCity = newValue;
                                        });
                                      },
                                      items: ["City 1", "City 2", "City 3"].map<DropdownMenuItem<String>>
                                        ((String value){
                                          return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value));
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Phone No. (1)",
                                      hintStyle: TextStyle( color: Colors.black,),
                                      enabledBorder: UnderlineInputBorder( borderSide: const BorderSide( color: Colors.black, width: 0.3)),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.0,),
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Phone No. (2)",
                                      hintStyle: TextStyle( color: Colors.black,),
                                      enabledBorder: UnderlineInputBorder( borderSide: const BorderSide( color: Colors.black, width: 0.3)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: TextStyle( color: Colors.black,),
                                enabledBorder: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.black, width: 0.3,),),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Date',
                                hintStyle: TextStyle( color: Colors.black,),
                                enabledBorder: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.black, width: 0.3,),),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Quotation For',
                                hintStyle: TextStyle( color: Colors.black,),
                                enabledBorder: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.black, width: 0.3,),),
                              ),
                            ),
                            SizedBox(height: 30.0,),

                            // Section : Attention
                            Text(
                              "Attention",
                              style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.w600,),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Name',
                                hintStyle: TextStyle( color: Colors.black,),
                                enabledBorder: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.black, width: 0.3,),),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Address',
                                hintStyle: TextStyle( color: Colors.black,),
                                enabledBorder: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.black, width: 0.3,),),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Phone No. (1)",
                                      hintStyle: TextStyle( color: Colors.black,),
                                      enabledBorder: UnderlineInputBorder( borderSide: const BorderSide( color: Colors.black, width: 0.3)),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.0,),
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Phone No. (2)",
                                      hintStyle: TextStyle( color: Colors.black,),
                                      enabledBorder: UnderlineInputBorder( borderSide: const BorderSide( color: Colors.black, width: 0.3)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30.0),
                          ],
                        ),
                      ),
                      SizedBox(height: 150.0), // To help fix the layout when keyboard appears
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),

              // Button: Navigate to next step
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: TextButton(
                  onPressed: (){
                    widget.module.toLowerCase() == "quotation" ?
                    Navigator.of(context).push(MaterialPageRoute(builder:(context) => CreateNewQuotation(current: 2, add: false))) :
                    Navigator.of(context).push(MaterialPageRoute(builder:(context) => CreateNewInvoice(current: 2, add: false))) ;
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
                    'NEXT',
                    style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 1.2,
                      color: AppColors().blue,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}

// ItemList
class ItemList extends StatelessWidget {
  final int no;
  final String module;
  ItemList({this.no, this.module});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // Content (List / No item message)
        Expanded(
          child:
          no == 0?
          Center(
            child: Text('No item added yet.'),
          ) :
          ListView(
            children: List.generate(no, (index) => ItemCard()),
          ),

        ),

        // Button: Add Item
        SizedBox(
          width: double.infinity,
          height: 50.0,
          child: TextButton(
            onPressed: (){
              module.toLowerCase() == "quotation" ?
              Navigator.of(context).push(MaterialPageRoute(builder:(context) => CreateNewQuotation(current: 2, add: true))) :
              Navigator.of(context).push(MaterialPageRoute(builder:(context) => CreateNewInvoice(current: 2, add: true))) ;
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(AppColors().blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            child: Text(
              'ADD ITEM',
              style: TextStyle(
                fontSize: 18.0,
                letterSpacing: 1.2,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        SizedBox(height: 5.0),

        // Button: Navigate to next step
        if(no != 0) SizedBox(
          width: double.infinity,
          height: 50.0,
          child: TextButton(
            onPressed: (){
              module.toLowerCase() == "quotation" ?
              Navigator.of(context).push(MaterialPageRoute(builder:(context) => CreateNewQuotation(current: 3, add: false))) :
              Navigator.of(context).push(MaterialPageRoute(builder:(context) => CreateNewInvoice(current: 3, add: false))) ;
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
              'NEXT',
              style: TextStyle(
                fontSize: 18.0,
                letterSpacing: 1.2,
                color: AppColors().blue,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ItemCard
class ItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      margin: EdgeInsets.only(bottom: 15.0,),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all( color: Colors.grey, width: 0.3,),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1 : Item no
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Text(
                    "ITEM 1",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded( flex: 1, child: Icon(Icons.more_horiz)),
              ],
            ),
          ),
          SizedBox(height: 3.0,),
          // 2 : Quantity
          Expanded(flex: 1, child: Text("Quantity: 2",)),
          SizedBox(height: 3.0,),
          // 3 : Price
          Expanded(flex: 1, child: Text("Price: RM100.00",)),
          SizedBox(height: 3.0,),

          // 4 : Description
          Expanded(flex: 3, child: Text("Description: Item's description here",)),
        ],
      ),
    );
  }
}

// AddItemForm
class AddItemForm extends StatelessWidget {

  final String module;
  AddItemForm({this.module});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Form
        Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration( color: Colors.white, borderRadius: BorderRadius.circular(10.0),),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  hintText: "Name",
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
              ),

              // Quantity
              TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  hintText: "Quantity",
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
              ),

              // Price
              TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  hintText: "Price",
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20.0),

              // Description
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                keyboardType: TextInputType.multiline,
                minLines: 5,
                maxLines: null,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
        SizedBox(height: 50.0),

        // Button: Navigate back to ItemList
        SizedBox(
          width: double.infinity,
          height: 50.0,
          child: TextButton(
            onPressed: (){
              module.toLowerCase() == "quotation" ?
              Navigator.of(context).push(MaterialPageRoute(builder:(context) => CreateNewQuotation(current: 2, add: false))) :
              Navigator.of(context).push(MaterialPageRoute(builder:(context) => CreateNewInvoice(current: 2, add: false))) ;
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
              'NEXT',
              style: TextStyle(
                fontSize: 18.0,
                letterSpacing: 1.2,
                color: AppColors().blue,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),

      ],
    );
  }
}

// Additional Info
class AdditionalInfo extends StatelessWidget {

  final String module;
  AdditionalInfo({this.module});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
              children: [
                // Form
                Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration( color: Colors.white, borderRadius: BorderRadius.circular(10.0),),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 1 : Quotation validity
                       TextField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                              hintText: "Quotation validity (days)",
                              hintStyle: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),

                        SizedBox(height: 15.0),

                        // 2 : Terms & Condition
                        SizedBox(
                          height: 20.0,
                          child: Text(
                            "Terms & Condition",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        TextField(
                            keyboardType: TextInputType.multiline,
                            minLines: 3,
                            maxLines: null,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),



                        // 3 : Delivery (days)
                        TextField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                              hintText: "Delivery (days)",
                              hintStyle: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),


                        // 4 : Delivery price
                        TextField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                              hintText: "Delivery Price (RM)",
                              hintStyle: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),

                        // 5 : Discount price
                       TextField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                              hintText: "Discount Price (RM)",
                              hintStyle: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        SizedBox(height: 15.0),

                        // 6 : Remark
                        SizedBox(
                          height: 20.0,
                          child: Text(
                            "Remark",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TextField(
                            keyboardType: TextInputType.multiline,
                            minLines: 3,
                            maxLines: null,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                        SizedBox(height: 30.0,)
                      ],
                    ),
                  ),
                SizedBox(height: 100.0),

                // Button: Navigate to next step
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: TextButton(
                    onPressed: (){
                      module.toLowerCase() == "quotation" ?
                      Navigator.of(context).push(MaterialPageRoute(builder:(context) => CreateNewQuotation(current: 4, add: false))) :
                      Navigator.of(context).push(MaterialPageRoute(builder:(context) => CreateNewInvoice(current: 4, add: false))) ;
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
                      'NEXT',
                      style: TextStyle(
                        fontSize: 18.0,
                        letterSpacing: 1.2,
                        color: AppColors().blue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

// Receipt
class Receipt extends StatelessWidget {

  final String module;
  Receipt({this.module});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // Content
        Expanded(
          child: SingleChildScrollView(
            child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(20.0,0.0,20.0,10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 1: Upper Section
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  "Quotation Reference No. : ",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  " Q202104-0001",
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.0,),
                          Row(
                            children: [
                              Text(
                                "Date : ",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "12 Apr 2021",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.0),
                          Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5.0,),
                            height: 100.0,
                            width: 270.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(  child: Text("Address Line 1", softWrap: true,)),
                                SizedBox(height: 3.0),
                                Container(  child: Text('Postcode, City, State')),
                                SizedBox(height: 3.0),
                                Container(  child: Text('0168749654 / 0168749654')),
                                SizedBox(height: 3.0),
                                Container(  child: Text('Email')),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),

                          // 2 : Items Section
                          Text(
                            "Quotation for: Name ",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5.0,),
                          Container(
                            width: 400.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 0.1),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              children: [
                                // 2.1 : All items info
                                Container(
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(width: 0.1,),),
                                  ),
                                  child: Row(
                                    children: [

                                      // 1 : Quantity
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(10.0,20.0,0.0,20.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.0),
                                            border: Border.all(width: 0.3),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "2x",
                                              style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          height: double.maxFinite,
                                          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "ITEM 1",
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 5.0),
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "Item description",
                                                  style: TextStyle(
                                                    fontSize: 13.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          height: double.maxFinite,
                                          padding: EdgeInsets.all(2.0),
                                          child: Center(child: Text(
                                            "RM250.00",
                                            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600,),
                                          ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                Container(
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(width: 0.1,),),
                                  ),
                                  child: Row(
                                    children: [

                                      // 1 : Quantity
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(10.0,20.0,0.0,20.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.0),
                                            border: Border.all(width: 0.3),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "2x",
                                              style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          height: double.maxFinite,
                                          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "ITEM 1",
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 5.0),
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "Item description",
                                                  style: TextStyle(
                                                    fontSize: 13.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          height: double.maxFinite,
                                          padding: EdgeInsets.all(2.0),
                                          child: Center(child: Text(
                                            "RM250.00",
                                            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600,),
                                          ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                Container(
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(width: 0.1,),),
                                  ),
                                  child: Row(
                                    children: [

                                      // 1 : Quantity
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(10.0,20.0,0.0,20.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.0),
                                            border: Border.all(width: 0.3),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "2x",
                                              style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          height: double.maxFinite,
                                          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "ITEM 1",
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 5.0),
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "Item description",
                                                  style: TextStyle(
                                                    fontSize: 13.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          height: double.maxFinite,
                                          padding: EdgeInsets.all(2.0),
                                          child: Center(child: Text(
                                            "RM250.00",
                                            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600,),
                                          ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),

                                // 2.2 : Delivery Price
                                Container(
                                  height: 55.0,
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(width: 0.1,),),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded( flex: 6, child: Text("Delivery Price", textAlign: TextAlign.right,)),
                                      Expanded( flex: 2,
                                        child: Center(
                                          child: Text(
                                            "RM15.00",
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // 2.3 : Discount Price
                                Container(
                                  height: 55.0,
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(width: 0.1,),),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded( flex: 6, child: Text("Discount Price", textAlign: TextAlign.right,)),
                                      Expanded( flex: 2,
                                        child: Center(
                                          child: Text(
                                            "RM15.00",
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],

                            ),
                          ),

                          // 3 : Bottom Section
                          SizedBox(height: 30.0),
                          Row(
                            children: [
                              Text(
                                "Quotation validity : ",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "30 days",
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            children: [
                              Text(
                                "Delivery : ",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "30 days",
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.0),
                          Container(
                            width: 300,
                            child: Text(
                              "Remarks will be shown here",
                              softWrap: true,
                            ),
                          ),
                          SizedBox(height: 30.0),
                        ],
                      ),
            ),
          ),
        ),
        
        // Total & Button
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(width: 0.3, color: Colors.grey)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(flex: 3, child: Text("Total")),
                  Expanded(flex: 1, child:
                  Text(
                    "RM362.00",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              SizedBox(
                height: 50.0,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(AppColors().lightBlue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 1.2,
                      color: AppColors().blue,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
