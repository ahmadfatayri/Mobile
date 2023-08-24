import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqlim/app/services/local_storage.dart';
import 'package:iqlim/app/util/dependency.dart';
import 'package:iqlim/presentation/app.dart';

void main() async {
  DependencyCreator.init();
  ControllerCreator.init();
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const App());
}

initServices() async {
  if (kDebugMode) {
    print('starting services ...');
  }
  await Get.putAsync(() => LocalStorageService().init());
  if (kDebugMode) {
    print('All services started...');
  }
}
