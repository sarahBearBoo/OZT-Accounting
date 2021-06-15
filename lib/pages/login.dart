import 'package:accounting/utilities/colors.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';

class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox (
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0,50.0,10.0,0.0),
                      child: Image.asset("assets/images/vhost logo.png"),
                    ),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0,10.0,20.0,10.0),
                      child: Text(
                        "Our ERP Management System is the strategic approach to the effective management of people in a company or organization such that they help their business gain a competitive advantage. It is designed to maximize employee performance in service of an employers strategic objectives.",
                      softWrap: true,
                      textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                      ),
                    ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30.0,30.0,30.0,10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30.0,0.0,30.0,10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30.0,0.0,30.0,10.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50.0,
                          child: TextButton(
                            onPressed: (){
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => Dashboard()),
                                    (Route<dynamic> route) => false,
                              );
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
                              'LOG IN',
                            style: TextStyle(
                              fontSize: 18.0,
                              letterSpacing: 1.2,
                              color: AppColors().blue,
                              fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                          "Forgot your password?",
                        style: TextStyle(
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ), 
    );
  }

}
