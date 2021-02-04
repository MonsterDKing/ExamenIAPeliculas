import 'package:get_it/get_it.dart';

import 'localstorage.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  final LocalStorageService storage = await LocalStorageService.storageInstance;

  getIt.registerSingleton<LocalStorageService>(storage);
}
