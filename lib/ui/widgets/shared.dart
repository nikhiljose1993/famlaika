import 'package:famlaika/app/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app/app.locator.dart';
import '../../constants/app_colors.dart';
import '../../constants/assets.gen.dart';
import '../../services/theme_service.dart';

final theme = locator<ThemeService>().theme;
final double appBarHeight = appBar().preferredSize.height;

Widget backButton({VoidCallback? onPressed, Color? backgroundColor}) {
  return Ink(
    decoration: BoxDecoration(
      color: backgroundColor,
      shape: BoxShape.circle,
    ),
    child: InkWell(
      onTap: onPressed ?? () => navigationService.back(),
      borderRadius: BorderRadius.circular(36 / 2),
      child: ClipOval(
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          height: 36,
          width: 36,
          child: Center(
            child: SvgPicture.asset(
              Assets.svg.appbarBack,
              width: 36 * 0.25,
              height: 36 * 0.25,
            ),
          ),
        ),
      ),
    ),
  );
}

PreferredSizeWidget appBar({String? title}) {
  return AppBar(
    leadingWidth: 52,
    leading: Container(
      margin: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: backButton(
        backgroundColor: Palette.lightGrey,
      ),
    ),
    title: Text(
      title ?? '',
      style: theme.textTheme.headlineLarge!.copyWith(
        fontWeight: FontWeight.w500,
      ),
    ),
    backgroundColor: Palette.scaffoldBackgroundColor,
  );
}

Widget customButton({required String buttonText, required Function onTap}) {
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

Widget genderContainer({
  required int index,
  required String svg,
  required String option,
  required bool isSelected,
  required Function onSelectionChanged,
}) {
  return GestureDetector(
    onTap: () => onSelectionChanged(index),
    child: Container(
      height: 56.spMax,
      width: 135.spMax,
      decoration: BoxDecoration(
        color:
            isSelected ? Palette.primary.withOpacity(0.1) : Palette.inputGrey,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isSelected ? Palette.primary : Palette.inputBorder,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(svg,
              theme: SvgTheme(
                  currentColor:
                      isSelected ? Palette.primary : Palette.inputBorder),
              width: 38.spMax,
              height: 38.spMax),
          const SizedBox(width: 10),
          Text(
            option,
            style: theme.textTheme.labelSmall!.copyWith(
              color: isSelected ? Palette.primary : Palette.inputFormHint,
            ),
          ),
        ],
      ),
    ),
  );
}
