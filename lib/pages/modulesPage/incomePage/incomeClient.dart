import 'package:accounting/models/ClientModel.dart';
import 'package:accounting/models/IncomeNewModel.dart';
import 'package:accounting/models/utilities/appStepper.dart';
import 'package:accounting/utilities/appBar/appBar.dart';
import 'package:accounting/utilities/appStepper/appStepper.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:flutter/material.dart';

class IncomeClient extends StatefulWidget {

  IncomeNewModel income;
  IncomeClient({this.income});

  @override
  _IncomeClientState createState() => _IncomeClientState(income);
}

class _IncomeClientState extends State<IncomeClient> {

  IncomeNewModel income;
  _IncomeClientState(this.income);


  // Current step
  // "Client" is the second step in creating income
  int current = 2;

  String city;

  // Elements for Stepper
  List <AppStepperModel> appStepper = [
    AppStepperModel(index: 1, title: "New"),
    AppStepperModel(index: 2, title: "Client"),
  ];


  // Setting up controllers to retrieve values from text fields
  final ctrName = TextEditingController();
  final ctrAddress = TextEditingController();
  final ctrPostcode = TextEditingController();
  final ctrPhone1 = TextEditingController();
  final ctrPhone2 = TextEditingController();
  final ctrEmail = TextEditingController();
  final ctrBank = TextEditingController();
  final ctrAccNo = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    // Clean up the controller when the widget is disposed
    ctrName.dispose();
    ctrAddress.dispose();
    ctrPostcode.dispose();
    ctrPhone1.dispose();
    ctrPhone2.dispose();
    ctrEmail.dispose();
    ctrBank.dispose();
    ctrAccNo.dispose();
    super.dispose();
  }


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
              child: Column(
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

                                // Name
                                TextField(
                                  controller: ctrName,
                                  decoration: InputDecoration(
                                    hintText: 'Name',
                                    hintStyle: TextStyle( color: Colors.black,),
                                    enabledBorder: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.black, width: 0.3,),),
                                  ),
                                ),
                                SizedBox(height: 5.0),

                                // Address
                                TextField(
                                  controller: ctrAddress,
                                  decoration: InputDecoration(
                                    hintText: 'Address',
                                    hintStyle: TextStyle( color: Colors.black,),
                                    enabledBorder: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.black, width: 0.3,),),
                                  ),
                                ),
                                SizedBox(height: 5.0),

                                // Postcode & City
                                Row(
                                  children: [

                                    // Postcode
                                    Expanded(
                                      flex: 1,
                                      child: TextField(
                                        controller: ctrPostcode,
                                        decoration: InputDecoration(
                                          hintText: "Postcode",
                                          hintStyle: TextStyle( color: Colors.black,),
                                          enabledBorder: UnderlineInputBorder( borderSide: const BorderSide( color: Colors.black, width: 0.3)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20.0,),

                                    // City
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

                                // Phone No
                                Row(
                                  children: [

                                    // Phone No 1
                                    Expanded(
                                      flex: 1,
                                      child: TextField(
                                        controller: ctrPhone1,
                                        decoration: InputDecoration(
                                          hintText: "Phone No. (1)",
                                          hintStyle: TextStyle( color: Colors.black,),
                                          enabledBorder: UnderlineInputBorder( borderSide: const BorderSide( color: Colors.black, width: 0.3)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20.0,),

                                    // Phone No 2
                                    Expanded(
                                      flex: 1,
                                      child: TextField(
                                        controller: ctrPhone2,
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

                                // E-mail
                                TextField(
                                  controller: ctrEmail,
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    hintStyle: TextStyle( color: Colors.black,),
                                    enabledBorder: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.black, width: 0.3,),),
                                  ),
                                ),
                                SizedBox(height: 5.0),

                                // Bank
                                TextField(
                                  controller: ctrBank,
                                  decoration: InputDecoration(
                                    hintText: 'Bank',
                                    hintStyle: TextStyle( color: Colors.black,),
                                    enabledBorder: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.black, width: 0.3,),),
                                  ),
                                ),
                                SizedBox(height: 5.0),

                                // Account No
                                TextField(
                                  controller: ctrAccNo,
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
                          SizedBox(height: 180.0),
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
                        // Store the values in object Client
                        ClientModel client = new ClientModel(
                          ctrName.text,
                          ctrAddress.text,
                          ctrPostcode.text,
                          ctrPhone1.text,
                          ctrPhone2.text,
                          ctrEmail.text,
                          ctrBank.text,
                          ctrAccNo.text
                        );
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewIncome(current: 2)));
                        // For testing purposes
                        // showDialog(
                        //     context: context,
                        //     builder: (context){
                        //       return AlertDialog(
                        //         content: Column(
                        //           children: [
                        //             Text(income.particular + " " + income.total + " " + income.notes),
                        //             Text(
                        //               "Name: " + client.name +
                        //               " Address: " + client.address +
                        //               " Postcode: " + client.postcode +
                        //               " Phone No (1): " + client.phone1 +
                        //               " Phone No (2): " + client.phone2 +
                        //               " Email: " + client.email +
                        //               " Bank: " + client.bank +
                        //               " Account No: " + client.accNo
                        //             ),
                        //           ],
                        //         ),
                        //       );
                        //     }
                        //  );
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
              ),
            ),

          ],
        ),
      ),


      bottomNavigationBar: NavigationBar(index: 1,), // passing the index for this page
    );
  }
}
