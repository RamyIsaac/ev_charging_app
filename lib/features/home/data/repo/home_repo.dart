// import 'package:dartz/dartz.dart';
// import 'package:ev_charging/core/errors/failures.dart';
// import 'package:ev_charging/core/utils/supabase_service.dart';
// import 'package:ev_charging/features/home/data/models/charging_station_model/charging_station_model.dart';

// class HomeRepo {
//   Future<Either<Failure, List<ChargingStationModel>>>
//       getChargingStations() async {
//     try {
//       var response = await SupabaseService.getData(tableName: 'chargeStations');
//       return Right(
//         response.map((e) => ChargingStationModel.fromJson(e)).toList(),
//       );
//     } on Exception catch (e) {
//       return Left(ServerFailure(e.toString()));
//     }
//   }
// }
