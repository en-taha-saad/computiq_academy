import 'package:computiq_academy_app/app/modules/login/views/login_view.dart';
import 'package:computiq_academy_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: Container(
        margin: EdgeInsets.only(bottom: 80.0),
        child: Stack(
          children: [
            Center(
              child: Opacity(
                opacity: 0.1,
                child: Image.asset(
                  'assets/images/theme_images/background_image.png',
                  height: MediaQuery.of(context).size.height - 30,
                  width: MediaQuery.of(context).size.width - 30,
                ),
              ),
            ),
            Center(
              child: Lottie.asset(
                'assets/images/lottie_animation/Comutiq AE.json',
                height: 250,
                width: 350,
                animate: true,
                onLoaded: (p0) {
                  Future.delayed(
                    Duration(seconds: 3),
                    () {
                      if (box.read('token') != null) {
                        Get.offAllNamed(Routes.THEME);
                      } else {
                        Get.offAllNamed(Routes.LOGIN);
                      }
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
