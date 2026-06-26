import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototype/home_screen.dart';
import 'package:prototype/logo_animation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool? firstTime = true;

  void init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.containsKey("isFirstTimer")) {
      firstTime = sharedPreferences.getBool("isFirstTimer");
    }

    if (firstTime == true) {

      await sharedPreferences.setBool("isFirstTimer", false);

      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (builder) => LogoAnimation()));
    } else {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (builder) => HomeScreen()));
    }
  }

  late Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    timer = Timer(const Duration(seconds: 2), () => init());
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Text(
          "splash!",
          style: GoogleFonts.poppins(
            fontSize: size.width * .055,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
