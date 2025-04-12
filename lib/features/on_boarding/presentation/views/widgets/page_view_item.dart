import 'package:ev_charging/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.subtitle,
      required this.image,
      required this.backgroundImage,
      required this.title});
  final String subtitle, image, backgroundImage;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Stack(children: [
            Positioned.fill(
              child: SvgPicture.asset(
                backgroundImage,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 0,
              bottom: -210,
              left: 0,
              right: 0,
              child: Image(
                image: AssetImage(
                  image,
                ),
              ),
            ),
          ]),
        ),
        const SizedBox(
          height: 70,
        ),
        title,
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 29,
          ),
          child: Text(
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            subtitle,
            style: Styles.textStyle18
                .copyWith(color: Colors.black, fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}
