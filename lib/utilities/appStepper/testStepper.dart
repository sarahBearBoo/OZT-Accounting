import 'package:accounting/models/utilities/appStepper.dart';
import 'package:accounting/utilities/appStepper/appStepper.dart';
import 'package:flutter/material.dart';

import '../appBar/appBar.dart';
import '../colors.dart';


class StepperCoba extends StatefulWidget {
  @override
  _StepperCobaState createState() => _StepperCobaState();
}

class _StepperCobaState extends State<StepperCoba> {

  // Default values for Stepper
  int current;

  // Elements for Stepper
  List <AppStepperModel> appStepper = [
    AppStepperModel(index: 1, title: "Customer"),
    AppStepperModel(index: 2, title: "Item" ),
    AppStepperModel(index: 3, title: "Additional Info" ),
    AppStepperModel(index: 4, title: "Completed"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    current = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().lightGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: TopAppBar(title: "MY PROFILE"),
      ),

      body: Column(
        children: [
          SizedBox(height: 20.0),
          AppStepper(appStepper: appStepper, curStep: current),
          Container(
            color: Colors.red,
            height: 400.0,
            width: 400.0,
          ),

          TextButton(onPressed: (){
            setState(() {
              debugPrint("$current");
              current++;
              debugPrint("$current");
            });
          }, child: Text("Next")),
        ],
      ),
    );
  }
}
