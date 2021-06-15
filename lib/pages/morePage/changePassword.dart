import 'file:///C:/Users/OZT-Office/Documents/Flutter%20Projects/accounting/lib/utilities/appBar/appBar.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:flutter/material.dart';

/*
=================================================================================
 TABLE OF CONTENTS
 ------------------
 1. ChangePassword - Layout for 'Change Password'
 ================================================================================
 */


class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  // By default, password is obscured
  bool oldPassObscure = true;
  bool newPassObscure = true;
  bool confirmPassObscure = true;

  String newPassword = "oops";

  // Function: Toggle to hide/show password
  void toggle(String password) {
    setState(() {
      if(password.toLowerCase() == "old") 
        oldPassObscure = !oldPassObscure ;
      else if(password.toLowerCase() == "new") 
        newPassObscure = !newPassObscure;
      else
        confirmPassObscure = !confirmPassObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().lightGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: TopAppBar(title: "CHANGE PASSWORD"),
      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),

          // 1. Form
          child:
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 20.0),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 0.2, color: Colors.grey,),
                ),

                child: Column(
                  children: [

                    // 1. Old Password
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Old Password", style: TextStyle( fontSize: 15.0, color: Colors.grey,),),
                          SizedBox(height: 5.0),
                          TextField(
                            obscureText: oldPassObscure,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.3,
                                  color: Colors.black,
                                ),
                              ),
                              suffixIcon: IconButton( 
                                onPressed: () { toggle("old"); }, 
                                icon: oldPassObscure == true ? Icon(Icons.visibility_off) : Icon(Icons.visibility),),
                              hintStyle: TextStyle( color: Colors.black, fontSize: 16.0,),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.0),

                    // 2. New Password
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("New Password", style: TextStyle( fontSize: 15.0, color: Colors.grey,),),
                          SizedBox(height: 5.0),
                          TextField(
                            obscureText: newPassObscure,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.2,
                                  color: Colors.black,
                                ),
                              ),
                              suffixIcon: IconButton( 
                                onPressed: () { toggle("new"); }, 
                                icon: newPassObscure == true ? Icon(Icons.visibility_off) : Icon(Icons.visibility),),
                              hintStyle: TextStyle( color: Colors.black, fontSize: 16.0,),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.0),

                    // 3. Confirm New Password
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Confirm New Password", style: TextStyle( fontSize: 15.0, color: Colors.grey,),),
                          SizedBox(height: 5.0),
                          TextField(
                            obscureText: confirmPassObscure,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.2,
                                  color: Colors.black,
                                ),
                              ),
                              suffixIcon: IconButton( 
                                onPressed: (){ toggle("confirm");}, 
                                icon: confirmPassObscure == true ? Icon(Icons.visibility_off,) : Icon(Icons.visibility),),
                              hintStyle: TextStyle( color: Colors.black, fontSize: 16.0,),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),

                    // 4. Button: Update Password
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
                          'UPDATE PASSWORD',
                          style: TextStyle(
                            fontSize: 18.0,
                            letterSpacing: 1.2,
                            color: AppColors().blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

        ),
      ),

      bottomNavigationBar: NavigationBar(index: 3,),  // passing the index for this page
    );
  }
}
