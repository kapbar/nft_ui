import 'dart:ui';

import 'package:flutter/material.dart';

class AppGlassButton extends StatelessWidget {
  final IconData icon;
  const AppGlassButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(35),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.grey.shade200.withOpacity(0.5),
          ),
          child: Icon(icon, color: Colors.white),
        ),
      ),
    );
  }
}
