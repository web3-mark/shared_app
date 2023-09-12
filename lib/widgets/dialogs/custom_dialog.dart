// https://flutterawesome.com/a-dialog-queue-for-you-to-manage-your-dialogs-to-display-on-flutter-platform/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_app/skins/base.dart';

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}

class CustomDialogBox extends StatefulWidget {
  final String title, description;
  final Widget? child;
  final Function? onConfirm;
  final Function? onCancel;

  const CustomDialogBox({
    super.key,
    required this.title,
    this.description = "",
    this.child,
    this.onConfirm,
    this.onCancel,
  });

  @override
  State<CustomDialogBox> createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            // left: Constants.padding,
            top: Constants.padding,
            // right: Constants.padding,
            // bottom: Constants.padding,
          ),
          margin: const EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(Constants.padding),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 6.sp,
              ),
              Text(
                widget.description,
                style: RegularText.copyWith(
                  fontSize: 12.sp,
                  color: AppColor.text3,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 14.sp,
              ),
              if (widget.child != null) widget.child!,
              const Divider(height: 1),
              Container(
                height: 58.sp,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          if (widget.onCancel != null) {
                            widget.onCancel!();
                          } else {
                            Navigator.pop(context, false);
                          }
                        },
                        child: Text(
                          "取消".tr,
                          style: SemiBoldText.copyWith(color: AppColor.text3),
                        ),
                      ),
                    ),
                    const VerticalDivider(
                      color: borderColor,
                      thickness: 1,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          if (widget.onConfirm != null) {
                            widget.onConfirm!();
                          } else {
                            Navigator.pop(context, true);
                          }
                        },
                        child: Text(
                          "确认".tr,
                          style: SemiBoldText.copyWith(color: AppColor.primary),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
