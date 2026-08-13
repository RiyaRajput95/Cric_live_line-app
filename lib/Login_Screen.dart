import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Botton_Classes/HomeScreen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  Offset imageOffset = const Offset(1, 0);
  Offset textOffset = const Offset(-1, 0);
  int currentPage = 0;
  Timer? timer;
  bool visible = true;
  final imageDirections = [
    const Offset(0, -1), // Top
    const Offset(1, 0),  // Right
    const Offset(-1, 0), // Left
  ];

  final textDirections = [
    const Offset(0, 1),  // Bottom
    const Offset(-1, 0), // Left
    const Offset(1, 0),  // Right
  ];

  final List<Map<String, String>> pages = [
    {
      "image": "assets/images/onboarding.png",
      "title": "Live scores and ball-by-ball commentary",
    },
    {
      "image": "assets/images/onboardingone.png",
      "title": "Fastest cricket updates",
    },
    {
      "image": "assets/images/onboardingtwo.png",
      "title": "Player stats and match insights",
    },
  ];
  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 3), (_) async {

      // Exit Animation
      setState(() {
        visible = false;
        // imageOffset = const Offset(0, -1); // Image Top
        // textOffset = const Offset(0, 1);   // Text Bottom
      });

      await Future.delayed(const Duration(milliseconds: 600));

      if (!mounted) return;

      currentPage = (currentPage + 1) % pages.length;

      switch (currentPage) {
        case 0:
          imageOffset = const Offset(1, 0); // Right
          textOffset = const Offset(-1, 0); // Left
          break;

        case 1:
          imageOffset = const Offset(-1, 0); // Left
          textOffset = const Offset(1, 0); // Right
          break;

        case 2:
          imageOffset = const Offset(0, -1); // Top
          textOffset = const Offset(0, 1); // Bottom
          break;
      }

      setState(() {
        visible = true;
      });

      Future.delayed(const Duration(milliseconds: 50), () {
        if (!mounted) return;

        setState(() {
          imageOffset = Offset.zero;
          textOffset = Offset.zero;
        });
      });
    });
  }
  @override
  void dispose() {
    timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff011230),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .08),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedSlide(
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeOut,
                      offset: imageOffset,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 700),
                        opacity: visible ? 1 : 0,
                        child: Image.asset(
                          pages[currentPage]["image"]!,
                          width: width * .70,
                        ),
                      ),
                    ),
                    SizedBox(height: height * .08),
                    AnimatedSlide(
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeOut,
                      offset: textOffset,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 700),
                        opacity: visible ? 1 : 0,
                        child: Text(
                          pages[currentPage]["title"]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * .065,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: height * .06),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .08),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomeScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: height * .02),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .08),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white54),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Login Coming Soon"),
                      ),
                    );

                  },
                  child: const Text(
                    "Continue to Log In",
                  ),
                ),
              ),
            ),

            SizedBox(height: height * .03),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .08),
              child: Text(
                "By continuing, you agree to our Terms of Use and Privacy Policy.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: width * .032,
                ),
              ),
            ),

            SizedBox(height: height * .03),

          ],
        ),
      ),
    );
  }
}
