import 'package:flutter/material.dart';
import 'package:ev_charging/constants.dart';

class CustomTimePicker extends StatelessWidget {
  final TimeOfDay? selectedTime;
  final void Function(TimeOfDay) onTimeSelected;
  final String? Function(TimeOfDay?)? validator;

  const CustomTimePicker({
    super.key,
    required this.selectedTime,
    required this.onTimeSelected,
    this.validator,
  });

  Future<void> _selectTime(
      BuildContext context, void Function(TimeOfDay) onChanged) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      onTimeSelected(picked);
      onChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormField<TimeOfDay>(
      validator: validator,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _selectTime(context, field.didChange),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: field.hasError ? Colors.red : Colors.grey.shade300,
                  ),
                ),
                child: Text(
                  selectedTime != null
                      ? selectedTime!.format(context)
                      : 'Select time',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: selectedTime != null ? kSecondaryColor : Colors.grey,
                  ),
                ),
              ),
            ),
            if (field.hasError)
              Text(
                field.errorText!,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
          ],
        );
      },
    );
  }
}
