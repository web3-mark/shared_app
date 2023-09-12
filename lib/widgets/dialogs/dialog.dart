import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_app/state/app.dart';
import 'package:shared_app/widgets/dialogs/custom_dialog.dart';

Future showAppDialog(
  BuildContext context, {
  builder,
  required title,
  required description,
}) async {
  return showGeneralDialog(
    useRootNavigator: true,
    context: context,
    pageBuilder: builder,
  );
}

typedef CloseFunction = Function(dynamic result);

class AppConfirmDialog extends StatefulWidget {
  final String title, description;

  final Widget? child;

  final bool wrap;

  final Function(BuildContext, CloseFunction) builder;

  const AppConfirmDialog({
    super.key,
    this.child,
    this.wrap = true,
    required this.title,
    required this.description,
    required this.builder,
  });

  @override
  State<AppConfirmDialog> createState() => _AppConfirmDialogState();

  Future<T?> show<T>(BuildContext context) {
    return showGeneralDialog<T>(
      useRootNavigator: true,
      context: context,
      pageBuilder: (ctx, animation, secondaryAnimation) {
        close(value) {
          Navigator.pop(ctx, value);
        }

        if (wrap) {
          return CustomDialogBox(
            title: title,
            description: description,
            child: builder(ctx, close),
          );
        }

        return builder(ctx, close);
      },
    );
  }
}

class _AppConfirmDialogState extends State<AppConfirmDialog> {
  final app = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
