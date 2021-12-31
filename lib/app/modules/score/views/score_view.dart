import 'package:computiq_academy_app/app/global/widgets/text_widget.dart';
import 'package:computiq_academy_app/app/modules/theme/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ScoreView extends StatelessWidget {
  final c = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    print('idsOfPrograms = $idsOfPrograms');
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, left: 20),
          child: textWidget(
            stringText: 'Scores',
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 35,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: idsOfPrograms.length,
            itemBuilder: (_, index) {
              return GetBuilder(
                builder: (ThemeController c) {
                  Future? cd = c.getScores(programId: idsOfPrograms[index]);
                  return FutureBuilder(
                    future: cd,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List? scores = snapshot.data['data'];
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: textWidget(
                                stringText: snapshot.data['program']['title'],
                                color: Color(0xff1A8CF7),
                                fontWeight: FontWeight.w900,
                                textAlign: TextAlign.center,
                                fontSize: 18,
                              ),
                            ),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: scores?.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  child: ListTile(
                                    contentPadding: EdgeInsets.only(
                                      right: 20,
                                      left: 20,
                                      top: 5,
                                      bottom: 5,
                                    ),
                                    title: textWidget(
                                      stringText:
                                          '${scores?[index]['user__first_name']} ${scores?[index]['user__last_name']}',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                    leading: textWidget(
                                      stringText:
                                          "${scores?[index]['user__score_profile__photo']}  #${scores?.indexOf(scores[index])}  ",
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                    trailing: textWidget(
                                      stringText: scores?[index]['total_score'],
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  elevation: 5,
                                  margin: EdgeInsets.only(
                                    top: 15,
                                    left: 25,
                                    right: 25,
                                  ),
                                  color: Color(0xffF2F2F2),
                                );
                              },
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return textWidget(
                          stringText: 'Error: ${snapshot.error}',
                        );
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
                  );
                },
              );
            },
          ),
        ),
        Container(margin: EdgeInsets.only(top: 50)),
      ],
    );
  }
}
