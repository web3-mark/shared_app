import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:shared_app/skins/base.dart';

class MnemonicInputWidget extends StatelessWidget {
  final String name;
  final TextEditingController controller = TextEditingController();

  MnemonicInputWidget({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: name,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      builder: (FormFieldState<dynamic> field) {
        return Container(
          margin: EdgeInsets.only(top: 20.sp),
          height: 110.sp,
          decoration: BoxDecoration(
            color: grayColor1,
            borderRadius: BorderRadius.circular(8),
          ),
          // height: 100,
          child: Stack(
            children: [
              FormBuilderTextField(
                name: name,
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10.sp),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                onChanged: (value) {
                  field.didChange(value);
                },
              ),
              Positioned(
                right: 21,
                bottom: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: hintColor,
                    ),
                  ),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      field.didChange("");
                      controller.clear();
                    },
                    child: Text(
                      "清除".tr,
                      style: TextStyle(
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
