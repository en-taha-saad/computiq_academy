import 'package:computiq_academy_app/app/global/widgets/text_widget.dart';
import 'package:computiq_academy_app/app/routes/app_pages.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

final box = GetStorage();
String? mainToken = box.read('token');
bool? success;

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final bool isApiCallProcess = false;
  bool passwordVisible = false;
  bool isLoading = false;
  @override
  void initState() {
    passwordVisible = false;
    super.initState();
  }

  Future login() async {
    setState(() {
      isLoading = true;
    });
    debugPrint('emailController.text = ${emailController.text}');
    debugPrint('passwordController.text = ${passwordController.text}');
    var headers = {'Content-Type': 'application/json'};
    debugPrint('11111111111111');
    var request = http.Request(
      'POST',
      Uri.parse('https://website-backend.computiq.tech/api/academy/auth/login'),
    );
    debugPrint('2222222222222');
    request.body = json.encode({
      "email": emailController.text,
      "password": passwordController.text,
    });
    debugPrint('3333333333333');
    request.headers.addAll(headers);
    debugPrint('555555555555');

    http.StreamedResponse response = await request.send();

    debugPrint('666666666');
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(await response.stream.bytesToString());
      String? responsedtoken = responseBody['token']['access_token'];
      box.write('token', responsedtoken);
      success = true;
      isLoading = false;
      setState(() {});
      print('responsedtoken = $responsedtoken');
      Get.offNamed(Routes.THEME);
    } else {
      success = false;
      setState(() {});
      print('response.statusCode = ${response.statusCode}');
    }
  }

  // ignore: non_constant_identifier_names
  bool ValidateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xffF2F2F2),
        body: !isLoading
            ? DoubleBackToCloseApp(
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top + 40,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 45,
                              color: Color(0xff1A8CF7),
                            ),
                            SizedBox(height: 10),
                            textWidget(
                              stringText: "LOGIN",
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 35,
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 40),
                          height: 200,
                          width: 300,
                          child: SvgPicture.asset(
                            "assets/images/computiq_images/computiq-login.svg",
                          ),
                        ),
                      ),
                      SizedBox(height: 80),
                      Center(
                        child: Form(
                          key: globalFormKey,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                width: size.width * 0.8,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xff1A8CF7).withOpacity(0.7),
                                      width: 1,
                                    ),
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(
                                      Icons.email_outlined,
                                      color: Colors.black,
                                    ),
                                    hintText: "Email",
                                  ),
                                  validator: (input) => !input!.contains("@")
                                      ? "Email not Valid"
                                      : null,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 5,
                                ),
                                width: size.width * 0.8,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xff1A8CF7).withOpacity(0.7),
                                      width: 1,
                                    ),
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: passwordController,
                                  obscureText: !passwordVisible,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    border: InputBorder.none,
                                    icon: Icon(
                                      Icons.lock,
                                      color: Colors.black,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        passwordVisible = !passwordVisible;
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        passwordVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.black,
                                      ),
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Container(
                          width: 100,
                          height: 50,
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
                                offset: Offset(6, 5),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                    color: Color(0xff1A8CF7),
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (ValidateAndSave()) {
                                login().then((_) {
                                  isLoading = false;
                                  if (box.read('token') != null) {
                                    Get.toNamed(Routes.THEME);
                                  }
                                }).catchError((e) {
                                  isLoading = false;
                                  Get.snackbar(
                                    'Error',
                                    e.toString(),
                                    backgroundColor:
                                        Colors.black.withOpacity(0.5),
                                    colorText: Colors.white,
                                    borderRadius: 20,
                                    snackPosition: SnackPosition.BOTTOM,
                                    margin: EdgeInsets.all(20),
                                    borderColor: Colors.white,
                                    borderWidth: 1,
                                  );
                                });
                              }
                            },
                            child: textWidget(
                              stringText: 'LOGIN',
                              color: Color(0xff000000),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(
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
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
