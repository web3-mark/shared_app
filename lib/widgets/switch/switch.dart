// https://github.com/oi-narendra/smart-switch
library smart_switch;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmartSwitch extends StatefulWidget {
  final SwitchSize size;
  final Color? activeColor;
  final Color? inActiveColor;
  final bool disabled;
  final bool defaultActive;
  final bool value;
  final Function(bool)? onChanged;
  final Function? onTap;
  const SmartSwitch({
    Key? key,
    this.size = SwitchSize.medium,
    this.inActiveColor,
    this.activeColor,
    this.disabled = false,
    this.defaultActive = true,
    this.value = true,
    this.onChanged,
    this.onTap,
  }) : super(key: key);

  @override
  State<SmartSwitch> createState() => _SmartSwitchState();
}

class _SmartSwitchState extends State<SmartSwitch> {
  bool _active = true;
  double _y = -0.4;
  double _opacity = 0.0;

  @override
  void initState() {
    _active = widget.defaultActive;
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _y = 0;
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width *
        0.24 *
        (widget.size == SwitchSize.small
            ? 0.9
            : widget.size == SwitchSize.medium
                ? 1
                : 1.1);
    final height = 26.0 *
        (widget.size == SwitchSize.small
            ? 0.9
            : widget.size == SwitchSize.medium
                ? 1
                : 1.1);

    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(milliseconds: 1000),
      child: AnimatedSlide(
        offset: Offset(0, _y),
        duration: const Duration(milliseconds: 1000),
        child: GestureDetector(
          onTap: () {
            if (widget.disabled) {
              if (widget.onTap != null) {
                widget.onTap!();
              }
              return;
            }

            if (widget.onChanged != null) {
              widget.onChanged!(_active);
            }

            // setState(() {
            //   _active = !_active;
            // });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.sp),
              color: widget.disabled
                  ? Colors.grey
                  : widget.value
                      ? widget.activeColor ?? Theme.of(context).primaryColor
                      : widget.inActiveColor ?? Colors.grey.shade400,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  spreadRadius: 0,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: .0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Expanded(
                      //     child: Text(
                      //   'OFF',
                      //   textAlign: TextAlign.start,
                      //   style: TextStyle(color: Colors.white),
                      // )),
                      // Expanded(
                      //   child: Text(
                      //     'ON',
                      //     textAlign: TextAlign.end,
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  duration: const Duration(milliseconds: 300),
                  alignment: widget.value
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: double.infinity,
                    width: height / 1.2,
                    child: Card(
                      clipBehavior: Clip.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum SwitchSize { small, medium, large }
