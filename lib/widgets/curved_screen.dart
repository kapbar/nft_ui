import 'dart:ui';

import 'package:flutter/material.dart';

class CurvedSplashScreen extends StatefulWidget {
  final int screensLength;
  final Widget Function(int index) screenBuilder;
  const CurvedSplashScreen({
    Key? key,
    required this.screensLength,
    required this.screenBuilder,
  }) : super(key: key);

  @override
  State<CurvedSplashScreen> createState() => _CurvedSplashScreenState();
}

class _CurvedSplashScreenState extends State<CurvedSplashScreen> {
  int currentPageIndex = 0;
  late PageController _pageController;

  @override
  Widget build(BuildContext context) {
    SizeConfig.initSize(context);
    _pageController = PageController(initialPage: 0);

    return Scaffold(
      extendBody: true,
      body: PageView.builder(
        itemCount: widget.screensLength,
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        itemBuilder: (context, index) =>
            Center(child: widget.screenBuilder(index)),
      ),
      bottomNavigationBar: CurvedSheet(
        totalPages: widget.screensLength,
        currentPage: currentPageIndex,
      ),
    );
  }
}

class CurvedSheet extends StatelessWidget {
  final int totalPages;
  final int currentPage;
  const CurvedSheet({
    Key? key,
    required this.totalPages,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 150),
              painter: NavigationPainter(),
            ),
          ),
        ),
        Positioned(
          top: -70,
          right: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: getSplashDots(totalPages, currentPage),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 4,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 255, 102, 0),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(21.0),
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Icon(Icons.token_rounded, color: Colors.pink),
                  ),
                  const SizedBox(width: 35),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Make collection bid',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        'Highest: 2.37 ETH',
                        style: TextStyle(
                          color: Colors.grey.shade200,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

List<Widget> getSplashDots(int maxLength, int selectedDot) {
  List<Widget> dots = [];
  for (int i = 0; i < maxLength; i++) {
    dots.add(
      Row(
        children: [
          Container(
            height: getRelativeHeight(0.01),
            decoration: BoxDecoration(
                color: selectedDot == i
                    ? const Color.fromARGB(255, 255, 102, 0)
                    : Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20)),
            width: selectedDot == i
                ? getRelativeWidth(0.055)
                : getRelativeWidth(0.020),
          ),
          if (i < maxLength - 1) ...[
            SizedBox(width: getRelativeWidth(0.015)),
          ]
        ],
      ),
    );
  }
  return dots;
}

class SizeConfig {
  static double screenWidth = 0;
  static double screenHeight = 0;

  static initSize(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
  }
}

double getRelativeHeight(double percentage) {
  return percentage * SizeConfig.screenHeight;
}

double getRelativeWidth(double percentage) {
  return percentage * SizeConfig.screenWidth;
}

class NavigationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.white.withOpacity(0.25);

    double offsetheight = size.height * 0.1;

    var path = Path()
      ..moveTo(0, 0)
      ..quadraticBezierTo(
        0,
        offsetheight,
        0,
        offsetheight,
      )
      ..lineTo(size.width * (2 / 6), offsetheight)
      ..quadraticBezierTo(size.width / 2, size.height * 0.50,
          size.width * (4 / 6), offsetheight)
      ..lineTo(size.width - (offsetheight), offsetheight)
      ..quadraticBezierTo(
        size.width,
        offsetheight,
        size.width,
        offsetheight,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
