import 'package:accounting/models/utilities/appStepper.dart';
import 'package:accounting/utilities/appStepper/appStepper.dart';
import 'package:accounting/pages/modulesPage/expensesPage/createNewExpensesSteps.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:flutter/material.dart';

class CreateNewExpenses extends StatefulWidget {

  int current;
  bool add;
  CreateNewExpenses({this.current, this.add});

  @override
  _CreateNewExpensesState createState() => _CreateNewExpensesState(current: current, add: add);
}

class _CreateNewExpensesState extends State<CreateNewExpenses> {

  int current; // The current step for App Stepper
  bool add; // true if user wants to add item

  _CreateNewExpensesState({this.current, this.add});

  // Elements for Stepper
  List <AppStepperModel> appStepper = [
    AppStepperModel(index: 1, title: "New"),
    AppStepperModel(index: 2, title: "Attachment" ),
    AppStepperModel(index: 3, title: "Client" ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "EXPENSES",
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
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
                    if(current == 1) return NewExpenses();
                    else if(current == 2) return add == false ? AttachmentList(no: 5) : AddAttachment();
                    else if(current == 3) return AddClientDetails();
                  }()),
                ),
              ),
            ],
          ),
        ),
      bottomNavigationBar: NavigationBar(index: 1,),
    );
  }
}
