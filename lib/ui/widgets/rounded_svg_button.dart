import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundButtonWithSvg extends StatelessWidget {
  final String svgAssetPath;
  final Color backgroundColor;
  final double size;
  final VoidCallback onPressed;

  const RoundButtonWithSvg({
    super.key,
    required this.svgAssetPath,
    required this.backgroundColor,
    required this.size,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(size / 2),
        child: ClipOval(
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            height: size,
            width: size,
            child: Center(
              child: SvgPicture.asset(
                svgAssetPath,
                width: size * 0.25, // Adjust the SVG size as needed
                height: size * 0.25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
