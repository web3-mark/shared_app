import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_app/constants/constants.dart'
    show Currency, FontWeightExt, defaultCurrency;
import 'package:shared_app/state/app.dart';
import 'package:shared_app/skins/base.dart';
import 'package:shared_app/utils/settings.dart';
import 'package:shared_app/utils/utils.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
// const

class BalanceExtra {
  final double price;
  final String updown;
  final double rate;

  BalanceExtra([this.price = 0.0, this.updown = "~", this.rate = 1.0]);
}

class BalanceWidget extends StatelessWidget {
  final double balance;
  final String symbol;
  final BalanceExtra extra;

  BalanceWidget({
    super.key,
    this.balance = 0,
    this.symbol = 'BNB',
    required this.extra,
  });

  final visible = true.obs;

  @override
  Widget build(BuildContext context) {
    AppController app = Get.find();
    String cur = app.storage.read(SettingKey.currency.name) ?? defaultCurrency;

    final Currency name = Currency.fromText(cur);

    return SizedBox(
      height: 66.sp,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 38.0.sp),
            child: GestureDetector(
              onTap: () {
                visible(!visible.value);
              },
              child: SizedBox(
                width: 48.sp,
                child: Image(
                  image: AssetImage(
                    visible.value
                        ? "assets/wallet/show.png"
                        : "assets/wallet/hide.png",
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 6.sp),
            constraints: BoxConstraints.loose(
              Size.fromWidth(
                190.sp,
              ),
            ),
            child: Obx(() {
              var value = dp(balance);
              var str = visible.value
                  ? value
                  : value.toString().replaceAll(RegExp(r'[0-9.]'), "*");

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$symbol≈${name.symbol} ${dp(extra.price * value * extra.rate)}",
                    style: TextStyle(
                      fontSize: 12.sp,
                      height: 2,
                      fontWeight: FontWeightExt.bold,
                    ),
                  ),
                  SizedBox(
                    height: 4.sp,
                  ),
                  Text(
                    "$str",
                    style: SemiBoldText.copyWith(
                      height: 1,
                      fontSize: 36.sp,
                    ),
                  ),
                ],
              );
            }),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${name.symbol} ${dp(extra.price * extra.rate)}",
              ).fontWeight(FontWeightExt.bold),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: extra.updown.startsWith("+") ? greenColor : errorColor,
                ),
                child: Text("${extra.updown}%").textColor(Colors.white),
              ),
              SizedBox(
                height: 9.sp,
              ),
            ],
          )
        ],
      ),
    );
  }
}
