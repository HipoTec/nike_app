import 'package:flutter/material.dart';

import 'onboard_screen1.dart';
import 'onboard_screen2.dart';
import 'onboard_screen3.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _onboardingScreens = [
    OnboardingScreen(
      image: "assets/onboard/onboard1.png",
      title: "WELCOME TO \nNIKE",
      description: "Discover the best shoes for your style.",
    ),
    OnboardingScreen2(
      image: "assets/onboard/onboard2.png",
      title: "Let’s Start Journey\nWith Nike",
      description: "Smart, Gorgeous & Fashionable Collection. Explore Now",
    ),
    OnboardingScreen3(
      image: "assets/onboard/onboard3.png",
      title: "You Have the Power To",
      description:
          "There Are Many Beautiful And Attractive Plants To Your Room",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: _onboardingScreens,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          _onboardingScreens.length,
          (index) => _buildDot(index),
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    Color color = index == _currentPage ? Colors.blue : Colors.grey;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
