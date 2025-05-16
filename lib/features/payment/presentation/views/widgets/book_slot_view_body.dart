import 'dart:developer';

import 'package:ev_charging/core/models/booking_data_model.dart';
import 'package:ev_charging/core/utils/styles.dart';
import 'package:ev_charging/core/widgets/custom_button.dart';
import 'package:ev_charging/core/widgets/custom_date_picker.dart';
import 'package:ev_charging/core/widgets/custom_drop_down.dart';
import 'package:ev_charging/core/widgets/custom_price_input.dart';
import 'package:ev_charging/core/widgets/custom_time_picker.dart';

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
  final _formKey = GlobalKey<FormState>();

  String? vehicleType;
  String? vehicleModel;
  String? connectionType;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  int? price;
  bool isFullCharge = false;
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final BookingDataModel bookingDataModel = BookingDataModel(
        vehicleType: vehicleType!,
        vehicleModel: vehicleModel!,
        connectionType: connectionType!,
        date: selectedDate!,
        time: selectedTime!,
        price: price!,
        isFullCharge: isFullCharge,
      );
      // Proceed with booking
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return BlocProvider(
              create: (context) => StripePaymentCubit(PaymentRepoImpl()),
              child: PaymentMethodsBottomSheet(
                bookingDataModel: bookingDataModel,
              ),
            );
          });
    } else {
      log('Validation failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
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
              validator: (val) =>
                  val == null ? 'Please select a vehicle type' : null,
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
              onChanged: (val) => setState(
                () => vehicleModel = val,
              ),
              validator: (val) =>
                  val == null ? 'Please select a vehicle Model' : null,
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
              validator: (val) =>
                  val == null ? 'Please select a connection type' : null,
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
                  validator: (val) =>
                      val == null ? 'Please select a date' : null,
                ),
                CustomTimePicker(
                  selectedTime: selectedTime,
                  onTimeSelected: (time) => setState(() => selectedTime = time),
                  validator: (val) =>
                      val == null ? 'Please select a time' : null,
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
              onFullChargeToggle: (val) => setState(() => isFullCharge = val),
              validator: (val) {
                if (!isFullCharge && (val == null || val <= 0)) {
                  return 'Please enter a valid price';
                }
                return null;
              },
            ),
            const SizedBox(height: 100),
            CustomButton(
              text: isFullCharge ? 'Pay 100 EGP' : 'Pay $price EGP',
              textColor: Colors.white,
              onTap: () => _submitForm(),
              // showModalBottomSheet(
              //     context: context,
              //     builder: (context) {
              //       return BlocProvider(
              //         create: (context) =>
              //             StripePaymentCubit(PaymentRepoImpl()),
              //         child: const PaymentMethodsBottomSheet(),
              //       );
              //     });
            ),
          ],
        ),
      ),
    );
  }
}
