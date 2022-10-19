import 'package:flutter/material.dart';
import 'package:nft_ui/widgets/app_glass_button.dart';
import 'package:nft_ui/widgets/app_white_button.dart';
import 'package:nft_ui/widgets/curved_screen.dart';

class ApiensDetails extends StatelessWidget {
  const ApiensDetails({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> apiens = [
      'assets/images/apiens1.jpg',
      'assets/images/apiens2.jpg',
      'assets/images/apiens5.jpg',
      'assets/images/apiens9.jpg',
      'assets/images/apiens10.jpg',
    ];

    return Scaffold(
      body: Stack(
        children: [
          CurvedSplashScreen(
            screensLength: apiens.length,
            screenBuilder: (index) {
              return SplashContent(image: apiens[index]);
            },
          ),
          Positioned(
            top: 60,
            left: 21,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child:
                  const AppGlassButton(icon: Icons.arrow_back_ios_new_rounded),
            ),
          ),
          const Positioned(
            top: 145,
            left: 21,
            child: AppWhiteButton(icon: Icons.favorite_border_rounded),
          ),
        ],
      ),
    );
  }
}

class SplashContent extends StatelessWidget {
  final String image;

  const SplashContent({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(image),
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      alignment: const Alignment(-0.5, 0),
    );
  }
}
