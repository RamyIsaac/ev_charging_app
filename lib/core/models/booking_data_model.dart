import 'package:flutter/material.dart';

class BookingDataModel {
  final String vehicleType;
  final String vehicleModel;
  final String connectionType;
  final DateTime date;
  final TimeOfDay time;
  final int? price;
  final bool isFullCharge;

  BookingDataModel({
    required this.vehicleType,
    required this.vehicleModel,
    required this.connectionType,
    required this.date,
    required this.time,
    required this.price,
    required this.isFullCharge,
  });
}
