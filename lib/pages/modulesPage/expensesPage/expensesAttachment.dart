import 'file:///C:/Users/OZT-Office/Documents/Flutter%20Projects/Flutter-Accounting/lib/models/expensesModel/ExpensesAttachmentModel.dart';
import 'file:///C:/Users/OZT-Office/Documents/Flutter%20Projects/Flutter-Accounting/lib/models/expensesModel/ExpensesNewModel.dart';
import 'package:accounting/models/utilities/appStepper.dart';
import 'package:accounting/utilities/appStepper/appStepper.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:flutter/material.dart';

import 'expensesClient.dart';

class ExpensesAttachment extends StatefulWidget {

  final bool add;
  final ExpensesNewModel expensesNew;
  ExpensesAttachment({this.add, this.expensesNew});

  @override
  _ExpensesAttachmentState createState() => _ExpensesAttachmentState(add: add, expensesNew: expensesNew);
}

class _ExpensesAttachmentState extends State<ExpensesAttachment> {

  int current = 2; // The current step for App Stepper
  bool add; // True if user wants to add, false if otherwise
  ExpensesNewModel expensesNew; // Retrieve the details from previous step

  _ExpensesAttachmentState({this.add, this.expensesNew});

  // List of expenses
  List <ExpensesAttachmentModel> expenses = [
    ExpensesAttachmentModel("Attachment 1", 100.00, "Description for Attachment 1"),
    ExpensesAttachmentModel("Attachment 2", 200.00, "Description for Attachment 2"),
    ExpensesAttachmentModel("Attachment 3", 300.00, "Description for Attachment 3"),
  ];

  // Elements for Stepper
  List <AppStepperModel> appStepper = [
    AppStepperModel(index: 1, title: "New"),
    AppStepperModel(index: 2, title: "Attachment" ),
    AppStepperModel(index: 3, title: "Client" ),
  ];

  // Setting up controllers for text fields
  final ctrParticular = TextEditingController();
  final ctrTotal = TextEditingController();
  final ctrNotes = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    ctrParticular.dispose();
    ctrTotal.dispose();
    ctrNotes.dispose();
    super.dispose();
  }

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
                child: add == false ? AttachmentList(expenses: expenses, expensesNew: expensesNew) : AddAttachment(expensesNew: expensesNew),
                ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(index: 1,),
    );
  }
}


// CHILD WIDGETS ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// AttachmentList
class AttachmentList extends StatelessWidget {

  final List<ExpensesAttachmentModel> expenses;
  final ExpensesNewModel expensesNew;
  AttachmentList({@required this.expenses, @required this.expensesNew});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // Content (No attachment message / List)
        Expanded(
          child:
          expenses.length == 0?
          Center(
            child: Text('No attachment added yet.'),
          ) :
          ListView(
            children: List.generate(expenses.length, (index) => Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(bottom: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 0.3,
                ),
              ),

              child: Column(
                children: [

                  // Title
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Text(
                          expenses[index].title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.more_horiz,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0),

                  // Amount
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Amount: RM${expenses[index].amount}",
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 5.0),

                  // Description
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Description: " + expenses[index].description,
                      textAlign: TextAlign.left,
                      softWrap: true,
                    ),
                  ),
                  SizedBox(height: 5.0),
                ],
              ),
            ),),
          ),

        ),

        // Button: Add Attachment
        SizedBox(
          width: double.infinity,
          height: 50.0,
          child: TextButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExpensesAttachment(add: true, expensesNew: expensesNew)));
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
        // Button is not available if no attachment is added
        if(expenses.length != 0) SizedBox(
          width: double.infinity,
          height: 50.0,
          child: TextButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExpensesClient()));
              // Navigator.pushAndRemoveUntil<void>(
              //   context,
              //   MaterialPageRoute<void>(builder: (BuildContext context) => CreateNewExpenses(current: 3,)),
              //   //ModalRoute.withName('/expenses'),
              //   (Route<dynamic> route) => route is Expenses
              // );
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

// AddAttachment
class AddAttachment extends StatelessWidget {

  final ExpensesNewModel expensesNew;


  AddAttachment({this.expensesNew});

  // Setting up controllers for text fields
  final ctrTitle = TextEditingController();
  final ctrAmount = TextEditingController();
  final ctrDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // Form
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration( color: Colors.white, borderRadius: BorderRadius.circular(10.0),),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Text Field: Title
                TextField(
                  controller: ctrTitle,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.3,
                        color: Colors.black,
                      ),
                    ),
                    hintText: 'Title',
                    hintStyle: TextStyle( color: Colors.black,),
                  ),
                ),
                SizedBox(height: 5.0),

                // Text Field: Amount
                TextField(
                  controller: ctrAmount,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.3,
                        color: Colors.black,
                      ),
                    ),
                    hintText: 'Amount',
                    hintStyle: TextStyle( color: Colors.black,),
                  ),
                ),
                SizedBox(height: 25.0),

                // Label : for Description
                Text( "Description", style: TextStyle( color: Colors.black, fontSize: 16.0,),),
                SizedBox(height: 5.0),

                // Text Field: Description
                TextField(
                  controller: ctrDescription,
                  keyboardType: TextInputType.multiline,
                  minLines: 5,
                  maxLines: null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.3,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.0),

        // Button: To add attachment
        Center(
          child: SizedBox(
            height: 50.0,
            width: 200.0,
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(AppColors().green2),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                ),
              ),
              child: Row(
                children: [
                  Expanded( flex: 1, child: Icon(Icons.attach_file, color: Colors.white, size: 15.0,)),
                  Expanded( flex: 3, child: Text("Add Attachment", style: TextStyle(color: Colors.white, fontSize: 14.0,),)),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 30.0),

        // Button: Navigate back to Attachment List
        SizedBox(
          width: double.infinity,
          height: 50.0,
          child: TextButton(
            onPressed: (){
              //ExpensesAttachmentModel attachment = new ExpensesAttachmentModel(ctrTitle.text, double.parse(ctrAmount.text), ctrDescription.text);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExpensesAttachment(add: false, expensesNew: expensesNew)));
              // for testing purposes
              // showDialog(context: context, builder: (context){
              //   return AlertDialog(
              //     content: Column(
              //       children: [
              //         Text(expensesNew.particular + " " + expensesNew.total + " " + expensesNew.notes),
              //         SizedBox(height: 10.0),
              //         Text("Expenses title: " + expenses.title + "Amount: ${expenses.amount}" + " Description: " + expenses.description),
              //       ],
              //     ),
              //   );
              // });
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