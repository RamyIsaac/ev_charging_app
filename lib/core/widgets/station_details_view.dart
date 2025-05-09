import 'package:ev_charging/constants.dart';
import 'package:ev_charging/core/entities/station_entity.dart';
import 'package:ev_charging/core/utils/app_router.dart';
import 'package:ev_charging/core/widgets/station_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StationDetailsView extends StatelessWidget {
  const StationDetailsView({super.key, required this.station});
  final StationEntity station;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomAppBar(),
      body: SafeArea(
          child: StationDetailsViewBody(
        station: station,
      )),
    );
  }
}

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomBottomButton(
              backgroundColor: const WidgetStatePropertyAll(kSecondaryColor),
              text: 'Book Now',
              textColor: Colors.white,
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kBookingDetailsView);
              },
            ),
            CustomBottomButton(
              text: 'Get Direction',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBottomButton extends StatelessWidget {
  const CustomBottomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
  });
  final String text;
  final void Function()? onPressed;
  final WidgetStateProperty<Color?>? backgroundColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                backgroundColor ?? const WidgetStatePropertyAll(Colors.white),
            fixedSize: WidgetStatePropertyAll(
              Size(MediaQuery.of(context).size.width * 0.4, 50),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            )),
        onPressed: onPressed,
        child: Text(text,
            style: TextStyle(color: textColor ?? Colors.black, fontSize: 16)));
  }
}
