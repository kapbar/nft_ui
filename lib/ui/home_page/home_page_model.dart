import 'package:flutter/material.dart';
import 'package:nft_ui/ui/apiens_details/apiens_details.dart';

class HomePageScreenViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void onTapBottomSelected(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void onTapNavigation(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ApiensDetails(),
        settings: const RouteSettings(),
      ),
    );
  }
}
