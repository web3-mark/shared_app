import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_app/state/app.dart';
import 'package:shared_app/skins/base.dart';
import 'package:shared_app/common/common.dart';
import 'package:shared_app/utils/utils.dart';
import 'package:shared_app/widgets/cornerd_box.dart';
import 'package:shared_app/widgets/input/input.dart';
import 'package:shared_app/widgets/token_icon/token_icon.dart';

import '../../constants/constants.dart';

class SelectTokenWidget extends StatefulWidget {
  final Function(TokenInfo token) onChange;
  final TokenInfo current;
  const SelectTokenWidget({
    super.key,
    required this.onChange,
    required this.current,
  });

  @override
  State<SelectTokenWidget> createState() => _SelectTokenWidgetState();
}

class _SelectTokenWidgetState extends State<SelectTokenWidget> {
  // final tokens = [1];
  final app = Get.find<AppController>();

  // final
  String search = "";

  getTokens(String keyword) {
    return app.tokens.where((token) {
      String name = token.name;
      return keyword.isNotEmpty
          ? name.toLowerCase().contains(keyword.toLowerCase())
          : true;
    }).toList();
  }

  showTokenList() {
    print('search $search');
    TextEditingController controller = TextEditingController(text: search);

    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0.sp),
        ),
      ),
      context: context,
      // shape: SHABO,
      builder: (context) {
        List tokens = getTokens(search);

        return StatefulBuilder(
          builder: (context, setState) {
            return CorneredBox(
              child: Column(
                children: [
                  AppBar(
                    title: Text(
                      "选择通证".tr,
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    automaticallyImplyLeading: false,
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.close,
                          color: blackColor1,
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 40.sp,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.sp),
                      border: Border.all(color: borderColor),
                    ),
                    child: InputWidget(
                      name: "keyword",
                      raidus: 20,
                      controller: controller,
                      inputDecoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(8.0),
                        prefixIcon: Icon(Icons.search),
                      ),
                      onChange: (value) {
                        search = value;
                        tokens = getTokens(search);
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(
                    height: 380.sp,
                    child: ListView.builder(
                      itemBuilder: (context, int index) {
                        final token = tokens[index];
                        return InkWell(
                          onTap: () {
                            widget.onChange(token);
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                              right: 15.sp,
                              top: 15.sp,
                              bottom: 15.sp,
                            ),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: borderColor),
                              ),
                            ),
                            height: 95.sp,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TokenIcon(token: token),
                                SizedBox(
                                  width: 16.sp,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      token.name,
                                      style: TextStyle(
                                        height: 1.35,
                                        fontWeight: FontWeightExt.bold,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    Text("${token.balance}"),
                                    SizedBox(
                                      height: 9.sp,
                                    ),
                                    Text("${maskString(token.wallet ?? '')}")
                                  ],
                                ),
                                const Spacer(),
                                if (token.wallet == widget.current.wallet)
                                  const Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Image(
                                      image: AssetImage(
                                          "assets/common/checked_icon_round.png"),
                                    ),
                                  )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: tokens.length,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showTokenList();
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 44,
        child: Row(
          children: [
            TokenIcon(
              token: widget.current,
              size: 22,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              widget.current.name,
              style: const TextStyle(
                fontWeight: FontWeightExt.bold,
                fontSize: 14,
              ),
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_right_rounded)
          ],
        ),
      ),
    );
  }
}
