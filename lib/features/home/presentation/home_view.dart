import 'package:ev_charging/constants.dart';
import 'package:ev_charging/core/widgets/charging_station.dart';
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

  final List<Widget> views = [
    const HomeViewBody(),
    const EnRouteView(),
    const FavouriteView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: IndexedStack(
                index: selectedIndex,
                children: views,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kSecondaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
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

//  Widget _buildBottomNavigationBar() {
//     return BottomNavigationBar(
//       selectedItemColor: kSecondaryColor,
//       unselectedItemColor: Colors.grey,
//       currentIndex: selectedIndex,
//       type: BottomNavigationBarType.fixed,
//       iconSize: 30,
//       showSelectedLabels: true,
//       showUnselectedLabels: true,
//       onTap: (value) {
//         setState(() {
//           selectedIndex = value;
//         });
//       },
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.location_pin),
//           label: 'Search',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.route_outlined),
//           label: 'En route',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.favorite_outlined),
//           label: 'Favourite',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person),
//           label: 'Profile',
//         ),
//       ],
//     );
//   }
