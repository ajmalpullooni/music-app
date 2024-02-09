import 'package:flutter/material.dart';
import 'package:marshall/screens/home/first_screens/started.dart';


class Screensplash extends StatefulWidget {
  const Screensplash({super.key});

  @override
  State<Screensplash> createState() => _ScreensplashState();
}

class _ScreensplashState extends State<Screensplash> {
  @override
  void initState() {
    gotonext();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Image.asset('asset/images/splashload.gif'))));
  }

  Future<void> gotonext() async {
    await Future.delayed(const Duration(seconds: 3));
    
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((ctx) =>   Screenstarted())));
  }
}
