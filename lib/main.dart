import 'package:computiq_academy_app/initial_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    Phoenix(
      child: GetMaterialApp(
        title: "Computiq Academy",
        debugShowCheckedModeBanner: false,
        initialBinding: InitialBinding(),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Color(0xffF2F2F2),
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}
