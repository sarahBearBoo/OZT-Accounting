import 'dart:ui';
import 'package:accounting/pages/modulesPage/clientPage/clientInfo.dart';
import 'package:accounting/utilities/appBar/appBar.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:accounting/utilities/navigationBar/navigationBar.dart';
import 'package:flutter/material.dart';

/*
=================================================================================
 TABLE OF CONTENTS
 ------------------
 1. Client - Defines layout for 'Client'
 2. ClientList - List of clients for each alphabet
 3. ClientTile - Layout for each client's name and email
 ================================================================================
 */


class Client extends StatefulWidget {
  @override
  _ClientState createState() => _ClientState();
}

class _ClientState extends State<Client> {

  var alphabets = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: TopAppBar(title: "CLIENT"),
      ),


      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [

              // Search button
              Container(
                color: Colors.white,
                width: double.infinity,
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    fillColor: Colors.blueGrey[50],
                    filled: true,
                    border: InputBorder.none,
                    hintText: "Search",
                  ),
                ),
              ),

              for(var i = 0; i < alphabets.length; i++)
              ClientList(alphabet: alphabets[i]),
              //ListView( shrinkWrap: true, children: new List.generate(3, (index) => new  ClientTile()),)
            ],
          ),
        ),
      ),


      bottomNavigationBar: NavigationBar(index: 1,),  // passing the index for this page
    );
  }
}


// Widget: Client's contact list per alphabet
class ClientList extends StatelessWidget {

  final String alphabet;
  ClientList({this.alphabet});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

          // 1. Alphabet
          Container( 
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            color: AppColors().lightGrey,
            child: Text(
                "$alphabet".toUpperCase(),
              style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // 2. List
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: new List.generate(3, (index) => new  ClientTile()),
          ),

        ],
      ),
    );
  }
}

// Widget: Client Tile
class ClientTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      height: 80,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClientInfo(active: 0)));
        },
        child: Row(
            children: [

              // 1. Icon
              Expanded(
                flex: 1,
                child: Image.asset('assets/images/client icon.png'),),

              // 2. Client's name & email
              // Supposedly this one is dynamic not static
              Expanded(
                flex: 3,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.0),
                      // 1. Name
                      Text(
                        "Alen Mullin",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      Text(
                        "alenmullin@gmail.com",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ]
                ),
              ),
            ]
        ),
      ),
    );
  }
}

