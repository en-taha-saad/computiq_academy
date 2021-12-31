// ignore_for_file: unnecessary_overrides

import 'dart:convert';
import 'dart:io';

import 'package:computiq_academy_app/app/global/models/fetch_data_model.dart';
import 'package:computiq_academy_app/app/modules/login/views/login_view.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  Future<Profile?>? getTasksVar;
  String? text = '';
  Future<Profile?>? getTasks() async {
    const baseUrl = 'https://website-backend.computiq.tech/api/academy/auth/me';
    Profile? listMyModel;
    try {
      var response = await Dio().get(
        baseUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $mainToken',
          },
        ),
      );
      if (response.statusCode == 200) {
        listMyModel = Profile.fromJson(json.decode(response.toString()));
        return listMyModel;
      } else {}
    } on SocketException {
      text = 'يرجى الاتصال بالانترنت';
      update();
    } on FormatException {
      text = 'يرجى التأكد من البيانات';
      update();
    } catch (e) {
      text = 'حدث خطأ ما';
      update();
    }
  }

  @override
  void onInit() {
    getTasksVar = getTasks();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
