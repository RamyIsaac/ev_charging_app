import 'package:ev_charging/constants.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      backgroundColor: WidgetStateProperty.all(Colors.white),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      controller: textEditingController,
      leading: const Icon(
        Icons.search,
        color: kSecondaryColor,
      ),
      hintText: 'search location',
    );
  }
}
