import 'package:dartz/dartz.dart';
import 'package:ev_charging/core/entities/station_entity.dart';
import 'package:ev_charging/core/errors/failures.dart';
import 'package:ev_charging/core/models/station_model.dart';
import 'package:ev_charging/core/repos/stations_repo/stations_repo.dart';
import 'package:ev_charging/core/services/database_service.dart';
import 'package:ev_charging/core/utils/backend_end_points.dart';

class StationsRepoImpl implements StationsRepo {
  final DatabaseService databaseService;

  StationsRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, List<StationEntity>>> getStations() async {
    try {
      var data = await databaseService.getData(path: BackendEndPoints.stations)
          as List<Map<String, dynamic>>;

      List<StationEntity> stations =
          data.map((e) => StationModel.fromJson(e).toEntity()).toList();

      return Right(stations);
    } catch (e) {
      return const Left(ServerFailure('failed to get stations'));
    }
  }

  @override
  Future<Either<Failure, List<StationEntity>>> getNearestStations() async {
    try {
      var data = await databaseService.getData(
        path: BackendEndPoints.stations,
        // query: {
        //   'limit': 10,
        // },
      ) as List<Map<String, dynamic>>;
      List<StationEntity> stations =
          data.map((e) => StationModel.fromJson(e).toEntity()).toList();

      return Right(stations);
    } catch (e) {
      return const Left(ServerFailure('failed to get stations'));
    }
  }
}
