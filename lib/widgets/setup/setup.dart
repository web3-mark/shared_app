import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_app/widgets/button/button.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:shared_app/constants/constants.dart';

class SetupPage extends StatelessWidget {
  final VoidCallback onCreate;
  final VoidCallback onImport;

  const SetupPage({
    super.key,
    required this.onCreate,
    required this.onImport,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage("assets/wallet/create_wallet.png")),
          const SizedBox(
            height: 23,
          ),
          Text(
            "you haven't added any wallets yet".tr,
          ).fontWeight(FontWeightExt.semibold).fontSize(16),
          const SizedBox(height: 108),
          BlockButton(text: "创建钱包".tr, onPressed: onCreate, gradient: true),
          const SizedBox(height: 35),
          BlockButton(text: "导入钱包".tr, onPressed: onImport, gradient: true),
        ],
      ),
    );
  }
}
