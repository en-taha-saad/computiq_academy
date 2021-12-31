// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:computiq_academy_app/app/modules/home/views/home_view.dart';
import 'package:computiq_academy_app/app/modules/login/views/login_view.dart';
import 'package:computiq_academy_app/app/modules/program/bindings/program_binding.dart';
import 'package:computiq_academy_app/app/modules/program/views/program_view.dart';
import 'package:computiq_academy_app/app/modules/program_video/bindings/program_video_binding.dart';
import 'package:computiq_academy_app/app/modules/program_video/views/program_video_view.dart';
import 'package:computiq_academy_app/app/modules/score/views/score_view.dart';
import 'package:computiq_academy_app/app/modules/splash/views/splash_view.dart';
import 'package:computiq_academy_app/app/modules/task/views/task_view.dart';
import 'package:computiq_academy_app/app/modules/theme/bindings/theme_binding.dart';
import 'package:computiq_academy_app/app/modules/theme/views/theme_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: ThemeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: ThemeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: ThemeBinding(),
    ),
    GetPage(
      name: _Paths.PROGRAM,
      page: () => ProgramView(),
      binding: ProgramBinding(),
    ),
    GetPage(
      name: _Paths.PROGRAM_VIDEO,
      page: () => ProgramVideoView(),
      binding: ProgramVideoBinding(),
    ),
    GetPage(
      name: _Paths.SCORE,
      page: () => ScoreView(),
      binding: ThemeBinding(),
    ),
    GetPage(
      name: _Paths.TASK,
      page: () => TaskView(),
      binding: ThemeBinding(),
    ),
    GetPage(
      name: _Paths.THEME,
      page: () => ThemeView(),
      binding: ThemeBinding(),
    ),
  ];
}
