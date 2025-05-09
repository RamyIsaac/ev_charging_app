part of 'stations_cubit.dart';

@immutable
sealed class StationsState {}

final class StationsInitial extends StationsState {}

final class StationsLoading extends StationsState {}

final class StationsFailure extends StationsState {
  final String message;
  StationsFailure(this.message);
}

final class StationsSuccess extends StationsState {
  final List<StationEntity> stations;

  StationsSuccess(this.stations);
}
