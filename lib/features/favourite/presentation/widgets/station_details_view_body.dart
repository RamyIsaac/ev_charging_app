import 'package:ev_charging/features/enRoute/presentation/widgets/custom_backround_image.dart';
import 'package:flutter/material.dart';

class StationDetailsViewBody extends StatelessWidget {
  const StationDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CustomBackgroundImage(),
      ],
    );
  }
}
