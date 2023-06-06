import 'dart:async';

import 'package:flutter/material.dart';

class BouncingAnimation extends StatefulWidget {
  const BouncingAnimation({
    super.key,
    required this.widget,
    this.onTap,
  });
  final Widget widget;
  final VoidCallback? onTap;

  @override
  State<BouncingAnimation> createState() => _BouncingAnimationState();
}

class _BouncingAnimationState extends State<BouncingAnimation> {
  double _scale = 1;
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        setState(() {
          _scale = 0.9;
        });

        Timer(const Duration(milliseconds: 100), () {
          setState(() {
            _scale = 1.0;
          });
        });
        Timer(const Duration(milliseconds: 300), () {
          if (widget.onTap != null) {
            widget.onTap?.call();
          }
        });
      },
      // onTapCancel: () {
      //   setState(() {
      //     _scale = 1.0;
      //   });
      // },
      splashColor: Colors.transparent,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 100,
        ),
        transform: Matrix4.identity()..scale(_scale),
        child: widget.widget,
      ),
    );
  }
}
