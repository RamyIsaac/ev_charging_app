import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ev_charging/constants.dart';

class CustomDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final void Function(DateTime) onDateSelected;
  final String? Function(DateTime?)? validator;

  const CustomDatePicker({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
    this.validator,
  });

  Future<void> _selectDate(
      BuildContext context, void Function(DateTime) onChanged) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      onDateSelected(picked);
      onChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      validator: validator,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _selectDate(context, field.didChange),
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
                  selectedDate != null
                      ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                      : 'Select date',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: selectedDate != null ? kSecondaryColor : Colors.grey,
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
