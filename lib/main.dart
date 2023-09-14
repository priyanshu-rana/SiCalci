import "package:SiCalci/screens/splash_screen.dart";
import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Simple Interest calculator",
      // home: SICalculator(),
      home: SplashScreen(),
      theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Colors.indigo).copyWith())));
}
