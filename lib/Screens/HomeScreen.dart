import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/Screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -10,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Row(
          children: [
            new Container(
              margin: EdgeInsets.only(
                  left: Platform.isIOS ? 25 : 15, top: 10, bottom: 6),
              child: Positioned(
                left: 16.0,
                right: 16.0,
                child: CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 25,
                  ),
                  radius: 17.0,
                ),
              ),
            ),
            new Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Text('Welcome  ' +phone,
                  style: TextStyle(fontFamily: 'Billabong', fontSize: 16)),
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  _onBackPressed();
                },
                child: Icon(Icons.exit_to_app),
              ))
        ],
        backgroundColor: Colors.purple,
      ),
      body: new Container(
        child: new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Container(
                height: 150,
                width: 150,
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(
                      8.0),
                  image: DecorationImage(

                    image: AssetImage(
                        "assets/images/welcome.gif"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }



  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('You want to logout'),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'NO',
                  style: new TextStyle(color: Colors.lime),
                ),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('YES',
                    style: new TextStyle(color: Colors.lime)),
                color: Colors.white,
                onPressed: () {
                  print("test");
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ],
          );
        });
  }

}
