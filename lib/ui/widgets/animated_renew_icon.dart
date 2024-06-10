import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import '../../constants/app_colors.dart';
import '../../constants/assets.gen.dart';

class RotatingRenew extends StatefulWidget {
  final VoidCallback generateCode;

  const RotatingRenew({required this.generateCode, super.key});

  @override
  _RotatingRenewState createState() => _RotatingRenewState();
}

class _RotatingRenewState extends State<RotatingRenew> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    widget.generateCode();

    _controller.forward(from: 0.0);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
            angle: _controller.value * 2 * math.pi,
            child: SvgPicture.asset(
              Assets.svg.renew,
              theme: const SvgTheme(currentColor: Palette.foreground),
            ),
          );
        },
      ),
    );
  }
}
