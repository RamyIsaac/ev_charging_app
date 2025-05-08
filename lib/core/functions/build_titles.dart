import 'package:flutter/material.dart';

Widget buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}

// Helper function to build section content
Widget buildSectionContent(String content) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12.0),
    child: Text(
      content,
      style: const TextStyle(fontSize: 16),
    ),
  );
}
