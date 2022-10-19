import 'package:flutter/material.dart';
import 'package:nft_ui/ui/components/my_app_bar.dart';
import 'package:nft_ui/ui/components/my_bottom_bar.dart';
import 'package:nft_ui/ui/components/tab_bar_body.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.grey[300],
        body: Column(
          children: [
            const MyAppBar(),
            TabBar(
              indicatorColor: const Color.fromARGB(255, 255, 102, 0),
              indicatorWeight: 3.0,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.black87,
              labelStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelColor: Colors.grey[400],
              isScrollable: true,
              tabs: const [
                Tab(child: Text('Recent')),
                Tab(child: Text('Trending')),
                Tab(child: Text('Top')),
                Tab(child: Text('Art')),
                Tab(child: Text('Fashion')),
              ],
            ),
            const TabBarBody(),
          ],
        ),
        bottomNavigationBar: const MyBottomBar(),
      ),
    );
  }
}
