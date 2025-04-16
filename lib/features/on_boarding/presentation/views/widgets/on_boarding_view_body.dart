import 'package:dots_indicator/dots_indicator.dart';
import 'package:ev_charging/constants.dart';
import 'package:ev_charging/core/utils/app_router.dart';
import 'package:ev_charging/core/widgets/custom_button.dart';
import 'package:ev_charging/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(
            pageController: pageController,
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            color: currentPage == 1
                ? kSecondaryColor
                : kSecondaryColor.withOpacity(0.3),
            activeColor: kSecondaryColor,
            size: const Size.square(9.0),
            //activeSize: const Size(18.0, 9.0),
            // activeShape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        const SizedBox(height: 40),
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: currentPage == 1 ? true : false,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
              text: 'Start Now',
              textColor: Colors.white,
              onTap: () {
                GoRouter.of(context).push(AppRouter.kSignInView);
              },
            ),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
