import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nft_ui/ui/home_page/home_page_model.dart';
import 'package:nft_ui/widgets/app_white_button.dart';
import 'package:provider/provider.dart';

class MyBottomBar extends StatelessWidget {
  const MyBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomePageScreenViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: ColoredBox(
            color: Colors.transparent.withOpacity(0.3),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: BottomNavigationBar(
                unselectedFontSize: 0,
                selectedFontSize: 0,
                currentIndex: model.currentIndex,
                onTap: (index) => model.onTapBottomSelected(index),
                unselectedItemColor: Colors.white,
                backgroundColor: Colors.transparent,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    activeIcon: AppWhiteButton(icon: Icons.home_outlined),
                    icon: Icon(Icons.home_outlined),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: AppWhiteButton(
                        icon: Icons.signal_cellular_alt_outlined),
                    icon: Icon(Icons.signal_cellular_alt_outlined),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon:
                        AppWhiteButton(icon: Icons.notifications_outlined),
                    icon: Icon(Icons.notifications_outlined),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: AppWhiteButton(icon: Icons.favorite_outline),
                    icon: Icon(Icons.favorite_outline),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: AppWhiteButton(icon: Icons.person_outline),
                    icon: Icon(Icons.person_outline),
                    label: '',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
