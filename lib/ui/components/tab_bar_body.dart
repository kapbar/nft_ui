import 'package:flutter/material.dart';
import 'package:nft_ui/ui/home_page/home_page_model.dart';
import 'package:nft_ui/widgets/apiens_card_widget.dart';
import 'package:provider/provider.dart';

class TabBarBody extends StatelessWidget {
  const TabBarBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<HomePageScreenViewModel>();
    return Expanded(
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.width * 2.23,
          child: TabBarView(
            children: [
              Column(
                children: [
                  ApiensCardWidget(
                    price: '1.25 ETH',
                    image: 'assets/images/apiens1.jpg',
                    onTap: () => model.onTapNavigation(context),
                  ),
                  ApiensCardWidget(
                    price: '0.95 ETH',
                    image: 'assets/images/apiens2.jpg',
                    onTap: () {},
                  ),
                ],
              ),
              Column(
                children: [
                  ApiensCardWidget(
                    price: '1.25 ETH',
                    image: 'assets/images/apiens3.jpg',
                    onTap: () {},
                  ),
                  ApiensCardWidget(
                    price: '0.95 ETH',
                    image: 'assets/images/apiens4.jpg',
                    onTap: () {},
                  ),
                ],
              ),
              Column(
                children: [
                  ApiensCardWidget(
                    price: '1.25 ETH',
                    image: 'assets/images/apiens5.jpg',
                    onTap: () {},
                  ),
                  ApiensCardWidget(
                    price: '0.95 ETH',
                    image: 'assets/images/apiens6.jpg',
                    onTap: () {},
                  ),
                ],
              ),
              Column(
                children: [
                  ApiensCardWidget(
                    price: '1.25 ETH',
                    image: 'assets/images/apiens7.jpg',
                    onTap: () {},
                  ),
                  ApiensCardWidget(
                    price: '0.95 ETH',
                    image: 'assets/images/apiens8.jpg',
                    onTap: () {},
                  ),
                ],
              ),
              Column(
                children: [
                  ApiensCardWidget(
                    price: '1.25 ETH',
                    image: 'assets/images/apiens9.jpg',
                    onTap: () {},
                  ),
                  ApiensCardWidget(
                    price: '0.95 ETH',
                    image: 'assets/images/apiens10.jpg',
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
