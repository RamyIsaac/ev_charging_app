import 'package:ev_charging/constants.dart';
import 'package:flutter/material.dart';

class CustomTimePicker extends StatelessWidget {
  final TimeOfDay? selectedTime;
  final void Function(TimeOfDay) onTimeSelected;

  const CustomTimePicker({
    super.key,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null) onTimeSelected(picked);
  }

  @override
  Widget build(BuildContext context) {
    // final now = DateTime.now();
    return GestureDetector(
      onTap: () => _selectTime(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Text(
          selectedTime != null ? selectedTime!.format(context) : 'Select time',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: selectedTime != null ? kSecondaryColor : Colors.grey),
        ),
      ),
    );
  }
}
