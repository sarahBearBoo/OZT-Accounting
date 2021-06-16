import 'package:accounting/models/utilities/appStepper.dart';
import 'package:accounting/utilities/appBar/appBar.dart';
import 'package:accounting/utilities/appStepper/appStepper.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:flutter/material.dart';
import 'createNewIncomeSteps.dart';

class CreateNewIncome extends StatefulWidget {

  int current;
  CreateNewIncome({this.current});

  @override
  _CreateNewIncomeState createState() => _CreateNewIncomeState(current: current);
}

class _CreateNewIncomeState extends State<CreateNewIncome> {

  int current;
  _CreateNewIncomeState({this.current}); // The current step for App Stepper


  // Elements for Stepper
  List <AppStepperModel> appStepper = [
    AppStepperModel(index: 1, title: "New"),
    AppStepperModel(index: 2, title: "Client" ),
  ];


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
              child: Container(
                child: ((){
                  if(current == 1) return NewIncome();
                  else if(current == 2) return AddClientDetails();
                }()),
              ),
            ),

          ],
        ),
      ),


      bottomNavigationBar: NavigationBar(index: 1,), // passing the index for this page
    );
  }
}
