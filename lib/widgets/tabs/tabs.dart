import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
// import 'package:shared_app/tabs.dart';

class WalletTabs extends StatefulWidget {
  /// 页面列表
  final List<Widget> pages;

  /// 图片名称, 需要放在主包内
  final List<String> names;

  /// 是否使用 curve
  final bool isCurve;

  final int defaultPage;

  final List<String>? labels;
  const WalletTabs({
    super.key,
    required this.pages,
    required this.names,
    this.isCurve = true,
    this.defaultPage = 0,
    this.labels,
  });

  @override
  State<WalletTabs> createState() => _WalletTabsState();
}

class _WalletTabsState extends State<WalletTabs> {
  late final PageController pageViewController;

  /// 当前页面
  int currentPage = 0;

  @override
  void initState() {
    currentPage = widget.defaultPage;
    pageViewController = PageController(initialPage: currentPage);
    super.initState();
  }

  _onItemTapped(int index) {
    pageViewController.jumpToPage(index);
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView(
        controller: pageViewController,
        physics: const NeverScrollableScrollPhysics(), // 禁用左右滚动
        children: widget.pages,
      ),
      extendBody: true, // 扩展body到bottombar底部
      bottomNavigationBar: ConvexAppBar.builder(
        elevation: 0,
        initialActiveIndex: currentPage,
        count: widget.names.length,
        curveSize: widget.isCurve ? null : 0,
        // top: 0,
        backgroundColor: Colors.white,
        itemBuilder: TabBuilder(names: widget.names, labels: widget.labels),
        onTap: _onItemTapped,
      ),
    );
  }
}

class TabBuilder extends DelegateBuilder {
  final List<String> names;
  final List<String>? labels;
  TabBuilder({
    required this.names,
    this.labels,
  });

  @override
  bool fixed() {
    return true;
  }

  @override
  Widget build(BuildContext context, int index, bool active) {
    String dark =
        Theme.of(context).brightness == Brightness.dark ? "_dark" : "";
    String url =
        'assets/common/${names[index]}${active ? "_active" : dark}.png';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(url),
        ),
        if (labels != null)
          Text(
            labels![index],
            style: TextStyle(
              fontSize: 10,
              color: active ? Color(0xFF4536A0) : Color(0xFF9E96D2),
              fontWeight: FontWeight.w600,
            ),
          )
      ],
    );
  }
}
