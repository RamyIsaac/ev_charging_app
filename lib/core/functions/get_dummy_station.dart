import 'dart:io';

import 'package:ev_charging/core/entities/station_entity.dart';

StationEntity getDummyStations() => StationEntity(
      name: 'Ev Station',
      price: 10,
      address: 'Cairo',
      imageUrl:
          'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',

      code: '1234',
      isFeatured: false,
      latitude: 30.0444,
      longitude: 31.2356,
      availableConnectors: 10,
      // chargingType: ChargingTypeEntity(),
      isAvailable: true,
      rating: '5',
      isActive: true,
      reviews: [],
      chargingType: [],
    );

List<StationEntity> getDummyStationsList() => [
      getDummyStations(),
      getDummyStations(),
      getDummyStations(),
      getDummyStations(),
    ];
