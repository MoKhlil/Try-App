import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/loginPage.dart';
import 'package:flutter_login_signup/src/signup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Conect/APICon.dart';
import 'Widget/bezierContainer.dart';
class WelcomePage extends StatefulWidget  {

  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();

}

class _WelcomePageState extends State<WelcomePage>  {

  Widget _submitButton() {
    return Container(
      width: 250,
              child: new RaisedButton(

                  textColor: Colors.lime,
                  child: new Text("login"),
                  color: Colors.black,
                  splashColor: Colors.lime[100],
                  animationDuration: Duration(seconds: 60),
                  padding: EdgeInsets.all(5.0),
                onPressed: ()  {
                     Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => LoginPage()));
                   },
    shape: RoundedRectangleBorder(
    borderRadius: new BorderRadius.circular(18.0),
    side: BorderSide(color: Colors.white),
    )
              ),
      );
  }

  Widget _signUpButton() {
      return
        Container(
          width: 250,
            child: new RaisedButton(
              textColor: Colors.lime,
              child: new Text("Register"),
              color: Colors.black,
              splashColor: Colors.lime[100],
              animationDuration: Duration(seconds: 60),
              padding: EdgeInsets.all(5.0),
              onPressed: ()  {
                Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
              },
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.white),
                )
            ),
        );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'T',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffffd600),
          ),
          children: [
            TextSpan(
              text: 'ry',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),

          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF000000), Color(0xFF000000)]
              //colors: [Color(0xffffd600), Color(0xffffd600)]
            )
        ),
        height: height,
        child: Stack(
            children: <Widget>[
        Positioned(
        top: -height * .10,
            right: -MediaQuery.of(context).size.width * .5,
            child: BezierContainer()),
        Container(
          padding: const EdgeInsets.fromLTRB(70,0,70,0),
            child: SingleChildScrollView(
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: height * .2),
                _title(),
                SizedBox(height: 50),
                _submitButton(),
                SizedBox(height: 20),
                _signUpButton(),
                SizedBox(height: height * .055),
              ],
            ),
    ),
    ),
            ]
    ),
    ),
    );

  }
}
