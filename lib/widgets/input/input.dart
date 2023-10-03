import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shared_app/constants/constants.dart';
import 'package:shared_app/skins/base.dart';

enum CInputType {
  underline,
  outline,
  none,
}

class InputWidget<T> extends StatefulWidget {
  final String name;

  final String? placeholder;

  final CInputType? inputType;

  final bool? multiLine;

  final double? height;

  final double indent;

  final Function(String value)? onChange;

  final TextEditingController? controller;

  final FormFieldValidator? validator;

  final bool obscureText;

  final bool showErrorText;

  final Function(bool)? onFoucusChange;

  final EdgeInsets? padding;

  final InputDecoration? inputDecoration;

  final double raidus;

  const InputWidget({
    super.key,
    this.placeholder,
    this.inputType = CInputType.outline,
    this.multiLine = false,
    this.height = 44,
    this.onChange,
    this.controller,
    this.indent = 10,
    this.validator,
    this.onFoucusChange,
    this.obscureText = false,
    this.showErrorText = true,
    this.padding,
    required this.name,
    this.inputDecoration,
    this.raidus = 4,
  });

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  FocusNode focus = FocusNode();

  UniqueKey key = UniqueKey();

  bool isFocus = false;

  late final String name = widget.name;

  @override
  void initState() {
    focus.addListener(_onFocusChange);
    super.initState();
  }

  @override
  void dispose() {
    focus.removeListener(_onFocusChange);
    focus.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      isFocus = focus.hasFocus;
    });
    if (widget.onFoucusChange != null) {
      widget.onFoucusChange!(focus.hasFocus);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: name,
      validator: widget.validator,
      builder: (FormFieldState<dynamic> field) {
        var decoration = BoxDecoration(
          borderRadius: BorderRadius.circular(widget.raidus),
          // color: Colors.green,
          border: Border.all(
            color: isFocus && widget.inputType != CInputType.none
                ? primaryColor
                : Colors.transparent,
            width: 1,
          ),
        );

        if (widget.inputType == CInputType.underline) {
          decoration = BoxDecoration(
            border: Border(
              bottom: BorderSide(color: isFocus ? primaryColor : borderColor),
            ),
          );
        }

        return Container(
          padding: widget.padding ??
              EdgeInsets.only(
                left: widget.indent,
                right: 10,
              ),
          height: widget.height,
          decoration: decoration,
          alignment: Alignment.center,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              FormBuilderTextField(
                // key: key,
                name: widget.name,
                focusNode: focus,
                controller: widget.controller,
                obscureText: widget.obscureText,
                onChanged: (value) {
                  if (widget.onChange != null) {
                    widget.onChange!(value ?? "");
                  }
                  field.didChange(value);
                },
                decoration: widget.inputDecoration ??
                    InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      isCollapsed: true,
                      contentPadding: const EdgeInsets.all(0),
                      hintText: widget.placeholder,
                      hintStyle: RegularText.copyWith(
                        fontSize: 14,
                        color: hintColor,
                      ),
                    ),
              ),
              if (field.hasError && widget.showErrorText)
                Positioned(
                  bottom: -36,
                  child: Text(
                    field.errorText ?? "",
                    style: const TextStyle(color: Colors.red),
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
