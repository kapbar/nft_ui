import 'package:flutter/material.dart';
import 'package:nft_ui/widgets/app_glass_button.dart';
import 'package:nft_ui/widgets/app_white_button.dart';
import 'package:nft_ui/widgets/curved_screen.dart';

class ApiensDetails extends StatefulWidget {
  const ApiensDetails({super.key});

  @override
  State<ApiensDetails> createState() => _ApiensDetailsState();
}

class _ApiensDetailsState extends State<ApiensDetails> {
  bool isFavoriteToggle = false;
  final List<String> apiens = [
    'assets/images/apiens1.jpg',
    'assets/images/apiens2.jpg',
    'assets/images/apiens5.jpg',
    'assets/images/apiens9.jpg',
    'assets/images/apiens10.jpg',
  ];

  @override
  Widget build(BuildContext context) {
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
          Positioned(
            top: 145,
            left: 21,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isFavoriteToggle = !isFavoriteToggle;
                });
              },
              child: isFavoriteToggle
                  ? const AppWhiteButton(icon: Icons.favorite_rounded)
                  : const AppWhiteButton(icon: Icons.favorite_border_rounded),
            ),
          ),
          Positioned(
            top: 330,
            left: 21,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Apiens',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 50,
                  ),
                ),
                Text(
                  'by Kim Limi',
                  style: TextStyle(
                    color: Colors.grey.shade200,
                    fontSize: 21,
                  ),
                ),
              ],
            ),
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
