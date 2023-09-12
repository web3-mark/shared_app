import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_app/state/app.dart';
import '../../utils/settings.dart';
import './authienticator.dart';
import 'package:shared_app/widgets/dialogs/custom_dialog.dart';
import 'package:shared_app/widgets/inner_box.dart';
import 'package:shared_app/widgets/input/input.dart';
import 'package:shared_app/widgets/password_visible/password_visible.dart';

class PasswordDialog extends StatefulWidget {
  final String description, title;

  PasswordDialog({
    super.key,
    required this.title,
    required this.description,
  });

  final AppController app = Get.find<AppController>();

  final Authienticator authienticator = Authienticator();

  @override
  State<PasswordDialog> createState() => _PasswordDialogState();

  Future<T?> show<T>(BuildContext context, [isPay = false]) async {
    var securePayEnabled = app.storage.read(SettingKey.payment.name) ?? false;

    if (securePayEnabled && isPay) {
      var authed = await authienticator.show();
      return authed;
    } else {
      // final res = await Get.dialog(this);
      final res = await showGeneralDialog<bool>(
        context: context,
        useRootNavigator: true,
        barrierDismissible: false,
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (ctx, __, ___) {
          return this;
        },
      );
      return res as dynamic;
    }
  }
}

class _PasswordDialogState extends State<PasswordDialog> {
  final app = Get.find<AppController>();
  TextEditingController ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomDialogBox(
      title: widget.title,
      description: widget.description,
      onConfirm: () {
        if (ctrl.text == app.password.value) {
          // close(true);
          Navigator.pop(context, true);
        } else {
          BotToast.showText(text: "密码错误".tr);
          // close(false);
        }
      },
      child: Center(
        child: FormBuilder(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: InnerBox(
                  child: PasswordVisibleWidget(
                    builder: (visible) {
                      return InputWidget(
                        controller: ctrl,
                        obscureText: visible,
                        placeholder: "请输入密码".tr,
                        name: "name",
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 45.sp),
            ],
          ),
        ),
      ),
    );
  }
}
