import 'package:flutter/material.dart';
import 'package:shared_app/theme/theme.dart';

enum Float {
  left,
  right,
}

class AddressBoxSmall extends StatelessWidget {
  final String title;
  final String address;

  final CrossAxisAlignment align;

  get textAlign =>
      align == CrossAxisAlignment.start ? TextAlign.left : TextAlign.right;

  const AddressBoxSmall({
    super.key,
    required this.title,
    required this.address,
    this.align = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 70,
      width: 220,
      decoration: const BoxDecoration(
        color: grayColor1,
      ),
      child: Column(
        crossAxisAlignment: align,
        children: [
          Text(
            title,
            style: BoldText.copyWith(fontSize: 12),
            textAlign: textAlign,
          ),
          const SizedBox(height: 8),
          Text(
            address,
            style: RegularText.copyWith(color: blackColor4),
            textAlign: textAlign,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
