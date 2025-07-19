import 'package:get_it/get_it.dart';
import 'package:spend_tracker/src/core/data/data_source/remote/auth_api.dart';
import 'package:spend_tracker/src/core/data/repositories/auth_repository.dart';
import 'package:spend_tracker/src/core/features/auth/cubit/auth_cubit.dart';

final di = GetIt.instance;

void setup() {
  // cubits
  di
    ..registerFactory(() => AuthCubit(authRepository: di()))
    // remote data sources
    ..registerLazySingleton(() => AuthApi())
    // repositories
    ..registerLazySingleton(() => AuthRepository(authApi: di()));
}
