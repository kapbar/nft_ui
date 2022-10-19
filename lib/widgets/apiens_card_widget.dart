import 'package:flutter/material.dart';
import 'package:nft_ui/widgets/app_glass_button.dart';

class ApiensCardWidget extends StatelessWidget {
  final String image;
  final String price;
  final VoidCallback onTap;
  const ApiensCardWidget({
    Key? key,
    required this.image,
    required this.price,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(image),
          ),
          Positioned(
            top: 20,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Floor price',
                  style: TextStyle(
                    color: Colors.grey.shade200,
                    letterSpacing: 1.6,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 7,
            right: 7,
            child: AppGlassButton(
              icon: Icons.token_rounded,
            ),
          ),
          const Positioned(
            bottom: 98,
            left: 25,
            child: Text(
              'Apiens',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 7,
            left: 7,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                height: 70,
                width: 160,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Text(
                    'Distinct',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
