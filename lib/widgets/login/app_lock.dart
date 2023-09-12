import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import './login.dart';
import 'package:shared_app/state/app.dart';
import 'package:shared_app/event_bus.dart';
import 'package:shared_app/skins/base.dart';

class AppLock extends StatefulWidget {
  final Widget child;
  const AppLock({super.key, required this.child});

  @override
  State<AppLock> createState() => _AppLockState();
}

class _AppLockState extends State<AppLock> with WidgetsBindingObserver {
  AppLifecycleState lastState = AppLifecycleState.resumed;

  DateTime? lockTime;

  bool locked = true;

  bool isPresenting = false;

  AppController app = Get.find<AppController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    startCheck();

    eventbus.on(Events.Unlock, (arg) {
      Navigator.pop(context);
      setState(() {
        locked = false;
        isPresenting = false;
      });
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  startCheck() {
    Future.delayed(
      Duration.zero,
      () => checkWalletAuth(),
    );
  }

  /// 检查钱包鉴权
  checkWalletAuth() async {
    /// 1. 上次使用时间大于300秒
    /// 2. 钱包个数小于1，或者当前钱包ID < 1
    ///
    ///
    if (app.walletCount <= 0 || isPresenting) {
      return;
    }

    if (lockTime != null) {
      int diff = DateTime.now().difference(lockTime!).inSeconds;
      if (diff < 300) {
        return;
      }
    }

    isPresenting = true;
    await showCupertinoModalPopup(
      useRootNavigator: true,
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        // 禁用左滑退出
        return WillPopScope(
          onWillPop: () async => false,
          child: const AppTheme(
            child: LoginPage(),
          ),
        );
      },
    );

    // locked = !unlock;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('state $state');
    lastState = state;
    switch (state) {
      case AppLifecycleState.resumed:
        checkWalletAuth();
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        lockTime = DateTime.now();
        break;
    }

    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child; //whatever you want
  }
}
