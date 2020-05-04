import 'package:chatapp/screens/login_screen.dart';
import 'package:chatapp/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id ='welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin{

AnimationController controller;
Animation animation1,animation2,animation3;

@override
void initState(){
  super.initState();

  controller = AnimationController(duration: Duration(seconds: 16),vsync: this);
  animation1 = 
  ColorTween(begin:Colors.red,end:Colors.white).animate(controller);
  animation2 = ColorTween(begin: Colors.lightBlueAccent,end: Colors.red).animate(controller);
  animation3 = ColorTween(begin: Colors.blueAccent,end: Colors.green).animate(controller);
  controller.forward();
  controller.addListener(() {
    setState(() {
      
    });
    print(animation1.value);
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:animation1.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child:Container(
                  child: Image.asset('images/logo.png'),
                  height: 60.0
                ),
                ),
                Text(
                  'ChatterBox',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: animation2.value,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                   Navigator.pushNamed(context, LoginScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: animation3.value,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                   Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
