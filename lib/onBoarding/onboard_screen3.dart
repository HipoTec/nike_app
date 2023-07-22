import 'package:flutter/material.dart';
import 'package:nike/authentication/login.dart';

class OnboardingScreen3 extends StatefulWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingScreen3({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<OnboardingScreen3> createState() => _OnboardingScreenState3();
}

class _OnboardingScreenState3 extends State<OnboardingScreen3> {
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
                    left: 70,
                    top: 150,
                    child: Transform(
                      transform: Matrix4.identity()
                        ..translate(0.0, 0.0)
                        ..rotateZ(0.05),
                      child: Container(
                        width: 309.32,
                        height: 183.49,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/onboard/onboard2.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Welcome Text
                  Positioned(
                    left: screenWidth * 0.1,
                    top: screenHeight * 0.6,
                    child: SizedBox(
                      width: screenWidth * 0.8,
                      child: Text(
                        "You Have the Power To",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  // Description Text
                  Positioned(
                    left: screenWidth * 0.1,
                    top: screenHeight * 0.73,
                    child: SizedBox(
                      width: screenWidth * 0.8,
                      child: Text(
                        "There Are Many Beautiful And Attractive Plants To Your Room",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
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
                      height: screenHeight * 0.06,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(
                                title: '',
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                        child: Text(
                          'Next',
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
