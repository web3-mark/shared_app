import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_app/skins/base.dart';

class SearchWidget extends StatefulWidget {
  final Function(String) onChange;
  const SearchWidget({super.key, required this.onChange});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController ctrl = TextEditingController();
  UniqueKey key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.sp,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
        border: Border.all(color: borderColor),
      ),
      child: FormBuilderTextField(
        key: key,
        name: "keyword",
        controller: ctrl,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(8.0),
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (value) {
          widget.onChange(value ?? "");
        },
      ),
    );
  }
}
