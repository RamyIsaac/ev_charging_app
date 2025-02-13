import 'package:ev_charging/constants.dart';
import 'package:ev_charging/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/images/Designer (1).jpeg',
                  height: 50,
                  width: 50,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ramy Isaac',
                    style: TextStyle(
                        fontFamily: 'Pacifico', fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'find your nearest charging point ',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: kSecondaryColor,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
        // const Spacer(),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const CustomTextField(
                  preIcon: Icon(Icons.search),
                  label: 'Search',
                  hintText: 'search location',
                ),
              ),
              //   child: SearchBar(
              //     leading: Icon(
              //       Icons.search,
              //       size: 24,
              //     ),
              //   ),
              // ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list_rounded),
                  color: kSecondaryColor,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
