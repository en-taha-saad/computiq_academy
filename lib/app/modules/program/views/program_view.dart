import 'package:cached_network_image/cached_network_image.dart';
import 'package:computiq_academy_app/app/global/models/fetch_data_model.dart';
import 'package:computiq_academy_app/app/global/widgets/text_widget.dart';
import 'package:computiq_academy_app/app/modules/program/controllers/program_controller.dart';
import 'package:computiq_academy_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ProgramView extends StatefulWidget {
  @override
  State<ProgramView> createState() => _ProgramViewState();
}

class _ProgramViewState extends State<ProgramView> {
  final Course programData = Get.arguments;
  final c = Get.find<ProgramController>();

  @override
  Widget build(BuildContext context) {
    Future<CourseDetails?>? cd = c.getProgram(programId: programData.id);
    return GetBuilder(
      builder: (ProgramController c) {
        return FutureBuilder(
          future: cd,
          builder:
              (BuildContext context, AsyncSnapshot<CourseDetails?> snapshot) {
            if (snapshot.hasData) {
              List<Weeks>? weeks = snapshot.data?.weeks;
              // ignore: prefer_is_empty
              if (snapshot.data?.weeks?.length == 0) {
                return Scaffold(
                  backgroundColor: Color(0xffF2F2F2),
                  appBar: AppBar(
                    centerTitle: true,
                    leading: IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xff000000),
                        size: 17,
                      ),
                    ),
                    backgroundColor: Color(0xffF2F2F2),
                    elevation: 0,
                    title: textWidget(
                      stringText: programData.title,
                      color: Color(0xff000000),
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  body: Container(
                    margin: EdgeInsets.only(bottom: 80.0),
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: 0.1,
                          child: Image.asset(
                            'assets/images/theme_images/background_image.png',
                            height: MediaQuery.of(context).size.height - 30,
                            width: MediaQuery.of(context).size.width - 30,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 80.0),
                          child: Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 150),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/undraw_no_data_re_kwbl.svg',
                                    fit: BoxFit.cover,
                                    height: MediaQuery.of(context).size.height *
                                        0.25,
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 15.0),
                                    child: textWidget(
                                      stringText:
                                          'There is no Data for this Program right now, Please try later.',
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w900,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return DefaultTabController(
                initialIndex: 0,
                length: (weeks?.length)!,
                child: Scaffold(
                  backgroundColor: Color(0xffF2F2F2),
                  appBar: AppBar(
                    centerTitle: true,
                    leading: IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xff000000),
                        size: 17,
                      ),
                    ),
                    backgroundColor: Color(0xffF2F2F2),
                    elevation: 0,
                    title: textWidget(
                      stringText: programData.title,
                      color: Color(0xff000000),
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                    bottom: TabBar(
                      automaticIndicatorColorAdjustment: true,
                      isScrollable: true,
                      labelColor: Color(0xff1A8CF7),
                      labelPadding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 10,
                        top: 15,
                      ),
                      labelStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Metropolis',
                        color: Color(0xff1A8CF7),
                        fontWeight: FontWeight.bold,
                      ),
                      padding: EdgeInsets.only(
                        right: 20,
                        bottom: 5,
                        top: 5,
                      ),
                      overlayColor: MaterialStateProperty.all(
                        Color(0xff1A8CF7).withOpacity(0.7),
                      ),
                      unselectedLabelColor: Color(0xff8D8989),
                      unselectedLabelStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Metropolis',
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFC0B1B1),
                      ),
                      indicatorColor: Color(0xff1A8CF7),
                      indicatorPadding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 10,
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 2,
                      tabs: (weeks
                          ?.map((e) => textWidget(stringText: e.title))
                          .toList())!,
                    ),
                  ),
                  body: TabBarView(
                    children: (weeks?.map((e) {
                      return ListView.builder(
                        itemCount: e.videos?.length,
                        itemBuilder: (BuildContext context, int index) {
                          var listOfWeeks = weeks[index]
                              .videos?[index]
                              .title
                              .toString()
                              .split(' ');
                          List<String> newList = [];
                          listOfWeeks?.any((element) {
                            if (element == 'Day') {
                              newList.add(element);
                              final indexsss = listOfWeeks
                                  .indexWhere((element) => element == 'Day');
                              final indexqqq = indexsss + 1;
                              newList.add((listOfWeeks[indexqqq]));
                              return true;
                            }
                            return false;
                          });
                          String videoText = '${newList[0]} ${newList[1]}';

                          return Column(
                            children: [
                              Container(
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
                                  border: Border.all(
                                    color: Color(0xFFA1A7B3),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed(
                                      Routes.PROGRAM_VIDEO,
                                      arguments: Videos(
                                        title: videoText,
                                        videoId: e.videos?[index].videoId,
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl:
                                                "https://img.youtube.com/vi/${e.videos?[index].videoId}/sddefault.jpg",
                                            imageBuilder:
                                                (context, imageProvider) {
                                              return Container(
                                                height: 165,
                                                width: 350,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20.0),
                                                    topRight:
                                                        Radius.circular(20.0),
                                                  ),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      'https://img.youtube.com/vi/${e.videos?[index].videoId}/sddefault.jpg',
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
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20.0),
                                                    topRight:
                                                        Radius.circular(20.0),
                                                  ),
                                                  image: DecorationImage(
                                                    filterQuality:
                                                        FilterQuality.high,
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
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20.0),
                                                    topRight:
                                                        Radius.circular(20.0),
                                                  ),
                                                  image: DecorationImage(
                                                    filterQuality:
                                                        FilterQuality.high,
                                                    image: AssetImage(
                                                      'assets/images/maxresdefault.jpg',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            },
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
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 22,
                                            left: 15.1,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                textWidget(
                                                  stringText: videoText,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 18,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }).toList())!,
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return textWidget(stringText: 'Error: ${snapshot.error}');
            } else {
              return Scaffold(
                backgroundColor: Color(0xffF2F2F2),
                body: Container(
                  margin: EdgeInsets.only(bottom: 80.0),
                  child: Stack(
                    children: [
                      Center(
                        child: Opacity(
                          opacity: 0.2,
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
                          height: 250.0,
                          width: 350,
                          repeat: true,
                          addRepaintBoundary: true,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
