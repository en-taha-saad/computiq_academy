import 'package:cached_network_image/cached_network_image.dart';
import 'package:computiq_academy_app/app/global/models/fetch_data_model.dart';
import 'package:computiq_academy_app/app/global/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ProgramVideoView extends StatefulWidget {
  @override
  State<ProgramVideoView> createState() => _ProgramVideoViewState();
}

class _ProgramVideoViewState extends State<ProgramVideoView> {
  final Videos programData = Get.arguments;
  late YoutubePlayerController controller;
  late TextEditingController idController;
  late TextEditingController seekToController;
  Future<void>? launched;
  Future<void> launchUniversalLinkIos(String url) async {
    final bool nativeAppLaunchSucceeded = await launch(
      url,
      forceSafariVC: false,
      universalLinksOnly: true,
    );
    if (!nativeAppLaunchSucceeded) {
      await launch(
        url,
        forceSafariVC: true,
      );
    }
  }

  late PlayerState playerState;
  late YoutubeMetaData videoMetaData;
  double volume = 100;
  bool muted = false;

  bool isPlayerReady = false;
  void listener() {
    if (isPlayerReady && mounted && !controller.value.isFullScreen) {
      setState(() {
        playerState = controller.value.playerState;
        videoMetaData = controller.metadata;
      });
    }
  }

  @override
  void initState() {
    controller = YoutubePlayerController(
      initialVideoId: '${programData.videoId}',
      flags: YoutubePlayerFlags(
        mute: false,
        disableDragSeek: false,
        autoPlay: false,
        forceHD: false,
      ),
    )..addListener(listener);
    idController = TextEditingController();
    seekToController = TextEditingController();
    videoMetaData = YoutubeMetaData();
    playerState = PlayerState.unknown;
    super.initState();
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();
    idController.dispose();
    seekToController.dispose();
    super.dispose();
  }

  bool fullScreen = false;

  @override
  Widget build(BuildContext context) {
    print('programData.title = ${programData.title}');
    print('programData.videoId = ${programData.videoId}');
    return YoutubePlayerBuilder(
      onEnterFullScreen: () {
        fullScreen = true;
      },
      onExitFullScreen: () {
        fullScreen = false;
      },
      player: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Color(0xff1A8CF7),
        actionsPadding: EdgeInsets.all(20),
        aspectRatio: 16 / 9,
        liveUIColor: Color(0xff1A8CF7),
        thumbnail: CachedNetworkImage(
          imageUrl:
              "https://img.youtube.com/vi/${programData.videoId}/sddefault.jpg",
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
                  image: NetworkImage(
                    'https://img.youtube.com/vi/${programData.videoId}/sddefault.jpg',
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
                  filterQuality: FilterQuality.high,
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
                  filterQuality: FilterQuality.high,
                  image: AssetImage(
                    'assets/images/maxresdefault.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
        bottomActions: [
          CurrentPosition(),
          SizedBox(width: 10),
          ProgressBar(
            isExpanded: true,
            colors: ProgressBarColors(
              playedColor: Color(0xff1A8CF7),
              backgroundColor: Color(0xffF2F2F2),
              handleColor: Colors.white,
              bufferedColor: Color(0xff1A8CF7).withOpacity(0.2),
            ),
          ),
          SizedBox(width: 10),
          RemainingDuration(),
          FullScreenButton(),
        ],
        topActions: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                // setState(() {
                //   launched = launchUniversalLinkIos(
                //     'https://www.youtube.com/watch?v=${programData.videoId}',
                //   );
                // });
              },
              child: textWidget(
                stringText: controller.metadata.title,
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
        onReady: () => isPlayerReady = true,
      ),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: Color(0xffF2F2F2),
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xff000000),
                size: 20,
              ),
            ),
            backgroundColor: Color(0xffF2F2F2),
            elevation: 0,
            title: Container(
              margin: EdgeInsets.only(top: 7),
              child: textWidget(
                stringText: programData.title,
                color: Color(0xff000000),
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
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
                ListView(
                  children: [
                    SizedBox(height: 90),
                    Container(
                      height: 230,
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
                      ),
                      child: player,
                    ),
                    SizedBox(height: 90),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
