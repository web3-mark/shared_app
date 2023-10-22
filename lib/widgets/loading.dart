import 'package:flutter/material.dart';
import 'package:shared_app/theme/theme.dart';

//加载提示的Widget
class LoadingWidget extends StatelessWidget {
  final String? text;
  const LoadingWidget({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
          if (text != null)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                text!,
                style: MediumText.copyWith(color: Colors.white),
              ),
            )
        ],
      ),
    );
  }
}
