import 'package:accounting/models/IncomeNewModel.dart';
import 'package:accounting/models/utilities/appStepper.dart';
import 'package:accounting/utilities/appBar/appBar.dart';
import 'package:accounting/utilities/appStepper/appStepper.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:flutter/material.dart';

import 'incomeClient.dart';

class IncomeNew extends StatefulWidget {
  @override
  _IncomeNewState createState() => _IncomeNewState();
}

class _IncomeNewState extends State<IncomeNew> {

  // Elements for Stepper
  List <AppStepperModel> appStepper = [
    AppStepperModel(index: 1, title: "New"),
    AppStepperModel(index: 2, title: "Client" ),
  ];

  // Current step
  // "New" is the first step in creating income
  int current = 1;

  String paymentType;
  String ledger;

  // Setting up controllers to retrieve value of Text Fields
  final ctrParticular = TextEditingController();
  final ctrTotal = TextEditingController();
  final ctrNotes = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    ctrParticular.dispose();
    ctrTotal.dispose();
    ctrNotes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors().lightGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: TopAppBar(title: "income"),
      ),


      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,10.0),
        child: Column(
          children: [
            SizedBox(height: 10.0),

            // App Stepper
            Expanded( flex: 1, child: AppStepper(appStepper: appStepper, curStep: current)),

            // Content
            Expanded(
              flex: 5,
              child: Column(
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
                              children: [

                                //Payment Type
                                Container(
                                  padding: EdgeInsets.only(bottom: 0.2),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(width: 0.3, color: Colors.black)),
                                  ),
                                  child: DropdownButton(
                                    value: paymentType,
                                    hint: Text("Payment Type", style: TextStyle(color: Colors.black)),
                                    icon: Icon(Icons.arrow_forward_ios_outlined),
                                    iconSize: 20.0,
                                    isExpanded: true,
                                    underline: SizedBox(), // disable this underline, used the border bottom of the container instead
                                    onChanged: (String newValue){
                                      setState(() {
                                        paymentType = newValue;
                                      });
                                    },
                                    items: ["Type 1", "Type 2", "Type 3"].map<DropdownMenuItem<String>>
                                      ((String value){
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                SizedBox(height: 5.0),

                                // Ledger
                                Container(
                                  padding: EdgeInsets.only(bottom: 0.2),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(width: 0.3, color: Colors.black)),
                                  ),
                                  child: DropdownButton(
                                    value: ledger,
                                    hint: Text("Ledger", style: TextStyle(color: Colors.black)),
                                    icon: Icon(Icons.arrow_forward_ios_outlined),
                                    iconSize: 20.0,
                                    isExpanded: true,
                                    underline: SizedBox(), // disable this underline, used the border bottom of the container instead
                                    onChanged: (String newValue){
                                      setState(() {
                                        ledger = newValue;
                                      });
                                    },
                                    items: ["Ledger 1", "Ledger 2", "Ledger 3"].map<DropdownMenuItem<String>>
                                      ((String value){
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                SizedBox(height: 5.0),

                                // Date
                                TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 0.3,
                                        color: Colors.black,
                                      ),
                                    ),
                                    hintText: 'Date',
                                    hintStyle: TextStyle( color: Colors.black,),
                                  ),
                                ),
                                SizedBox(height: 5.0),

                                // Particular
                                TextField(
                                  controller: ctrParticular,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 0.3,
                                        color: Colors.black,
                                      ),
                                    ),
                                    hintText: 'Particular',
                                    hintStyle: TextStyle( color: Colors.black,),
                                  ),
                                ),
                                SizedBox(height: 5.0),

                                // Total
                                TextField(
                                  controller: ctrTotal,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 0.3,
                                        color: Colors.black,
                                      ),
                                    ),
                                    hintText: 'Total',
                                    hintStyle: TextStyle( color: Colors.black,),
                                  ),
                                ),
                                SizedBox(height: 5.0),

                                // Notes
                                TextField(
                                  controller: ctrNotes,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 0.3,
                                        color: Colors.black,
                                      ),
                                    ),
                                    hintText: 'Notes',
                                    hintStyle: TextStyle( color: Colors.black,),
                                  ),
                                ),
                                SizedBox(height: 5.0),

                                // Payment Receipt
                                TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 0.3,
                                        color: Colors.black,
                                      ),
                                    ),
                                    hintText: 'Payment Receipt',
                                    hintStyle: TextStyle( color: Colors.black,),
                                  ),
                                ), // 7. Text Field : Input for Payment Receipt
                                SizedBox(height: 30.0),

                              ],
                            ),
                          ),
                          SizedBox(height: 100.0),
                        ],
                      ),
                    ),
                  ),

                  // Button: Navigate to next step
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: TextButton(
                      onPressed: (){
                        IncomeNewModel income = new IncomeNewModel(ctrParticular.text, ctrTotal.text, ctrNotes.text);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => IncomeClient(income: income)));
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
            ),

          ],
        ),
      ),


      bottomNavigationBar: NavigationBar(index: 1,), // passing the index for this page
    );
  }
}
