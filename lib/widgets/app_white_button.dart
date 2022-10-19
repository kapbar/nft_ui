import 'package:flutter/material.dart';

class AppWhiteButton extends StatelessWidget {
  final IconData icon;
  const AppWhiteButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Icon(icon, color: const Color.fromARGB(255, 255, 102, 0)),
    );
  }
}
