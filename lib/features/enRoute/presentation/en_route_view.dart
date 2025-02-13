import 'package:ev_charging/features/enRoute/presentation/widgets/en_route_view_body.dart';
import 'package:flutter/material.dart';

class EnRouteView extends StatelessWidget {
  const EnRouteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: EnRouteViewBody(),
      ),
    );
  }
}
