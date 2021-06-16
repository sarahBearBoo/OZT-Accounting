import 'package:accounting/models/utilities/appStepper.dart';
import 'package:accounting/utilities/appBar/appBar.dart';
import 'package:accounting/utilities/appStepper/appStepper.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:accounting/utilities/sharedSteps/sharedSteps.dart';
import 'package:flutter/material.dart';

class CreateNewQuotation extends StatefulWidget {

  int current;
  bool add;
  CreateNewQuotation({this.current, this.add});

  @override
  _CreateNewQuotationState createState() => _CreateNewQuotationState(current: current, add: add);
}

class _CreateNewQuotationState extends State<CreateNewQuotation> {

  int current; // The current step for App Stepper
  bool add; // true if user wants to add item

  _CreateNewQuotationState({this.current, this.add}); // The current step for App Stepper


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
        child: TopAppBar(title: "Quotation"),
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
                    if(current == 1) return CustomerDetails(module: "quotation");
                    else if(current == 2) return add == false ? ItemList(no: 5, module: "quotation") : AddItemForm(module: "quotation");
                    else if(current == 3) return AdditionalInfo(module: "quotation");
                    else if(current == 4) return Receipt(module: "quotation");
                  }()),
                ),
              ),


          ],
        ),


      bottomNavigationBar: NavigationBar(index: 1,),  // passing the index for this page
    );
  }
}
