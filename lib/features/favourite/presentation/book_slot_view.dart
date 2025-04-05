import 'package:ev_charging/features/favourite/presentation/widgets/book_slot_view_body.dart';

import 'package:flutter/material.dart';

class BookSlotView extends StatelessWidget {
  const BookSlotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Slot'),
        leading: const BackButton(),
      ),
      body: const BookSlotViewBody(),
    );
  }
}
