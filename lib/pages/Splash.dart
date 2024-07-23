import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iksha/home.dart';
import 'package:iksha/pages/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  final auth = FirebaseAuth.instance;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    // Start the animation
    Future.delayed(Duration.zero, () {
      setState(() {
        _opacity = 1.0;
      });
    });

    Future.delayed(const Duration(seconds: 7)).then((value) {
     if (auth.currentUser == null) {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginPage()));
     } else {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MyHomePage()));
     }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: 5), // Duration for the fade-in animation
          child: Image.asset('assets/images/Logo.png', height: 350, width: 360),
        ),
      ),
    );
  }
}

