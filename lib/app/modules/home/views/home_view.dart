import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:computiq_academy_app/app/global/models/fetch_data_model.dart';
import 'package:computiq_academy_app/app/global/widgets/text_widget.dart';
import 'package:computiq_academy_app/app/modules/login/views/login_view.dart';
import 'package:computiq_academy_app/app/modules/theme/controllers/theme_controller.dart';
import 'package:computiq_academy_app/app/routes/app_pages.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatelessWidget {
  Widget buildProgramCard(Course? program) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 40,
        top: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xff1A8CF7).withOpacity(0.7),
            offset: Offset(10, 9),
          ),
        ],
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Color(0xFFA1A7B3),
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.PROGRAM, arguments: program);
        },
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      "https://website-backend.computiq.tech/${program?.image}",
                  filterQuality: FilterQuality.low,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      height: 165,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        image: DecorationImage(
                          filterQuality: FilterQuality.low,
                          image: CachedNetworkImageProvider(
                            'https://website-backend.computiq.tech/${program?.image}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  placeholder: (context, url) {
                    return Container(
                      height: 165,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        image: DecorationImage(
                          filterQuality: FilterQuality.low,
                          image: AssetImage(
                            'assets/images/maxresdefault.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return Container(
                      height: 165,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        image: DecorationImage(
                          filterQuality: FilterQuality.low,
                          image: AssetImage(
                            'assets/images/maxresdefault.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(0, -2),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 20,
                  child: textWidget(
                    stringText: program?.title ?? '',
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  height: 65,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 25,
                    left: 15,
                    right: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          textWidget(
                            stringText: 'Duration ${program?.duration}',
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 15,
                          ),
                          SizedBox(width: 10),
                          textWidget(
                            stringText: 'weeks',
                            color: Color(0xff7E7E7E),
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                          ),
                        ],
                      ),
                      textWidget(
                        stringText: '${program?.level}',
                        color: Color(0xff7E7E7E),
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProgramsList(List<Course>? program) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget(
                stringText: 'Home Feed',
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 35,
              ),
              textWidget(
                stringText: 'Enrolled Programs',
                color: Colors.black,
                fontSize: 25,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 100),
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (_context, index) => buildProgramCard(program?[index]),
            itemCount: program?.length,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('''
              @@@000
              success = $success
              success2 = $success2
              ''');

    return GetBuilder(
      autoRemove: false,
      builder: (ThemeController c) {
        return FutureBuilder(
          future: c.getProgramsVar,
          builder: (BuildContext context, AsyncSnapshot<Profile?> snapshot) {
            debugPrint('''
              @@@111
              success = $success
              success2 = $success2
              ''');

            if (snapshot.hasData) {
              return buildProgramsList(snapshot.data?.course);
            } else if (snapshot.hasError) {
              return textWidget(stringText: 'Error: ${snapshot.error}');
            } else {
              return Center(
                child: Lottie.asset(
                  'assets/images/lottie_animation/Comutiq AE.json',
                  height: 250.0,
                  width: 350,
              //     onLoaded: (_) {
              //       debugPrint('''
              // @@@222
              // success = $success
              // success2 = $success2
              // ''');
              //       if (!snapshot.hasData &&
              //           success == true &&
              //           success2 == true) {
              //         Get.defaultDialog(
              //           barrierDismissible: false,
              //           title: 'خلل',
              //           titleStyle: TextStyle(
              //             fontSize: 20,
              //             fontWeight: FontWeight.w900,
              //           ),
              //           content: textWidget(
              //             stringText:
              //                 'ربما اتصال الانترنت ضعيف او حدث خلل ما يرجى اعادة تشغيل التطبيق',
              //             fontSize: 15,
              //             textAlign: TextAlign.center,
              //           ),
              //           actions: [
              //             TextButton(
              //               child: textWidget(
              //                 stringText: 'اعادة تشغيل التطبيق',
              //               ),
              //               onPressed: () {
              //                 Get.back();
              //                 // SystemNavigator.pop();
              //                 exit(0);
              //               },
              //             ),
              //           ],
              //         );
              //       }
              //     },
                ),
              );
            }
          },
        );
      },
    );
  }
}
