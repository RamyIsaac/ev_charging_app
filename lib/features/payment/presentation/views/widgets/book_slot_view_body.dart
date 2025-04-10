import 'package:ev_charging/core/utils/styles.dart';
import 'package:ev_charging/core/widgets/custom_button.dart';
import 'package:ev_charging/features/favourite/presentation/widgets/custom_date_picker.dart';
import 'package:ev_charging/features/favourite/presentation/widgets/custom_drop_down.dart';
import 'package:ev_charging/features/favourite/presentation/widgets/custom_price_input.dart';
import 'package:ev_charging/features/favourite/presentation/widgets/custom_time_picker.dart';
import 'package:ev_charging/features/payment/data/repos/payment_repo_impl.dart';
import 'package:ev_charging/features/payment/presentation/manager/cubit/stripe_payment_cubit.dart';
import 'package:ev_charging/features/payment/presentation/views/widgets/payment_methods_bottom_sheet.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookSlotViewBody extends StatefulWidget {
  const BookSlotViewBody({super.key});

  @override
  State<BookSlotViewBody> createState() => _BookSlotViewBodyState();
}

class _BookSlotViewBodyState extends State<BookSlotViewBody> {
  String? vehicleType;
  String? vehicleModel;
  String? connectionType;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  int? price;
  bool isFullCharge = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Vehicle Type',
            style: Styles.textStyle18,
          ),
          const SizedBox(height: 10),
          CustomDropdown(
            hintText: 'Select your vehicle type',
            items: const ['2 Wheeler', '3 Wheeler', '4 Wheeler'],
            selectedValue: vehicleType,
            onChanged: (val) => setState(() => vehicleType = val),
          ),
          const Text(
            'Vehicle Model',
            style: Styles.textStyle18,
          ),
          const SizedBox(height: 10),
          CustomDropdown(
            hintText: 'Select your vehicle model',
            items: const ['Model A', 'Model B', 'Model C'],
            selectedValue: vehicleModel,
            onChanged: (val) => setState(() => vehicleModel = val),
          ),
          const Text(
            'Connection Type',
            style: Styles.textStyle18,
          ),
          const SizedBox(height: 10),
          CustomDropdown(
            hintText: 'Select your connection type',
            items: const ['CCS2', 'CCS', 'Menekers'],
            selectedValue: connectionType,
            onChanged: (val) => setState(() => connectionType = val),
          ),
          const Text(
            'Date & Time',
            style: Styles.textStyle18,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomDatePicker(
                selectedDate: selectedDate,
                onDateSelected: (date) => setState(() => selectedDate = date),
              ),
              CustomTimePicker(
                selectedTime: selectedTime,
                onTimeSelected: (time) => setState(() => selectedTime = time),
              ),
            ],
          ),
          const Text(
            'Price',
            style: Styles.textStyle18,
          ),
          const SizedBox(height: 8),
          CustomPriceInput(
            value: price,
            isFullCharge: isFullCharge,
            onChanged: (val) => setState(() => price = val),
            onFullChargeToggle: (val) => setState(() {
              isFullCharge = val;
              if (val) price = null;
            }),
          ),
          const SizedBox(height: 100),
          CustomButton(
            text: 'Continue',
            textColor: Colors.white,
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BlocProvider(
                      create: (context) =>
                          StripePaymentCubit(PaymentRepoImpl()),
                      child: const PaymentMethodsBottomSheet(),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
