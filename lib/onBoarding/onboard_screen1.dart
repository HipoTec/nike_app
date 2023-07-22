import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingScreen({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue, // Replace with your desired background color
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Get the screen width and height
            double screenWidth = constraints.maxWidth;
            double screenHeight = constraints.maxHeight;

            return Container(
              width: screenWidth,
              height: screenHeight,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 50,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Stack(
                children: [
                  // Background Image
                  Positioned(
                    left: -162,
                    top: 295.20,
                    child: Transform(
                      transform: Matrix4.identity()
                        ..translate(0.0, 0.0)
                        ..rotateZ(-0.35),
                      child: Container(
                        width: 560.80,
                        height: 420.60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/onboard/onboard1.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Welcome Text
                  Positioned(
                    left: screenWidth * 0.1,
                    top: screenHeight * 0.15,
                    child: SizedBox(
                      width: screenWidth * 0.8,
                      child: Text(
                        "WELCOME TO \nNIKE",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.07,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  // Description Text
                  Positioned(
                    left: screenWidth * 0.1,
                    top: screenHeight * 0.3,
                    child: SizedBox(
                      width: screenWidth * 0.8,
                      child: Text(
                        widget.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.05,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  // Get Started Button
                  Positioned(
                    left: screenWidth * 0.1,
                    top: screenHeight * 0.9,
                    child: Container(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.07,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your 'Get Started' button functionality here
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Color(0xFF2B2B2B),
                            fontSize: screenWidth * 0.04,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
