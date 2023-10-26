import 'package:RoJuTube/ui_utils/theme.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<AppThemeData>(AppThemeData());
}