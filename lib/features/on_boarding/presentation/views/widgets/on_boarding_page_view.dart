import 'package:ev_charging/constants.dart';
import 'package:ev_charging/core/utils/styles.dart';
import 'package:ev_charging/features/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          subtitle: 'Find your nearest charging station within your area',
          image: 'assets/images/on_boarding.png',
          backgroundImage: 'assets/images/background_image.svg',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to ',
                style: Styles.textStyle34,
              ),
              Text(
                'Charge',
                style: Styles.textStyle34.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.orange),
              ),
              Text(
                'Go',
                style: Styles.textStyle34.copyWith(
                    fontWeight: FontWeight.bold, color: kSecondaryColor),
              ),
            ],
          ),
        ),
        PageViewItem(
          subtitle:
              'Save your time by Booking your slot before you arrive, to avoid waiting in line. ',
          image: 'assets/images/on_boarding.png',
          backgroundImage: 'assets/images/background_image_mint.svg',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to ',
                style: Styles.textStyle34,
              ),
              Text(
                'Charge',
                style: Styles.textStyle34.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.orange),
              ),
              Text(
                'Go',
                style: Styles.textStyle34.copyWith(
                    fontWeight: FontWeight.bold, color: kSecondaryColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
