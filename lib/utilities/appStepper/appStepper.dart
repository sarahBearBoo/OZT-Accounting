import 'package:accounting/models/utilities/appStepper.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class AppStepper extends StatelessWidget {

  List <AppStepperModel> appStepper = [];
  int curStep;

  AppStepper({this.appStepper, this.curStep});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        //color: Colors.red,
        width: 350.0,
        child: Row(
          children: [
            // Alignment gets a bit off when there are only two steps
            // So some adjustments like the below needs to be done to center it
            if(appStepper.length == 2) Expanded(flex: 1, child: Container()),
            for(int i = 0; i < appStepper.length; i++)
              Expanded(flex: 1,
                child: StepElement(
                  firstCircle: i == 0 ? true : false,
                  lastCircle: i == appStepper.length - 1 ? true : false,
                  curStep: curStep,
                  curCircle: appStepper[i].getIndex(),
                  title: appStepper[i].title,
                ),
              ),

            // Alignment gets a bit off when there are only two steps
            // So some adjustments like the below needs to be done to center it
            if(appStepper.length == 2) Expanded(flex: 1, child: Container()),
          ],
        ),
      ),
    );
  }
}


// StepElement
class StepElement extends StatelessWidget {

  // Note: Here StepElement is alternatively addressed as circle

  final bool firstCircle; // true if current circle to be constructed is the first circle
  final bool lastCircle; // true if current circle to be constructed is the last circle

  final int curStep; // current step user is at
  final int curCircle; // index of the current circle to be constructed
  final String title; // title for each step

  StepElement({
    this.firstCircle,
    this.lastCircle,
    this.curStep,
    this.curCircle,
    this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        // Container: Wraps all
        Container(
          height: 80.0,
          //color: Colors.red,
        ),

        // Line
        //if(lastCircle == false)
        Positioned(
          width: 200.0, // just to give it a width. Because without it, the positioning doesn't work
          top: 12.5,
          child: Row(
            children: [
              Container(
                width: 60.0, // width of distance from left to circle + circle width
                height: 5.0,
                color: ((){
                  if(firstCircle == true)
                    // if the first circle is constructed, the leading line will be transparent (hidden)
                    return Colors.transparent;
                  else
                    // if the current circle to be constructed is not the first,
                    // all the leading line that leads to the current step will be in darker blue
                    return curCircle <= curStep ? AppColors().blue : AppColors().lightBlue;
                }()),

              ),
              Container(
                width: 140.0, // width of the after line
                height: 5.0,
                color: ((){
                  if(lastCircle == true)
                    // if the last circle is constructed, the after line will be transparent (hidden)
                    return Colors.transparent;
                  else
                    // if the current circle to be constructed is not the last,
                    // all the after line that leads to the latest step (step before the current step)
                    // will be in darker blue
                    return curCircle < curStep ? AppColors().blue : AppColors().lightBlue;
                }()),
              ),
            ],
          ),
        ),


        // The actual circle with step number
        Positioned(
          left: 30.0,
          child: Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              // All circles leading up to the current step performed by user will be in darker blue
              // Else, it will be in light blue
              color: curCircle <= curStep ? AppColors().blue : AppColors().lightBlue,
              borderRadius: BorderRadius.circular(30.0),
            ),

            child: Center(
              child: Text(
                "$curCircle",
                style: TextStyle(
                  // All index of circles leading up to the current step performed by user will be in lighter blue
                  // Else, it will be in darker blue
                  color: curCircle <= curStep ? Colors.white : AppColors().blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),

        // Title
        Positioned(
          bottom: 0,
          child: Container(
            width: 80.0,
            height: 45.0,
            //color: Colors.green,
            child: Text(
              title,
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                fontSize: 11.0,
              ),
            ),
          ),
        ),

      ],
    );
  }
}