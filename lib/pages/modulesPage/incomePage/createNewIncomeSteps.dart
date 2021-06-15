import 'package:accounting/utilities/colors.dart';
import 'package:flutter/material.dart';

import 'createNewIncome.dart';


// NewIncome
class NewIncome extends StatefulWidget {

  // Dropdown
  @override
  _NewIncomeState createState() => _NewIncomeState();
}

class _NewIncomeState extends State<NewIncome> {

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
                      Container(
                        padding: EdgeInsets.only(bottom: 0.2),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 0.3, color: Colors.black)),
                        ),
                        child: DropdownButton(
                          value: paymentType,
                          hint: Text("Payment Type", style: TextStyle(color: Colors.black)),
                          icon: Icon(Icons.arrow_forward_ios_outlined),
                          iconSize: 20.0,
                          isExpanded: true,
                          underline: SizedBox(), // disable this underline, used the border bottom of the container instead
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
                        padding: EdgeInsets.only(bottom: 0.2),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 0.3, color: Colors.black)),
                        ),
                        child: DropdownButton(
                          value: ledger,
                          hint: Text("Ledger", style: TextStyle(color: Colors.black)),
                          icon: Icon(Icons.arrow_forward_ios_outlined),
                          iconSize: 20.0,
                          isExpanded: true,
                          underline: SizedBox(), // disable this underline, used the border bottom of the container instead
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
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewIncome(current: 2)));
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

// AddClientDetails
class AddClientDetails extends StatefulWidget {

  // for dropdown
  @override
  _AddClientDetailsState createState() => _AddClientDetailsState();
}

class _AddClientDetailsState extends State<AddClientDetails> {
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
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewIncome(current: 2)));

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



