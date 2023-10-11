// https://flutterawesome.com/a-dialog-queue-for-you-to-manage-your-dialogs-to-display-on-flutter-platform/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_app/skins/base.dart';

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}

class CustomDialogBoxNormal extends StatefulWidget {
  final String title, description;
  final Widget? child;
  final Function? onConfirm;
  final Function? onCancel;

  const CustomDialogBoxNormal({
    super.key,
    required this.title,
    this.description = "",
    this.child,
    this.onConfirm,
    this.onCancel,
  });

  @override
  State<CustomDialogBoxNormal> createState() => _CustomDialogBoxNormalState();
}

class _CustomDialogBoxNormalState extends State<CustomDialogBoxNormal> {
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
          width: 328,
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
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                widget.description,
                style: RegularText.copyWith(
                  fontSize: 12,
                  color: AppColor.text3,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 14,
              ),
              if (widget.child != null) widget.child!,
              const Divider(height: 1),
              Container(
                height: 58,
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
