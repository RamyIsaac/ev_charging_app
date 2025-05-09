import 'package:ev_charging/core/entities/station_entity.dart';

StationEntity getDummyStations() => StationEntity(
      name: 'Ev Station',
      price: 0,
      address: 'Cairo',
      imageUrl: 'assets/images/charging_day.webp',

      code: 'Ca1-002',
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
      getDummyStations(),
      getDummyStations(),
      getDummyStations(),
      getDummyStations(),
    ];
