
import 'package:accounting/pages/modulesPage/expensesPage/createNewExpenses.dart';
import 'package:accounting/pages/modulesPage/expensesPage/expenses.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';


// 1. Step (Widget) : Add New Expenses
class NewExpenses extends StatefulWidget {
  @override
  _NewExpensesState createState() => _NewExpensesState();
}

class _NewExpensesState extends State<NewExpenses> {

  String paymentType;
  String ledger;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                          // Payment Type
                          Container(
                            padding: EdgeInsets.only(bottom: 2.0),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(width: 0.3, color: Colors.black)),
                            ),
                            child: DropdownButton(
                              value: paymentType,
                              hint: Text("Payment Type", style: TextStyle(color: Colors.black)),
                              icon: Icon(Icons.arrow_forward_ios_outlined),
                              iconSize: 20.0,
                              isExpanded: true,
                              underline: Container(color: Colors.transparent), // disable this underline, used the border bott
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
                            padding: EdgeInsets.only(bottom: 2.0),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(width: 0.3, color: Colors.black)),
                            ),
                            child: DropdownButton(
                              value: ledger,
                              hint: Text("Ledger", style: TextStyle(color: Colors.black)),
                              icon: Icon(Icons.arrow_forward_ios_outlined),
                              iconSize: 20.0,
                              isExpanded: true,
                              underline: Container(color: Colors.transparent), // disable this underline, used the border bott
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
                          ), // 3. Text Field : Input for Date
                          SizedBox(height: 5.0),
                          TextField(
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
                          ), // 4. Text Field : Input for Particular
                          SizedBox(height: 5.0),
                          TextField(
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
                          ), // 5. Text Field : Input for Total
                          SizedBox(height: 5.0),
                          TextField(
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
                          ), // 6. Text Field : Input for Notes
                          SizedBox(height: 5.0),
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewExpenses(current: 2, add: false)));
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

// 2. Step (Widget) : Attachment - List of attachments
class AttachmentList extends StatelessWidget {

  final int no;
  AttachmentList({this.no});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // Content (List / No attachment message)
        Expanded(
          child:
            no == 0?
            Center(
              child: Text('No attachment added yet.'),
            ) :
            ListView(
              children: List.generate(no, (index) => Container(
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

                    // 1. Attachment No
                    Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Text(
                            "ATTACHMENT 1",
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

                    // 2. Amount
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Amount: RM100.00",
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 5.0),

                    // 3. Description
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Description: Item's description here",
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
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewExpenses(current: 2, add: true,)));
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
        if(no != 0) SizedBox(
          width: double.infinity,
          height: 50.0,
          child: TextButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewExpenses(current: 3,)));
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

// 3. Step (Widget) : Attachment - Add New Attachment
class AddAttachment extends StatelessWidget {
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

                  // 1. Input : for Title
                  TextField(
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

                  // 2. Input : for Amount
                  TextField(
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

                  // 3. Label : for Description
                  Text( "Description", style: TextStyle( color: Colors.black, fontSize: 16.0,),),
                  SizedBox(height: 5.0),

                  // 4. Input : for Description
                  TextField(
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

        // 5. Button: To add attachment
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
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewExpenses(current: 2, add: false)));
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


// 4. Step (Widget) : Add Client Details
class AddClientDetails extends StatefulWidget {
  @override
  _AddClientDetailsState createState() => _AddClientDetailsState();
}

class _AddClientDetailsState extends State<AddClientDetails> {

  // For dropdown
  String city;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration( color: Colors.white, borderRadius: BorderRadius.circular(10.0),),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // 1. Name
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Name',
                            hintStyle: TextStyle( color: Colors.black,),
                            enabledBorder: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.black, width: 0.3,),),
                          ),
                        ),
                        SizedBox(height: 5.0),

                        // 2. Address
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Address',
                            hintStyle: TextStyle( color: Colors.black,),
                            enabledBorder: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.black, width: 0.3,),),
                          ),
                        ),
                        SizedBox(height: 5.0),

                        // 3. Postcode & City
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Postcode",
                                  hintStyle: TextStyle( color: Colors.black,),
                                  enabledBorder: UnderlineInputBorder( borderSide: const BorderSide( color: Colors.black, width: 0.3)),
                                ),
                              ),
                            ),
                            SizedBox(width: 20.0,),
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(width: 0.3, color: Colors.black)),
                                ),
                                child: DropdownButton(
                                  value: city,
                                  hint: Text("Select city", style: TextStyle(color: Colors.black)),
                                  icon: Icon(Icons.arrow_forward_ios_outlined),
                                  iconSize: 20.0,
                                  isExpanded: true,
                                  underline: SizedBox(), // disable this underline, used the border bottom of the container instead
                                  onChanged: (String newValue){
                                    setState(() {
                                      city = newValue;
                                    });
                                  },
                                  items: ["City 1", "City 2", "City 3"].map<DropdownMenuItem<String>>
                                    ((String value){
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),

                        // 4. Phone No
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Phone No. (1)",
                                  hintStyle: TextStyle( color: Colors.black,),
                                  enabledBorder: UnderlineInputBorder( borderSide: const BorderSide( color: Colors.black, width: 0.3)),
                                ),
                              ),
                            ),
                            SizedBox(width: 20.0,),
                            Expanded(
                              flex: 1,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Phone No. (2)",
                                  hintStyle: TextStyle( color: Colors.black,),
                                  enabledBorder: UnderlineInputBorder( borderSide: const BorderSide( color: Colors.black, width: 0.3)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),

                        // 5. E-mail
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle( color: Colors.black,),
                            enabledBorder: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.black, width: 0.3,),),
                          ),
                        ),
                        SizedBox(height: 5.0),

                        // 6. Bank
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Bank',
                            hintStyle: TextStyle( color: Colors.black,),
                            enabledBorder: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.black, width: 0.3,),),
                          ),
                        ),
                        SizedBox(height: 5.0),

                        // 7. Account No
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Account No',
                            hintStyle: TextStyle( color: Colors.black,),
                            enabledBorder: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.black, width: 0.3,),),
                          ),
                        ),
                        SizedBox(height: 30.0,),
                      ],
                    ),
                  ),
                  SizedBox(height: 100.0),
                ],
              ),
            ),
          ),

          // Button: Submit all details
          SizedBox(
            width: double.infinity,
            height: 50.0,
            child: TextButton(
              onPressed: (){

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
                'SUBMIT',
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



