import 'package:computiq_academy_app/app/global/widgets/text_widget.dart';
import 'package:computiq_academy_app/app/modules/login/views/login_view.dart';
import 'package:computiq_academy_app/app/routes/app_pages.dart';
import 'package:computiq_academy_app/main.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/theme_controller.dart';

class ThemeView extends GetView<ThemeController> {
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (ThemeController c) {
        return Scaffold(
          backgroundColor: Color(0xffF2F2F2),
          appBar: AppBar(
            backgroundColor: Color(0xffF2F2F2),
            elevation: 0,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      textWidget(
                        stringText: photo ?? '',
                        color: Color(0xff000000),
                        fontSize: 30,
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textWidget(
                            stringText:
                                '${firstName ?? ''} ${secondName ?? ''}',
                            color: Color(0xff000000),
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                          textWidget(
                            // ignore: unnecessary_string_interpolations
                            stringText: '${email ?? ''}',
                            color: Color(0xff000000),
                            fontSize: 13,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                GetBuilder(
                  builder: (ThemeController c) {
                    return TextButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            side:
                                BorderSide(color: Color(0xff1A8CF7), width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      onPressed: () {
                        mainToken = null;
                        box.remove('token');
                        Get.snackbar(
                          '',
                          '',
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Color(0xffF2F2F2),
                          borderColor: Color(0xff1A8CF7).withOpacity(0.7),
                          borderWidth: 2,
                          padding: EdgeInsets.all(10),
                          borderRadius: 15,
                          margin: EdgeInsets.all(0),
                          messageText: Container(),
                          titleText: Center(
                            child: textWidget(
                              stringText: 'Successfully logged out',
                              color: Color(0xff000000),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          snackStyle: SnackStyle.GROUNDED,
                          dismissDirection: DismissDirection.horizontal,
                        );
                        Get.offAllNamed(Routes.LOGIN);
                      },
                      child: textWidget(
                        stringText: 'logout',
                        color: Color(0xff000000),
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color(0xffF2F2F2),
            fixedColor: Color(0xffF2F2F2),
            selectedIconTheme:
                IconThemeData(color: Color(0xff1A8CF7).withOpacity(0.7)),
            unselectedIconTheme: IconThemeData(color: Color(0xffCCCCCC)),
            iconSize: 25,
            selectedFontSize: 12,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            showSelectedLabels: false,
            type: BottomNavigationBarType.fixed,
            unselectedFontSize: 12,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/icons_images/home.png'),
                  size: 24,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/icons_images/scores.png'),
                  size: 32,
                ),
                label: 'Scores',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/icons_images/tasks.png'),
                  size: 28,
                ),
                label: 'Tesks',
              ),
            ],
            currentIndex: c.currentIndex,
            onTap: c.onTap,
          ),
          body: DoubleBackToCloseApp(
            snackBar: SnackBar(
              content: textWidget(
                stringText: 'Tap back again to leave',
                color: Colors.white,
                textAlign: TextAlign.center,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: Colors.black.withOpacity(0.5),
              elevation: 0,
              dismissDirection: DismissDirection.horizontal,
              padding: EdgeInsets.all(20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: -25,
                  left: 15,
                  child: Opacity(
                    opacity: 0.1,
                    child: Image.asset(
                      'assets/images/theme_images/background_image.png',
                      height: MediaQuery.of(context).size.height - 30,
                      width: MediaQuery.of(context).size.width - 30,
                    ),
                  ),
                ),
                c.child,
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xff1A8CF7),
            onPressed: () {
              // Get.defaultDialog(
              //   title: "",
              //   middleText: "",
              //   content: Container(
              //     child: Column(
              //       children: [
              //         Form(
              //           key: globalFormKey,
              //           child: Column(
              //             children: [
              //               Container(
              //                 margin: EdgeInsets.symmetric(vertical: 10),
              //                 padding: EdgeInsets.symmetric(
              //                   horizontal: 5,
              //                   vertical: 5,
              //                 ),
              //                 width: 200,
              //                 decoration: BoxDecoration(
              //                     border: Border.all(
              //                       color: Color(0xff1A8CF7).withOpacity(0.7),
              //                       width: 1,
              //                     ),
              //                     color: Colors.white.withOpacity(0.2),
              //                     borderRadius: BorderRadius.circular(20)),
              //                 child: TextFormField(
              //                   // controller: emailController,
              //                   decoration: InputDecoration(
              //                     border: InputBorder.none,
              //                   ),
              //                 ),
              //               ),
              //               Container(
              //                 margin: EdgeInsets.symmetric(vertical: 10),
              //                 padding: EdgeInsets.symmetric(
              //                   horizontal: 5,
              //                   vertical: 5,
              //                 ),
              //                 width: 200,
              //                 decoration: BoxDecoration(
              //                   border: Border.all(
              //                     color: Color(0xff1A8CF7).withOpacity(0.7),
              //                     width: 1,
              //                   ),
              //                   color: Colors.white.withOpacity(0.2),
              //                   borderRadius: BorderRadius.circular(20),
              //                 ),
              //                 child: TextFormField(
              //                   // controller: passwordController,
              //                   decoration: InputDecoration(
              //                     hintText: "Password",
              //                     border: InputBorder.none,
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              //   confirm: ElevatedButton(
              //     style: ButtonStyle(
              //       shape: MaterialStateProperty.all(
              //         RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(20),
              //         ),
              //       ),
              //       backgroundColor: MaterialStateProperty.all(
              //         Color(0xff1A8CF7),
              //       ),
              //       padding: MaterialStateProperty.all(
              //         EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //       ),
              //     ),
              //     onPressed: () {},
              //     child: textWidget(
              //       stringText: 'Yes',
              //       color: Colors.white,
              //       textAlign: TextAlign.center,
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              //   cancel: TextButton(
              //     style: ButtonStyle(
              //       shape: MaterialStateProperty.all(
              //         RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(20),
              //           side: BorderSide(
              //             color: Color(0xff1A8CF7),
              //             width: 2,
              //           ),
              //         ),
              //       ),
              //       padding: MaterialStateProperty.all(
              //         EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //       ),
              //     ),
              //     onPressed: () {},
              //     child: textWidget(
              //       stringText: 'No',
              //       color: Colors.black,
              //       textAlign: TextAlign.center,
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // );

              Get.snackbar(
                '',
                '',
                duration: Duration(seconds: 5),
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Color(0xffF2F2F2),
                borderColor: Color(0xff1A8CF7).withOpacity(0.7),
                borderWidth: 2,
                padding: EdgeInsets.all(10),
                borderRadius: 15,
                margin: EdgeInsets.all(0),
                messageText: Center(
                  child: textWidget(
                    stringText:
                        'خدمة يمكنك من خلالها ارسال رسالة الى فريق كمبيوتك لمساعدتك',
                    color: Color(0xff000000),
                    fontSize: 15,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                titleText: Center(
                  child: textWidget(
                    stringText: 'هذه الخدمة سيتم تطويرها لاحقا',
                    color: Color(0xff000000),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                snackStyle: SnackStyle.GROUNDED,
                dismissDirection: DismissDirection.horizontal,
              );
            },
            child: Icon(
              Icons.help_outlined,
              color: Color(0xffF2F2F2),
              size: 30,
            ),
          ),
        );
      },
    );
  }
}
