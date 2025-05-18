import 'package:get_it/get_it.dart';
import 'package:lab_nerd/repos/login_repo.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo());
}
