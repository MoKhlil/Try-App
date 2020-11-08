
import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/signup.dart';
import 'package:flutter_login_signup/src/welcomePage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Conect/APICon.dart';
import 'Widget/bezierContainer.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final PasswordController = TextEditingController();
  final EmailController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _PAssvalidate = false;
  bool _Mailvalidate = false;
  Widget _PasswordField(String title,TextEditingController control,String Error,bool ErrorVa, {bool isPassword = false}) {
    FocusNode myFocusNode = new FocusNode();
    return
      TextFormField(
        controller: control,
        cursorColor: Colors.lime,
        obscureText: isPassword,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          fillColor: Colors.white12,
          filled: true,
          errorText: ErrorVa ? Error : null,

          labelText: title,
          labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.white : Colors.white
          ),

          //hintText: title,
          //hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),

          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.white12),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.lime),
          ),
        ),
      );
  }

  Widget _submitButton() {
    return Container(
          width: 150,
          height:50,
      child: new RaisedButton(
          textColor: Colors.lime,
          child: new Text("login"),
        color: Colors.black,
        splashColor: Colors.lime[100],
        animationDuration: Duration(seconds: 60),
          padding: EdgeInsets.all(5.0),

        onPressed: () async {
          _Mailvalidate = false;
          _PAssvalidate = false;
            if(EmailController.text.isEmpty)
              {

                setState(() {
                  EmailController.text.isEmpty ? _Mailvalidate = true : _Mailvalidate = false;
                });
                return ;
              }

            if(PasswordController.text.isEmpty)
            {
              setState(() {

                PasswordController.text.isEmpty ? _PAssvalidate = true : _PAssvalidate = false;
              });
              return ;
            }
         SharedPreferences localStorage = await SharedPreferences.getInstance();
         Network().fetchAlbum("json");
         var sien=   localStorage.getString('Test');


         if(sien !="")
         {
           Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => WelcomePage()));
         };
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

  Widget _emailWidget() {
    return Column(
      children: <Widget>[
        _PasswordField("ID",EmailController,"ID Value Can\'t Be Empty",_Mailvalidate,isPassword: false),
        SizedBox(height: 10),
        _PasswordField("Passowrd",PasswordController,"Passowrd Value Can\'t Be Empty",_PAssvalidate, isPassword: true),
      ],
    );
  }
  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600,color: Colors.white),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Colors.lime,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        //resizeToAvoidBottomInset: false, // set it to false

        key: _scaffoldKey,
        body: Container(
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
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _title(),
                      SizedBox(height: 20),
                      _emailWidget(),
                      SizedBox(height: 20),
                      _submitButton(),
                      _createAccountLabel(),

                    ],
                  ),
                ),
              ),

            ],
          ),
        )
    );
  }
}


