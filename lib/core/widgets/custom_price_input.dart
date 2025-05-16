import 'package:ev_charging/constants.dart';
import 'package:flutter/material.dart';

class CustomPriceInput extends StatelessWidget {
  final int? value;
  final bool isFullCharge;
  final void Function(int) onChanged;
  final void Function(bool) onFullChargeToggle;
  final String? Function(int?)? validator;

  const CustomPriceInput({
    super.key,
    required this.value,
    required this.isFullCharge,
    required this.onChanged,
    required this.onFullChargeToggle,
    this.validator,
  });

  void _showPriceModal(BuildContext context, void Function(int) onChanged) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => _PriceSelectorBottomSheet(
        value: value ?? 10,
        isFullCharge: isFullCharge,
        onChanged: onChanged,
        onFullChargeToggle: onFullChargeToggle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormField<int>(
      validator: validator,
      builder: (field) {
        final displayText =
            isFullCharge ? 'Full Charge' : 'EGP ${value?.toString() ?? ''}';

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _showPriceModal(context, (val) {
                onChanged(val);
                field.didChange(val); // Update form state
              }),
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color:
                          field.hasError ? Colors.red : Colors.grey.shade300),
                ),
                child: Text(
                  displayText,
                  style: TextStyle(
                    color: value != null || isFullCharge
                        ? Colors.black
                        : Colors.grey,
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

class _PriceSelectorBottomSheet extends StatefulWidget {
  final int value;
  final bool isFullCharge;
  final void Function(int) onChanged;
  final void Function(bool) onFullChargeToggle;

  const _PriceSelectorBottomSheet({
    required this.value,
    required this.isFullCharge,
    required this.onChanged,
    required this.onFullChargeToggle,
  });

  @override
  State<_PriceSelectorBottomSheet> createState() =>
      _PriceSelectorBottomSheetState();
}

class _PriceSelectorBottomSheetState extends State<_PriceSelectorBottomSheet> {
  late int price;
  late bool fullCharge;

  @override
  void initState() {
    super.initState();
    price = widget.value;
    fullCharge = widget.isFullCharge;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SwitchListTile(
            activeColor: kSecondaryColor,
            value: fullCharge,
            title: const Text('Full Charge'),
            onChanged: (val) {
              setState(() => fullCharge = val);
              widget.onFullChargeToggle(val);
            },
          ),
          const SizedBox(height: 12),
          Opacity(
            opacity: fullCharge ? 0.5 : 1,
            child: Slider(
              activeColor: kSecondaryColor,
              value: price.toDouble(),
              min: 10,
              max: 100,
              divisions: 90,
              label: 'EGP $price',
              onChanged: fullCharge
                  ? null
                  : (val) {
                      final int newValue = val.round();
                      setState(() => price = newValue);
                      widget.onChanged(newValue);
                    },
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(kSecondaryColor),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            onPressed: () {
              if (!fullCharge) widget.onChanged(price);
              Navigator.pop(context);
            },
            child: const Text(
              'Confirm',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
