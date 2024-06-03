import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/app.locator.dart';
import '../../constants/app_colors.dart';
import '../../services/theme_service.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = locator<ThemeService>().theme;
    return Container(
      height: 40.sp,
      width: 328.sp,
      decoration: const BoxDecoration(
        gradient: Palette.primaryGradient,
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: TextButton(
        onPressed: () {
          onTap();
        },
        child: Text(
          buttonText,
          style: theme.textTheme.headlineSmall,
        ),
      ),
    );
  }
}
