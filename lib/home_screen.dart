import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isClicked = false.obs;
    var size = MediaQuery.of(context).size;
    var appBarHeight = AppBar().preferredSize.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isClicked.value = !isClicked.value;
        },
        backgroundColor: Colors.red,
        child: Icon(CupertinoIcons.sparkles, color: Colors.white),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        toolbarHeight: appBarHeight * 1.5,
        title: Text(
          "Stack & Animations",
          style: GoogleFonts.poppins(
            fontSize: size.width * 0.039,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),

      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Obx(
          () => Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 555),
                curve: Curves.ease,
                left: 21,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 555),
                  curve: Curves.ease,
                  width: isClicked.value
                      ? size.width - 21 - 21
                      : size.width * .35,
                  height: size.height * .39,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(
                      isClicked.value ? 41 : 1000,
                    ),
                  ),
                ),
              ),

              AnimatedPositioned(
                duration: const Duration(milliseconds: 555),
                curve: Curves.ease,
                left: isClicked.value ? 21 + 11 : size.width * .35 + 21 + 11,
                top: isClicked.value ? appBarHeight * .89 : 0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 555),
                  curve: Curves.ease,
                  width: isClicked.value
                      ? size.width - 21 - 21 - 11 - 11
                      : size.width - (size.width * .35 + 21 + 11 + 21),
                  height: isClicked.value
                      ? size.height * .39 - appBarHeight * .89 - 11
                      : size.height * .21,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(
                      isClicked.value ? 41 : 1000,
                    ),
                  ),
                ),
              ),

              AnimatedPositioned(
                duration: const Duration(milliseconds: 555),
                curve: Curves.ease,
                left: size.width * .35 + 21 + 11,
                top: isClicked.value ? 7 : size.height * .21 + 11,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 555),
                  curve: Curves.ease,
                  width: isClicked.value
                      ? size.width * .19
                      : size.width - (size.width * .35 + 21 + 11 + 21),
                  height: isClicked.value
                      ? appBarHeight * .89 - 7 - 7
                      : size.height * .18 - 11,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  child: isClicked.value
                      ? Center(
                          child: Text(
                            "cancel",
                            style: GoogleFonts.poppins(
                              fontSize: size.width * .035,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
