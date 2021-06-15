import 'package:flutter/cupertino.dart';

class AppStepperModel {

  int index; // index of this circle, index starts with 1
  String title; // step title

  AppStepperModel({
    this.index,
    this.title,
  });

  // GETTERS
  int getIndex() => index;
  String getTitle() => title;
}