import 'dart:async';

import 'package:flutter/material.dart';

class LogoAnimation extends StatefulWidget {
  const LogoAnimation({super.key});

  @override
  State<LogoAnimation> createState() => _LogoAnimationState();
}

class _LogoAnimationState extends State<LogoAnimation> {
  bool isInitAnimation = false, isChangeShape = false;
  late Timer timer1, timer2;

  void init() async {
    timer1 = Timer(const Duration(seconds: 1), () {
      setState(() {
        isInitAnimation = !isInitAnimation;
      });
      timer2 = Timer(const Duration(seconds: 1), () {
        setState(() {
          isChangeShape = !isChangeShape;
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    timer1.cancel();
    timer2.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var appBarHeight = AppBar().preferredSize.height;

    double getLeft() {
      double d = 0;

      if (isInitAnimation) {
        d = size.width * .5 - size.width * .07 - size.width * .05;
      } else {
        d = size.width * .5 - size.width * .035;
      }

      return d;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   toolbarHeight: appBarHeight * 1.5,
      //   backgroundColor: Colors.white,
      //   surfaceTintColor: Colors.white,
      //   elevation: 0,
      //   centerTitle: true,
      //   title: Text(
      //     "logo animation",
      //     style: GoogleFonts.poppins(
      //       fontSize: size.width * .039,
      //       fontWeight: FontWeight.w700
      //     ),
      //   ),
      // ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            //circle 1.......
            AnimatedPositioned(
              duration: const Duration(milliseconds: 755),
              curve: Curves.ease,
              left: getLeft(),
              top: size.height * .5 - size.width * .035,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 755),
                curve: Curves.ease,
                width: size.width * .07,
                height: size.width * .07,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: isChangeShape
                      ? BorderRadius.only(
                          topLeft: Radius.circular(200),
                          topRight: Radius.circular(1000),
                          bottomLeft: Radius.circular(200),
                          bottomRight: Radius.circular(200),
                        )
                      : BorderRadiusGeometry.circular(1000),
                ),
              ),
            ),

            //circle 2.........
            AnimatedPositioned(
              duration: const Duration(milliseconds: 755),
              curve: Curves.ease,
              left: isInitAnimation
                  ? size.width * .5 + size.width * .05
                  : size.width * .5 - size.width * .035,
              top: size.height * .5 - size.width * .035,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 755),
                curve: Curves.ease,
                width: size.width * .07,
                height: size.width * .07,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: isChangeShape
                      ? BorderRadius.only(
                          topLeft: Radius.circular(1000),
                          topRight: Radius.circular(200),
                          bottomLeft: Radius.circular(200),
                          bottomRight: Radius.circular(1000),
                        )
                      : BorderRadiusGeometry.circular(1000),
                ),
              ),
            ),

            //circle 3.........
            AnimatedPositioned(
              duration: const Duration(milliseconds: 755),
              curve: Curves.ease,
              left: size.width * .5 - size.width * .035,
              top: size.height * .5 - size.width * .035,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 755),
                curve: Curves.ease,
                width: size.width * .07,
                height: size.width * .07,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: isChangeShape
                      ? BorderRadius.circular(11)
                      : BorderRadiusGeometry.circular(1000),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
