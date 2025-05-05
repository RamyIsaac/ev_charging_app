import 'package:bloc/bloc.dart';
import 'package:ev_charging/features/home/data/models/charging_station_model/charging_station_model.dart';
import 'package:ev_charging/features/home/data/repo/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'charging_station_state.dart';

class ChargingStationCubit extends Cubit<ChargingStationState> {
  ChargingStationCubit() : super(ChargingStationInitial());
  static ChargingStationCubit get(BuildContext context) =>
      BlocProvider.of(context);
  Future<void> getChargingStations() async {
    emit(ChargingStationLoading());
    var result = await HomeRepo().getChargingStations();
    result.fold((l) => emit(ChargingStationFailure(l.errMessage)),
        (r) => emit(ChargingStationSuccess(r)));
  }
}
