import 'package:dartz/dartz.dart';
import 'package:ev_charging/core/entities/station_entity.dart';
import 'package:ev_charging/core/errors/failures.dart';

abstract class StationsRepo {
  Future<Either<Failure, List<StationEntity>>> getStations();
  Future<Either<Failure, List<StationEntity>>> getNearestStations();
}
