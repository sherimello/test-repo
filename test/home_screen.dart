import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'widgets/animated_logo.dart';

// import '../lib/widgets/animated_logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> notes = [
    {
      "title": "Shopping List",
      "content": "Milk\nEggs\nBread\nCoffee\nCheese",
    },
    {
      "title": "Ideas",
      "content":
      "Build a Windows launcher with AI-powered actions and plugin support.",
    },
    {
      "title": "Meeting Notes",
      "content":
      "Discuss roadmap, marketing strategy, onboarding improvements, and launch timeline.",
    },
    {
      "title": "Flutter Tips",
      "content":
      "Use const constructors whenever possible. Extract reusable widgets and avoid rebuilding unnecessarily.",
    },
    {
      "title": "Quick Reminder",
      "content": "Call dentist tomorrow.",
    },
    {
      "title": "Project Goals",
      "content":
      "• Reach 1000 users\n• Launch website\n• Create demo videos\n• Collect feedback\n• Add cloud sync",
    },
  ];

  final List<Color> noteColors = [
    const Color(0xFFFFF8B8),
    const Color(0xFFD7F9E9),
    const Color(0xFFFFD9D9),
    const Color(0xFFDDE7FF),
    const Color(0xFFFFE8C8),
  ];

  Timer? t1;
  bool shouldLoadNotes = false;

  @override
  void initState() {
    super.initState();

    t1 = Timer(const Duration(seconds: 5), () {
      if (!mounted) return;

      setState(() {
        shouldLoadNotes = true;
      });
    });
  }

  @override
  void dispose() {
    t1?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final topPadding = size.width * .19 + size.width * .19 * .5;

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const AnimatedLogo(),

            AnimatedOpacity(
              duration: const Duration(milliseconds: 755),
              opacity: shouldLoadNotes ? 1 : 0,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  21,
                  topPadding,
                  21,
                  0,
                ),
                child: Transform.scale(
                  alignment: Alignment.topCenter,
                  scale: .95,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            CupertinoIcons.collections_solid,
                          ),
                          const SizedBox(width: 7),
                          Text(
                            "All Notes",
                            style: TextStyle(
                              fontSize: size.width * .055,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 11),

                      Expanded(
                        child: MasonryGridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 7,
                          crossAxisSpacing: 7,
                          itemCount: shouldLoadNotes
                              ? notes.length
                              : 0,
                          itemBuilder: (context, index) {
                            final note = notes[index];

                            return TweenAnimationBuilder<double>(
                              duration: Duration(
                                milliseconds:
                                755 * (index * .95).ceil(),
                              ),
                              curve: Curves.linearToEaseOut,
                              tween: Tween(
                                begin: 0,
                                end: 1,
                              ),
                              builder: (
                                  context,
                                  value,
                                  child,
                                  ) {
                                return Opacity(
                                  opacity: value,
                                  child: Transform.translate(
                                    offset: Offset(
                                      0,
                                      (1 - value) * 20,
                                    ),
                                    child: child,
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(21),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                  BorderRadius.circular(
                                    31,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black
                                          .withOpacity(.05),
                                      blurRadius: 10,
                                      offset:
                                      const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      note["title"]!,
                                      style: TextStyle(
                                        fontSize:
                                        size.width * .037,
                                        fontWeight:
                                        FontWeight.w900,
                                        color: noteColors[
                                        index %
                                            noteColors
                                                .length],
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 10,
                                    ),

                                    Text(
                                      note["content"]!,
                                      style: TextStyle(
                                        color:
                                        Colors.white38,
                                        fontWeight:
                                        FontWeight.w500,
                                        fontSize:
                                        size.width * .031,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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