import "package:SiCalci/screens/home_screen.dart";
import "package:flutter/material.dart";

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return SICalculator();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('images/SiCalci.jpg', width: 300, height: 300),
          Text(
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Caveat',
                  fontWeight: FontWeight.w700),
              "Developed by Priyanshu Rana")
        ],
      ),
    ));
    ;
  }
}
