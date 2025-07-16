import 'package:get_it/get_it.dart';
import 'package:spend_tracker/src/core/features/auth/cubit/auth_cubit.dart';

final di = GetIt.instance;

void setup() {
  // cubits
  di.registerLazySingleton(() => AuthCubit());
}
