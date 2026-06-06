import 'package:flutter/material.dart';

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key});

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  static const animationDuration = Duration(milliseconds: 755);
  static const animationCurve = Curves.easeInOutCirc;

  bool initAnimation = false;
  bool shouldMoveLogoToHeader = false;
  bool shouldSplitOrbs = false;
  bool shouldTriggerRandomShapes = false;
  bool shouldIncreaseOrbSize = false;
  bool shouldFormRipplesLogo = false;

  Future<void> _startAnimation() async {
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;

    setState(() => shouldSplitOrbs = true);

    await Future.delayed(animationDuration);
    if (!mounted) return;

    setState(() => shouldIncreaseOrbSize = true);

    await Future.delayed(animationDuration);
    if (!mounted) return;

    setState(() => shouldTriggerRandomShapes = true);

    await Future.delayed(animationDuration);
    if (!mounted) return;

    setState(() => shouldFormRipplesLogo = true);

    await Future.delayed(animationDuration);
    if (!mounted) return;

    setState(() => initAnimation = true);

    await Future.delayed(animationDuration);
    if (!mounted) return;

    setState(() => shouldMoveLogoToHeader = true);
  }

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  double _mainOrbSize(double width) {
    if (shouldMoveLogoToHeader) return width * .19;
    if (initAnimation) return width * .15;
    if (shouldFormRipplesLogo) return width * .31;
    if (shouldIncreaseOrbSize) return width * .079;
    return width * .05;
  }

  double _mainOrbTop(Size size) {
    if (shouldMoveLogoToHeader) {
      return size.width * .19 * .25;
    }

    if (initAnimation) {
      return size.height * .5 - (size.width * .15 * .5);
    }

    if (shouldFormRipplesLogo) {
      return size.height * .5 - (size.width * .31 * .5);
    }

    return size.height * .5 - size.width * .025;
  }

  BorderRadius _centerBorderRadius() {
    if (shouldFormRipplesLogo) {
      return BorderRadius.circular(100);
    }

    if (shouldTriggerRandomShapes) {
      return const BorderRadius.only(
        topLeft: Radius.circular(100),
        topRight: Radius.circular(31),
        bottomRight: Radius.circular(100),
        bottomLeft: Radius.circular(31),
      );
    }

    return BorderRadius.circular(100);
  }

  BorderRadius _leftBorderRadius() {
    if (shouldFormRipplesLogo) {
      return BorderRadius.circular(100);
    }

    if (shouldTriggerRandomShapes) {
      return const BorderRadius.only(
        topLeft: Radius.circular(31),
        topRight: Radius.circular(100),
        bottomRight: Radius.circular(31),
        bottomLeft: Radius.circular(31),
      );
    }

    return BorderRadius.circular(100);
  }

  BorderRadius _rightBorderRadius() {
    if (shouldFormRipplesLogo) {
      return BorderRadius.circular(100);
    }

    if (shouldTriggerRandomShapes) {
      return const BorderRadius.only(
        topLeft: Radius.circular(100),
        topRight: Radius.circular(31),
        bottomRight: Radius.circular(100),
        bottomLeft: Radius.circular(100),
      );
    }

    return BorderRadius.circular(100);
  }

  double _leftOrbLeft(double width) {
    if (shouldMoveLogoToHeader) {
      return width * .5 - (width * .15 * .5);
    }

    if (initAnimation) {
      return width * .5 - (width * .11 * .5);
    }

    if (shouldFormRipplesLogo) {
      return width * .5 - width * .125;
    }

    if (shouldIncreaseOrbSize) {
      return width * .5 - width * .158;
    }

    if (shouldSplitOrbs) {
      return width * .5 - width * .1;
    }

    return width * .5 - width * .025;
  }

  double _leftOrbSize(double width) {
    if (shouldMoveLogoToHeader) return width * .15;
    if (initAnimation) return width * .11;
    if (shouldFormRipplesLogo) return width * .25;
    if (shouldIncreaseOrbSize) return width * .079;
    return width * .05;
  }

  double _rightOrbLeft(double width) {
    if (shouldMoveLogoToHeader) {
      return width * .5 - (width * .11 * .5);
    }

    if (initAnimation) {
      return width * .5 - (width * .07 * .5);
    }

    if (shouldFormRipplesLogo) {
      return width * .5 - width * .0925;
    }

    if (shouldIncreaseOrbSize) {
      return width * .5 + width * .079;
    }

    if (shouldSplitOrbs) {
      return width * .5 + width * .05;
    }

    return width * .5 - width * .025;
  }

  double _rightOrbSize(double width) {
    if (shouldMoveLogoToHeader) return width * .11;
    if (initAnimation) return width * .07;
    if (shouldFormRipplesLogo) return width * .19;
    if (shouldIncreaseOrbSize) return width * .079;
    return width * .05;
  }

  Color _centerOrbColor() {
    if (!shouldMoveLogoToHeader && initAnimation) {
      return Colors.grey;
    }

    return Colors.black;
  }

  Color _leftOrbColor() {
    if (shouldFormRipplesLogo) {
      return Colors.white30;
    }

    return Colors.black;
  }

  Color _rightOrbColor() {
    if (!shouldMoveLogoToHeader && initAnimation) {
      return Colors.black;
    }

    if (shouldFormRipplesLogo) {
      return Colors.white30;
    }

    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mainSize = _mainOrbSize(size.width);

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            duration: animationDuration,
            curve: animationCurve,
            top: _mainOrbTop(size),
            child: SizedBox(
              width: size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedContainer(
                    duration: animationDuration,
                    curve: animationCurve,
                    width: mainSize,
                    height: mainSize,
                    decoration: BoxDecoration(
                      borderRadius: _centerBorderRadius(),
                      color: _centerOrbColor(),
                    ),
                  ),

                  AnimatedPositioned(
                    duration: animationDuration,
                    curve: animationCurve,
                    left: _leftOrbLeft(size.width),
                    child: AnimatedContainer(
                      duration: animationDuration,
                      curve: animationCurve,
                      width: _leftOrbSize(size.width),
                      height: _leftOrbSize(size.width),
                      decoration: BoxDecoration(
                        borderRadius: _leftBorderRadius(),
                        color: _leftOrbColor(),
                      ),
                    ),
                  ),

                  AnimatedPositioned(
                    duration: animationDuration,
                    curve: animationCurve,
                    left: _rightOrbLeft(size.width),
                    child: AnimatedContainer(
                      duration: animationDuration,
                      curve: animationCurve,
                      width: _rightOrbSize(size.width),
                      height: _rightOrbSize(size.width),
                      decoration: BoxDecoration(
                        borderRadius: _rightBorderRadius(),
                        color: _rightOrbColor(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
