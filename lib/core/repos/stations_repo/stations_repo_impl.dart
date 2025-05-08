import 'package:dartz/dartz.dart';
import 'package:ev_charging/core/entities/station_entity.dart';
import 'package:ev_charging/core/errors/failures.dart';
import 'package:ev_charging/core/repos/stations_repo/stations_repo.dart';
import 'package:ev_charging/core/services/database_service.dart';

class StationsRepoImpl implements StationsRepo {
  final DatabaseService databaseService;

  StationsRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, List<StationEntity>>> getStations() {}
}
