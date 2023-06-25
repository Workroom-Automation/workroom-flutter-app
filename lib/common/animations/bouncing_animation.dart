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

class _BouncingAnimationState extends State<BouncingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1, end: 0.95).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTap() {
    _animationController.forward();
    Timer(const Duration(milliseconds: 100), () {
      _animationController.reverse();
      if (widget.onTap != null) {
        widget.onTap!.call();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _animationController.forward();
        });
      },
      onTapCancel: () {
        setState(() {
          _animationController.reverse();
        });
      },
      onTap: _onTap,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: widget.widget,
          );
        },
      ),
    );
  }
}
