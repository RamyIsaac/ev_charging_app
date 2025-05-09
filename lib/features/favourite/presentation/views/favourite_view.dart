import 'package:ev_charging/core/widgets/favourite_view_body.dart';
import 'package:flutter/material.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: const SafeArea(child: FavouriteViewBody()),
    );
  }
}
