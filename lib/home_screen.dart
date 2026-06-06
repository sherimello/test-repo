import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    //info about screen...
    var size = MediaQuery.of(context).size;

    //info about appbar...
    var appBarHeight = AppBar().preferredSize.height;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          setState(() {
            isClicked = !isClicked;
          });
        },
        child: Icon(CupertinoIcons.sparkles, color: Colors.red,),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        toolbarHeight: appBarHeight * 1.5,
        title: Text(
          "Stack & Animations",
          style: GoogleFonts.poppins(
            fontSize: size.width * 0.041,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
            height: 0,
          ),
        ),
      ),

      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [


            //black container....
            AnimatedPositioned(
              duration: const Duration(milliseconds: 577),
              curve: Curves.linearToEaseOut,
              left: 21,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 577),
                curve: Curves.linearToEaseOut,
                height: size.height * .39,
                width: isClicked ? size.width - 21 - 21 : size.width * .35,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(isClicked ? 41 : 1000),
                ),
              ),
            ),

            //grey container...
            AnimatedPositioned(
              duration: const Duration(milliseconds: 577),
              curve: Curves.linearToEaseOut,
              left: isClicked ? 21 + 11 : size.width * .35 + 21 + 11,
              top: isClicked ? appBarHeight * .85 : 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 577),
                curve: Curves.linearToEaseOut,
                width: isClicked
                    ? size.width - 21 - 21 - 11 - 11
                    : size.width * .65 - 21 - 11 - 21,
                height: isClicked
                    ? size.height * .39 - appBarHeight * .85 - 11
                    : size.height * .20,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(isClicked ? 41 : 1000),
                ),
              ),
            ),

            //red container...
            AnimatedPositioned(
              duration: const Duration(milliseconds: 577),
              curve: Curves.linearToEaseOut,
              top: isClicked ? 7 : size.height * .20 + 11,
              left: isClicked
                  ? size.width * .5 - size.width * .23 * .5
                  : size.width * .35 + 21 + 11,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 577),
                curve: Curves.linearToEaseOut,
                width: isClicked
                    ? size.width * .23
                    : size.width * .65 - 21 - 11 - 21,
                height: isClicked
                    ? appBarHeight * .85 - 7 - 7
                    : size.height * .39 - size.height * .20 - 11,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(1000),
                ),
                child: isClicked
                    ? Center(
                      child: Text(
                          "cancel",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: size.width * .039,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            height: 0,
                          ),
                        ),
                    )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
