

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test_app/dialogbox/CustomDialog.dart';

String phone = '';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var maskFormatter = new MaskTextInputFormatter(mask: '#####-#####', filter: { "#": RegExp(r'[0-9]') });

      var submitted = false;
      final _phnController = TextEditingController();
      String _mobileNumber = "Mobile Number";
      bool boolPhone = false;




      //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Initiate Method @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

      @override
      void initState() {
        super.initState();
        _phnController.clear();
        setState(() {
          _mobileNumber = "Mobile Number";
        });
      }

      @override
      Widget build(BuildContext context) {

        return Scaffold(
          body: Center(

            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[

                  new Container(
                    color: Colors.black,
                    height: MediaQuery.of(context).size.height/1,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.only(left: 10,top: 10,bottom: 80),
                          child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40),),
                        ),

                        new Container(
                            height: 55,
                            margin: EdgeInsets.only(left: 40, right: 40, top: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                color: Colors.lime),
                            child: new Container(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 2, bottom: 9),
                              child: TextField(
                                controller: _phnController,
                                cursorColor: Colors.black,
                                maxLength: 11,
                                inputFormatters: [maskFormatter],


                                keyboardType: TextInputType.phone,
                                onChanged: (value) {
                                  phone = value;
                                },
                                style: TextStyle(color: Colors.black54, fontSize: 12),
                                decoration: InputDecoration(
                                  icon: new Icon(
                                    Icons.phone_android,
                                    color: Colors.purple,
                                  ),
                                  fillColor: Colors.lime,
                                  filled: true,
                                  counterText: "",
                                  hintText: _mobileNumber,
                                  hintStyle: TextStyle(
                                      color: _mobileNumber == "Mobile Number"
                                          ? Colors.white
                                          : Colors.red,
                                      fontSize: 12),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.lime),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.lime),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            )),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                          margin: EdgeInsets.only(top: 20),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            onPressed: () {
                              _submit();
                            },
                            color: Colors.purple,
                            disabledColor:  Colors.purple,
                            disabledTextColor: Colors.white60,
                            textColor: Colors.white,
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Container(),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        );
      }

//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Validation Method @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

      void _submit() async {
        if (phone == null || phone == '') {
          setState(() {
            _mobileNumber = "Mobile Number is required*";
            submitted = false;
          });
        }else if (phone.length < 11) {
          setState(() {
            _phnController.clear();
            _mobileNumber = '10 digits required*';
            submitted = false;
          });
        }  else {
          setState(() {
            submitted = true;
          });
        }
        if (submitted == true ) {
          showMobileVerificationPopup();
        }
      }

  Future<bool> showMobileVerificationPopup() {

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => CustomDialog(),
    );
  }
    }
