import 'dart:async';



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:test_app/Screens/HomeScreen.dart';
import 'package:test_app/Screens/login_screen.dart';





class CustomDialog extends StatefulWidget {
  @override
  _CustomDialogState createState() => _CustomDialogState();

}

class _CustomDialogState extends State<CustomDialog>  {
  String title, description, buttonText;
  Image image;
  String otp = '';

  double padding = 16.0;
  double avatarRadius = 45.0;
  Timer _timer;
  int _start= 60;
  String otpWaitTimeLabel = "";
  bool timerStatus =false;



  @override
  void initState() {
    super.initState();
    setState(() {
     //  timerStatus =true;
      startTimer();
    });

  }



  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(padding),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child:   Stack(
          children: <Widget>[

            Container(
              padding: EdgeInsets.only(
                top: avatarRadius + padding,
                bottom: padding,
                left: padding,
                right: padding,
              ),
              margin: EdgeInsets.only(top: avatarRadius),
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(padding),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: const Offset(0.0, 10.0),
                  ),
                ],

              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                // To make the card compact
                children: <Widget>[
                  Text(
                    'Otp sent on  ' +'+91 '+phone ,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700,color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16.0),


                  new Container(
                    height: 90,

                    child:Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: OTPTextField(
                         length: 4,
                         width: MediaQuery.of(context).size.width,
                         fieldWidth: 20,
                         style: TextStyle(
                             fontSize: 16
                         ),
                       textFieldAlignment: MainAxisAlignment.spaceAround,
                       fieldStyle: FieldStyle.underline,
                        onCompleted:(value){
                         setState(() {
                           otp = value;
                           print(otp);
                           if(otp.length == 4){
                             Navigator.push(context,
                                 MaterialPageRoute(builder: (context) => HomeScreen()));
                           }
                         }
                         );
                         },//code length, default 6
                      ),
                    ),

                  ),

                  SizedBox(height: 4.0),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: timerStatus ?FlatButton(
                        onPressed: () {
                          setState(() {
                            timerStatus =false;
                            _start= 60;
                          });
                          startTimer();
                          },
                        child: Text('Re-Send',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w700,color: Colors.black,
                          ),)

                    ): new Text("$_start"+'s',
                    style:TextStyle(fontSize: 16,color: Colors.red),)

                  )],
              ),
            ),


                Positioned(
                  left: padding,
                  right: padding,
                  child: CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Text("OTP",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    radius: avatarRadius,

                  ),
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Colors.white
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),


              ],
            ),



          ],
        )

    );
  }



  @override
  void onRegistrationError(String errorTxt) {
    // TODO: implement onRegistrationError
  }





  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
          if(_start==0){
            setState(() {
              timerStatus = true;
              print(timerStatus);
            });
          }
        },
      ),
    );
  }






  //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ PopUp Method @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@





}


//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ timer Method @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



