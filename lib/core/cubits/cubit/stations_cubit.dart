import 'package:bloc/bloc.dart';
import 'package:ev_charging/core/entities/station_entity.dart';
import 'package:ev_charging/core/repos/stations_repo/stations_repo.dart';
import 'package:meta/meta.dart';

part 'stations_state.dart';

class StationsCubit extends Cubit<StationsState> {
  final StationsRepo stationsRepo;
  StationsCubit(this.stationsRepo) : super(StationsInitial());

  Future<void> getStations() async {
    emit(StationsLoading());
    var result = await stationsRepo.getStations();
    result.fold(
      (failure) => emit(
        StationsFailure(failure.errMessage),
      ),
      (stations) => emit(
        StationsSuccess(stations),
      ),
    );
  }
}
