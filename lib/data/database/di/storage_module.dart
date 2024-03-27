import 'package:injectable/injectable.dart';

import '../app_storage.dart';

@module
abstract class AppStorageModule {
  @lazySingleton
  AppStorage provideAppStorage() => AppStorage();
}
