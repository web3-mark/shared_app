import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_app/state/app.dart';
import 'package:shared_app/event_bus.dart';
import 'package:shared_app/skins/base.dart';
import 'package:shared_app/utils/settings.dart';
import 'package:shared_app/utils/utils.dart';
import 'package:shared_app/widgets/box.dart';
import 'package:shared_app/widgets/button/button.dart';
import 'package:shared_app/widgets/inner_box.dart';
import 'package:shared_app/widgets/input/input.dart';
import 'package:shared_app/widgets/password_visible/password_visible.dart';
import 'package:local_auth/local_auth.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback? onImport;
  const LoginPage({super.key, this.onImport});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AppController app = Get.find();

  bool bioEnabled = false;

  final LocalAuthentication auth = LocalAuthentication();

  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    bioEnabled = app.storage.read(SettingKey.didAuthenticate.name) ?? false;
    super.initState();
  }

  startBioCheck() async {
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();

    print("can: $canAuthenticate");

    try {
      final bool didAuthenticate = await auth.authenticate(
          localizedReason: 'Please authenticate to show account balance');
      if (didAuthenticate) {
        // sendResult(true);
        eventbus.emit(Events.Unlock);
        return;
      }
    } catch (e) {
      print(e);
    }
    // sendResult(false);
  }

  sendResult(bool result) {
    Navigator.pop(context, result);
  }

  @override
  Widget build(BuildContext context) {
    bioEnabled = app.storage.read(SettingKey.didAuthenticate.name) ?? false;

    return BackgroundBox(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          // color: Colors.red,
          // decoration: ,
          // height: double.infinity,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: bioEnabled ? 60.sp : 120.sp,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.sp),
                  child: Text.rich(
                    TextSpan(
                      // text: "",
                      children: [
                        TextSpan(
                          text: "Hello".tr,
                          style: SemiBoldText.copyWith(
                            fontSize: 24.sp,
                            color: const Color(0xFF171717).withOpacity(0.7),
                          ),
                        ),
                        WidgetSpan(
                          child: SizedBox(width: 13.sp),
                        ),
                        TextSpan(
                          text: app.name.value,
                          style: SemiBoldText.copyWith(
                            fontSize: 24.sp,
                          ),
                        ),
                      ],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.sp),
                  child: Text(
                    maskString(app.address.value, 10),
                    style: SemiBoldText.copyWith(
                      color: AppColor.text1,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 26.sp,
                ),
                // 指纹识别
                if (bioEnabled)
                  BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaY: 0,
                      sigmaX: 0,
                    ),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        startBioCheck();
                      },
                      child: Container(
                        height: 206.sp,
                        margin: EdgeInsets.symmetric(horizontal: 20.sp),
                        padding: EdgeInsets.only(top: 30.sp),
                        decoration: BoxDecoration(
                          color: const Color(0xa4FFFFFF),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(0x0f, 0, 0, 0),
                              blurRadius: 15.sp,
                              offset: Offset(0, 2.sp),
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    const Image(
                                      image: AssetImage(
                                          "assets/common/finger.png"),
                                    ),
                                    SizedBox(height: 23.sp),
                                    Text(
                                      "指纹识别".tr,
                                      style: MediumText.copyWith(
                                        color: AppColor.text2,
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(width: 30.sp),
                                Padding(
                                  padding: EdgeInsets.only(top: 20.sp),
                                  child: const Text("or"),
                                ),
                                SizedBox(width: 30.sp),
                                Column(
                                  children: [
                                    const Image(
                                      image:
                                          AssetImage("assets/common/face.png"),
                                    ),
                                    SizedBox(height: 23.sp),
                                    Text(
                                      "人脸识别".tr,
                                      style: MediumText.copyWith(
                                        fontSize: 14,
                                        color: AppColor.text2,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 30.sp),
                            Text(
                              "使用生物识别".tr,
                              style: SemiBoldText.copyWith(
                                fontSize: 12,
                                color: AppColor.text1,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                SizedBox(
                  height: bioEnabled ? 25.sp : 113.sp,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.sp),
                  // height: 20.sp,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "使用密码解锁".tr,
                        style: SemiBoldText.copyWith(fontSize: 15),
                      ),
                      InnerBox(
                        height: 38.sp,
                        fillColor: Colors.white,
                        child: PasswordVisibleWidget(
                          builder: (secure) {
                            return InputWidget(
                              controller: textController,
                              height: 44.sp,
                              placeholder: "请输入密码".tr,
                              name: "password",
                              obscureText: secure,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30.sp,
                      ),
                      BlockButton(
                        gradient: true,
                        text: "解锁".tr,
                        onPressed: () {
                          if (textController.text == app.password.value) {
                            // Navigator.pop(context, true);
                            eventbus.emit(Events.Unlock);
                          } else {
                            BotToast.showText(text: "密码错误");
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.only(
                    top: 13.sp,
                  ),
                  color: const Color(0xFFEFEFEF),
                  child: SafeArea(
                    top: false,
                    // bottom: false,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 18.0.sp),
                      child: Row(
                        children: [
                          SizedBox(width: 32.sp),
                          const Image(
                            image: AssetImage("assets/common/warning.png"),
                          ),
                          SizedBox(width: 10.sp),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("忘记密码，请通过助记词重置".tr),
                              SizedBox(
                                height: 5.sp,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (widget.onImport != null) {
                                    widget.onImport!();
                                  }
                                },
                                child: Text(
                                  "导入钱包".tr,
                                  style: SemiBoldText.copyWith(
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
