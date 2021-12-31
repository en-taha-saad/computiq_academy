// ignore_for_file: unnecessary_overrides

import 'dart:convert';
import 'dart:io';

import 'package:computiq_academy_app/app/global/models/fetch_data_model.dart';
import 'package:computiq_academy_app/app/modules/login/views/login_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgramController extends GetxController {
  Future<CourseDetails?>? getProgramVar;
  String text = '';

  Future<CourseDetails?>? getProgram({int? programId}) async {
    var baseUrl =
        'https://website-backend.computiq.tech/api/academy/data/$programId';
    CourseDetails? listMyModel;
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
        debugPrint('response.statusCode: ${response.statusCode}');
        text = '';
        listMyModel = CourseDetails.fromJson(json.decode(response.toString()));
        debugPrint(
            '@@@@@listMyModel.weeks?.length = ${listMyModel.weeks?.length}');
        update();
        return listMyModel;
      } else {
        debugPrint('response.statusCode: ${response.statusCode}');
      }
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
    getProgramVar = getProgram();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
