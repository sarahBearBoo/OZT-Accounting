import 'package:accounting/models/utilities/appStepper.dart';
import 'file:///C:/Users/OZT-Office/Documents/Flutter%20Projects/accounting/lib/utilities/appBar/appBar.dart';
import 'package:accounting/utilities/appStepper/appStepper.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:accounting/utilities/sharedSteps/sharedSteps.dart';
import 'package:flutter/material.dart';

class CreateNewInvoice extends StatefulWidget {

  int current;
  bool add;
  CreateNewInvoice({this.current, this.add});

  @override
  _CreateNewInvoiceState createState() => _CreateNewInvoiceState(current: current, add: add);
}

class _CreateNewInvoiceState extends State<CreateNewInvoice> {

  int current; // The current step for App Stepper
  bool add; // true if user wants to add item

  _CreateNewInvoiceState({this.current, this.add}); // The current step for App Stepper


  // Elements for Stepper

  List <AppStepperModel> appStepper = [
    AppStepperModel(index: 1, title: "Customer"),
    AppStepperModel(index: 2, title: "Item" ),
    AppStepperModel(index: 3, title: "Additional Info" ),
    AppStepperModel(index: 4, title: "Complete" ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors().lightGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: TopAppBar(title: "invoice"),
      ),


      body: Column(
        children: [
          SizedBox(height: 20.0),

          // App Stepper
          Expanded( flex: 1, child: AppStepper(appStepper: appStepper, curStep: current),),


          // Content
          Expanded(
            flex: 5,
            child: Container(
              // The last step has a slightly different layout than the rest
              padding: current == 4 ? EdgeInsets.all(0.0) :  EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              child: ((){
                if(current == 1) return CustomerDetails(module: "invoice");
                else if(current == 2) return add == false ? ItemList(no: 5, module: "invoice") : AddItemForm(module: "invoice");
                else if(current == 3) return AdditionalInfo(module: "invoice",);
                else if(current == 4) return Receipt(module: "invoice",);
              }()),
            ),
          ),


        ],
      ),


      bottomNavigationBar: NavigationBar(index: 1,),  // passing the index for this page
    );
  }
}
