import 'package:flutter/material.dart';
// import 'package:screenshot_callback/screenshot_callback.dart';
import 'package:screen_protector/screen_protector.dart';

class ProtectScreenWidget extends StatefulWidget {
  final Widget child;
  const ProtectScreenWidget({super.key, required this.child});

  @override
  State<ProtectScreenWidget> createState() => _ProtectScreenWidgetState();
}

class _ProtectScreenWidgetState extends State<ProtectScreenWidget> {
  // ScreenshotCallback screenshotCallback = ScreenshotCallback();

  @override
  void initState() {
    start();
    super.initState();
    // screenshotCallback.addListener(() {
    //   //Void funtions are implemented
    //   print('detect screenshot');
    // });
  }

  start() async {
    // For iOS only.
    _addListenerPreventScreenshot();

    // For iOS and Android
    _preventScreenshotOn();
    // _checkScreenRecording();
  }

  void _preventScreenshotOn() async =>
      await ScreenProtector.preventScreenshotOn();

  void _preventScreenshotOff() async =>
      await ScreenProtector.preventScreenshotOff();

  // 仅ios 有效
  void _addListenerPreventScreenshot() async {
    ScreenProtector.addListener(() {
      // Screenshot
      debugPrint('Screenshot:');
    }, (isCaptured) {
      // Screen Record
      debugPrint('Screen Record:');
    });
  }

  void _removeListenerPreventScreenshot() async {
    ScreenProtector.removeListener();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
    );
  }

  @override
  void dispose() {
    // screenshotCallback.dispose();

    // For iOS only.
    _removeListenerPreventScreenshot();

    // For iOS and Android
    _preventScreenshotOff();

    super.dispose();
  }
}
