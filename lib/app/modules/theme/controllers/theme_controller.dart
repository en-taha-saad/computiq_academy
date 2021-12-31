// ignore_for_file: unnecessary_overrides

import 'dart:io';

import 'package:computiq_academy_app/app/global/widgets/text_widget.dart';
import 'package:computiq_academy_app/app/modules/home/views/home_view.dart';
import 'package:computiq_academy_app/app/modules/login/views/login_view.dart';
import 'package:computiq_academy_app/app/modules/score/views/score_view.dart';
import 'package:computiq_academy_app/app/modules/task/views/task_view.dart';
import 'package:computiq_academy_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:computiq_academy_app/app/global/models/fetch_data_model.dart';
import 'package:dio/dio.dart';

String? photo;
String? firstName;
String? secondName;
String? email;
List<int> idsOfPrograms = [];
bool? success2;

class ThemeController extends GetxController {
  int currentIndex = 0;
  String? text = '';
  PreferredSizeWidget? appBar;
  Future<Profile?>? getProgramsVar;
  Future<Profile?>? getTasksVar;

  Future? getScoresVar;
  Widget child = HomeView();
  onTap(index) {
    currentIndex = index;
    switch (currentIndex) {
      case 0:
        child = HomeView();
        update();
        break;
      case 1:
        child = ScoreView();
        update();
        break;
      case 2:
        child = TaskView();
        update();
        break;
    }
  }

  Future<Profile?>? getPrograms() async {
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
        debugPrint('response.statusCode: ${response.statusCode}');
        text = '';
        listMyModel = Profile.fromJson(json.decode(response.toString()));
        photo = listMyModel.photo;
        firstName = listMyModel.user?.firstName;
        secondName = listMyModel.user?.lastName;
        email = listMyModel.user?.email;
        print('@@ before idsOfPrograms = $idsOfPrograms');
        // ignore: prefer_is_empty
        if (idsOfPrograms.length == 0) {
          listMyModel.course?.forEach((e) {
            idsOfPrograms.add(e.id!);
            update();
          });
          print('@@ after idsOfPrograms = $idsOfPrograms');
        }

        if (currentIndex == 0) {
          child = HomeView();
        } else if (currentIndex == 1) {
          child = ScoreView();
        } else if (currentIndex == 2) {
          child = TaskView();
        }
        success2 = true;
        update();
        return listMyModel;
      } else {
        success2 = false;
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

  Future? getScores({int? programId}) async {
    var baseUrl =
        'https://website-backend.computiq.tech/api/score/data/$programId';
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
        return json.decode(response.toString());
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
        update();
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
    getProgramsVar = getPrograms();
    super.onInit();
  }
}
