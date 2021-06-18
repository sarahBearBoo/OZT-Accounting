import 'package:accounting/models/expensesModel/ExpensesAttachmentModel.dart';

import 'ExpensesNewModel.dart';

class ExpensesModel {

  // Attributes
  ExpensesNewModel expensesNew;
  List<ExpensesAttachmentModel> attachments;

  // Constructor
  ExpensesModel(this.expensesNew);

  // Getters
  List<ExpensesAttachmentModel>  getAttachmentList() {
    attachments = [
      ExpensesAttachmentModel("Attachment 1", 100.00, "Description for Attachment 1"),
      ExpensesAttachmentModel("Attachment 2", 200.00, "Description for Attachment 2"),
      ExpensesAttachmentModel("Attachment 3", 300.00, "Description for Attachment 3"),
    ];

    return attachments;
  }


  // Setters
  //void setAttachmentList(List<Expenses>) {}


}