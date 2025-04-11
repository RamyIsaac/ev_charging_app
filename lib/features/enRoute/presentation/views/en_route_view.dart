import 'package:ev_charging/features/enRoute/presentation/views/widgets/en_route_view_body.dart';
import 'package:flutter/material.dart';

class EnRouteView extends StatelessWidget {
  const EnRouteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: EnRouteViewBody()),
    );
  }
}
