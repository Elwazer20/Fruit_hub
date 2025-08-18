import 'package:fruit_hup/Features/auth/data/repo/auth_repo_impl.dart';
import 'package:fruit_hup/Features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hup/core/services/firestore_service.dart';
import 'package:get_it/get_it.dart';
import '../repo/products_repo/products_repo.dart';
import '../repo/products_repo/products_repo_impl.dart';
import 'database_service.dart';
import 'firebase_auth_service.dart';

//Important note : you should register firebaseAuthService before AuthRepo use it
//By Eng Ahmed Maher Elwazer

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    firebaseAuthService: getIt<FirebaseAuthService>(),
    dateBaseService: getIt<DatabaseService>(),
  ));
  getIt.registerSingleton<ProductsRepo>(ProductsRepoImpl(
     databaseService: getIt<DatabaseService>(),
  ));
}
