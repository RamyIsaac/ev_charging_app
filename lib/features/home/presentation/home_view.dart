import 'package:ev_charging/constants.dart';
import 'package:ev_charging/features/enRoute/presentation/en_route_view.dart';
import 'package:ev_charging/features/favourite/presentation/favourite_view.dart';
import 'package:ev_charging/features/home/presentation/widgets/home_view_body.dart';
import 'package:ev_charging/features/profile/presentation/profile_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  List<Widget> views = [
    const HomeViewBody(),
    const EnRouteView(),
    const FavouriteView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: views.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kSecondaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.shifting,
        iconSize: 30,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (value) => {
          setState(() {
            selectedIndex = value;
          }),
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_pin),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.route_outlined),
            label: 'En route',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outlined),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
