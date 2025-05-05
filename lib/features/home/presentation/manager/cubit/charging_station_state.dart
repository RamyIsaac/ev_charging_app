part of 'charging_station_cubit.dart';

@immutable
sealed class ChargingStationState {}

final class ChargingStationInitial extends ChargingStationState {}

final class ChargingStationLoading extends ChargingStationState {}

final class ChargingStationFailure extends ChargingStationState {
  final String message;
  ChargingStationFailure(this.message);
}

final class ChargingStationSuccess extends ChargingStationState {
  final List<ChargingStationModel> chargingStations;
  ChargingStationSuccess(this.chargingStations);
}
