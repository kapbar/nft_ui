import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft_ui/ui/home_page/home_page_model.dart';
import 'package:nft_ui/ui/home_page/home_page_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.signikaTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.grey,
      ),
      home: ChangeNotifierProvider(
        create: (_) => HomePageScreenViewModel(),
        child: const HomePageScreen(),
      ),
    );
  }
}
