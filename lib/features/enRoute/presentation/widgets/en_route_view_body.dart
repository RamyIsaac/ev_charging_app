import 'package:ev_charging/constants.dart';
import 'package:ev_charging/core/widgets/custom_button.dart';
import 'package:ev_charging/features/enRoute/presentation/widgets/custom_enroute_item.dart';
import 'package:flutter/material.dart';

class EnRouteViewBody extends StatelessWidget {
  const EnRouteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Image.asset(
              'assets/images/charging_cars.webp',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'En Route Charging Points',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomEnRouteItem(
                title: 'Pick Starting point',
                subtitle: 'the pickup address that the user will pickup from ',
              ),
              SizedBox(height: 10),
              CustomEnRouteItem(
                title: 'Pick destination point',
                subtitle: 'the address that the user will go to ',
              ),
              SizedBox(height: 40),
              CustomButton(text: 'See en route charging points'),
            ],
          ),
        ),
      ],
    );
  }
}
