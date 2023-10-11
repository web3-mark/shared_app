import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_app/constants/constants.dart';
import 'package:shared_app/theme/theme.dart';

enum Float {
  left,
  right,
}

class AddressBox extends StatelessWidget {
  final String title;
  final String address;

  final CrossAxisAlignment align;

  get textAlign =>
      align == CrossAxisAlignment.start ? TextAlign.left : TextAlign.right;

  const AddressBox({
    super.key,
    required this.title,
    required this.address,
    this.align = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      height: 90.sp,
      width: 150.sp,
      decoration: BoxDecoration(
        color: grayColor1,
      ),
      child: Column(
        crossAxisAlignment: align,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeightExt.bold,
              fontSize: 12,
            ),
            textAlign: textAlign,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            address,
            style: const TextStyle(color: blackColor4),
            textAlign: textAlign,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
