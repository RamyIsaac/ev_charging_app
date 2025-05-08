import 'package:ev_charging/core/services/database_service.dart';
import 'package:ev_charging/core/services/firestore_service.dart';
import 'package:ev_charging/core/services/firebase_auth_service.dart';
import 'package:ev_charging/features/auth/data/repos/auth_repo_impl.dart';
import 'package:ev_charging/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
}
