import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/Widget/bezierContainer.dart';
import 'package:flutter_login_signup/src/loginPage.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final PasswordController = TextEditingController();
  final EmailController = TextEditingController();
  final ConPassController= TextEditingController();

  bool _PAssvalidate = false;
  bool _Mailvalidate = false;
  bool _ConPassvalidate = false;
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.white),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: 150,
      height:50,
      child: new RaisedButton(

          child: new Text("Register Now",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.lime)),
          color: Colors.black,
          splashColor: Colors.lime,
          animationDuration: Duration(seconds: 60),
          padding: EdgeInsets.all(5.0),

          onPressed: ()   {
            setState(() {
              EmailController.text.isEmpty ? _Mailvalidate = true  : _Mailvalidate = false;
              PasswordController.text.isEmpty ? _PAssvalidate = true : _PAssvalidate = false;
              ConPassController.text.isEmpty ? _ConPassvalidate = true : _ConPassvalidate = false;
            });
              if(EmailController.text.isEmpty||PasswordController.text.isEmpty||ConPassController.text.isEmpty)
              {
                return ;
              }
          },
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.white),
          )
      ),

    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(0),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white)
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.lime),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        BezierContainer().DesignTextFild("Username",EmailController,"Username Value Can\'t Be Empty",_Mailvalidate,isPassword: false),

        SizedBox(height: 10),
        BezierContainer().DesignTextFild("Password",PasswordController,"Password Value Can\'t Be Empty",_PAssvalidate,isPassword: true),

        SizedBox(height: 10),
        BezierContainer().DesignTextFild("ConfermPassword",ConPassController,"ConfermPassword Value Can\'t Be Empty",_ConPassvalidate,isPassword: true),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
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
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //SizedBox(height: height * .2),
                    BezierContainer().title(),
                    SizedBox(height: 20),
                    _emailPasswordWidget(),
                    SizedBox(height: 20),
                    _submitButton(),
                    SizedBox(height: height * .030),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
