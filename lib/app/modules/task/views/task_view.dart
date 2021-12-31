import 'package:computiq_academy_app/app/global/models/fetch_data_model.dart';
import 'package:computiq_academy_app/app/global/widgets/text_widget.dart';
import 'dart:io';

import 'package:computiq_academy_app/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';

class TaskView extends StatefulWidget {
  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
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
        setState(() {});

        return listMyModel;
      } else {}
    } on SocketException {
      text = 'يرجى الاتصال بالانترنت';
      setState(() {});
    } on FormatException {
      text = 'يرجى التأكد من البيانات';
      setState(() {});
    } catch (e) {
      text = 'حدث خطأ ما';
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<Profile?>? getTasksVar = getTasks();
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20, left: 20),
          child: textWidget(
            stringText: 'Tasks',
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 35,
          ),
        ),
        FutureBuilder(
          future: getTasksVar,
          builder: (_, AsyncSnapshot<Profile?> snapshot) {
            List<Course>? program = snapshot.data?.course;
            if (snapshot.hasData) {
              return Container(
                margin: EdgeInsets.only(top: 100),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: program?.length,
                  itemBuilder: (_context, index) {
                    return Container(
                      child: Column(
                        children: [
                          textWidget(
                            stringText: program?[index].title,
                            color: Color(0xff1A8CF7),
                            fontWeight: FontWeight.w900,
                            textAlign: TextAlign.center,
                            fontSize: 18,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: program?[index].tasks?.length,
                            itemBuilder: (_context, index0) {
                              String htmlText =
                                  '${(program?[index].tasks?[index0].description?.startsWith("<p><strong>Tasks:</strong></p>\r\n\r\n<hr />"))! ? (program?[index].tasks?[index0].description)?.replaceAll("<p><strong>Tasks:</strong></p>\r\n\r\n<hr />", '') : program?[index].tasks?[index0].description}';
                              /* /">
                              " rel
                              int pFrom =
                                  htmlText.indexOf('<a href="') + '<a href="'.length;
                              int pTo = htmlText.lastIndexOf('"');
                              String htmlUrls;
                              if ((program?[index]
                                      .tasks?[index0]
                                      .description?[pTo]) ==
                                  '">') {
                                debugPrint('@1');
                                pTo = htmlText.lastIndexOf('">');
                                htmlUrls = htmlText.substring(pFrom, pTo);
                                debugPrint('htmlUrls = $htmlUrls');
                              }
                              if ((program?[index]
                                      .tasks?[index0]
                                      .description?[pTo]) ==
                                  '"') {
                                debugPrint('@2');
                                pTo = htmlText.lastIndexOf('"');
                                htmlUrls = htmlText.substring(pFrom, pTo);
                                debugPrint('htmlUrls = $htmlUrls');
                              }
                              if ((program?[index]
                                      .tasks?[index0]
                                      .description?[pTo]) ==
                                  '" rel') {
                                pTo = htmlText.lastIndexOf('" rel');
                                htmlUrls = htmlText.substring(pFrom, pTo);
                                debugPrint('@3');
                                debugPrint('htmlUrls = $htmlUrls');
                              }
                              dom.Document document = htmlparser.parse(htmlText);
                              */
                              return Card(
                                color: Colors.grey[200],
                                shadowColor: Colors.grey[200],
                                margin: EdgeInsets.only(
                                  right: 30,
                                  left: 30,
                                  bottom: 10,
                                  top: 10,
                                ),
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: RoundedExpansionTile(
                                  trailing: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  childrenPadding: EdgeInsets.all(40.0),
                                  contentPadding: EdgeInsets.only(
                                    right: 30,
                                    left: 30,
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  tileColor: Colors.grey[200],
                                  visualDensity: VisualDensity.comfortable,
                                  dense: true,
                                  title: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: textWidget(
                                      stringText:
                                          program?[index].tasks?[index0].title,
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  children: [
                                    HtmlWidget(
                                      htmlText,
                                      renderMode: RenderMode.column,
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Metropolis',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      buildAsync: true,
                                      enableCaching: true,
                                      onTapUrl: (link) async {
                                        if (await canLaunch(link)) {
                                          debugPrint('link = $link');
                                          return await launch(link);
                                        } else {
                                          throw 'Could not launch $link';
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    );
                    // GetBuilder(
                    //   builder: (ThemeController c) {
                    //     return FutureBuilder(
                    //       future: c.getTasksVar,
                    //       builder: (_, AsyncSnapshot<Profile?> snapshot) {
                    //         List<Course>? program = snapshot.data?.course;
                    //         if (snapshot.hasData) {
                    //           return ;
                    //         } else if (snapshot.hasError) {
                    //           return textWidget(
                    //               stringText: 'Error: ${snapshot.error}');
                    //         } else {
                    //           return Center(
                    //             child: Lottie.asset(
                    //               'assets/images/lottie_animation/Comutiq AE.json',
                    //               height: 250.0,
                    //               width: 350,
                    //               addRepaintBoundary: true,
                    //             ),
                    //           );
                    //         }
                    //       },
                    //     );
                    //   },
                    // );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return textWidget(stringText: 'Error: ${snapshot.error}');
            } else {
              return Center(
                child: Lottie.asset(
                  'assets/images/lottie_animation/Comutiq AE.json',
                  height: 250.0,
                  width: 350,
                  addRepaintBoundary: true,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
