import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InReviewWidget extends StatefulWidget {
  final Future Function() getRemote;
  final Widget child;
  const InReviewWidget(
      {super.key, required this.getRemote, required this.child});

  @override
  State<InReviewWidget> createState() => _InReviewWidgetState();
}

class _InReviewWidgetState extends State<InReviewWidget> {
  bool checking = false;

  /// 默认应该展示
  bool shouldShow = true;

  @override
  void initState() {
    // getVersion();
    // 查询
    super.initState();
  }

  getVersion() async {
    checking = true;
    try {
      final response = await widget.getRemote();

      shouldShow = response.data['data']['status'] == '1' ? true : false;
    } catch (e) {
      print(e);
    }
    checking = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (checking) {
      return Container(
        color: Colors.white,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    if (!shouldShow) {
      return Container(
        color: Colors.white,
        child: Center(
          child: Text("".tr),
        ),
      );
    }

    return widget.child;
  }
}
