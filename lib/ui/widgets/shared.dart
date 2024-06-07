import 'dart:io';

import 'package:famlaika/app/app.router.dart';
import 'package:famlaika/app/utils.dart';
import 'package:famlaika/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app/app.locator.dart';
import '../../constants/app_colors.dart';
import '../../constants/assets.gen.dart';
import '../../models/country.dart';
import '../../services/theme_service.dart';

final theme = locator<ThemeService>().theme;
final double appBarHeight = appBar().preferredSize.height;

// Back button used in appbar

Widget backButton({VoidCallback? onPressed, Color? backgroundColor}) {
  return Ink(
    decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
    child: InkWell(
      onTap: onPressed ?? () => navigationService.back(),
      borderRadius: BorderRadius.circular(36 / 2),
      child: ClipOval(
        child: Container(
          decoration: const BoxDecoration(shape: BoxShape.circle),
          height: 36,
          width: 36,
          child: Center(
            child: SvgPicture.asset(Assets.svg.appbarBack, width: 36 * 0.25, height: 36 * 0.25),
          ),
        ),
      ),
    ),
  );
}

// AppBar

PreferredSizeWidget appBar({String? title, VoidCallback? skip}) {
  return AppBar(
    leadingWidth: 52,
    leading: Container(
      margin: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: backButton(backgroundColor: Palette.lightGrey),
    ),
    title: Text(
      title ?? '',
      style: theme.textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w500),
    ),
    actions: [
      if (skip != null)
        TextButton(
            onPressed: () => skip, child: Text(AppStrings.skip, style: theme.textTheme.bodySmall)),
    ],
    backgroundColor: Palette.scaffoldBackgroundColor,
  );
}

// Primary gradient custom button

Widget customButton({required String buttonText, required Function onTap}) {
  return Center(
    child: Container(
      height: 40.sp,
      width: 328.sp,
      decoration: const BoxDecoration(
        gradient: Palette.primaryGradient,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: TextButton(
        onPressed: () => onTap(),
        child: Text(buttonText, style: theme.textTheme.headlineSmall),
      ),
    ),
  );
}

// Profile pic container

Widget profilePicContainer({
  File? image,
  String? label,
  required Function pickImage,
}) {
  return Center(
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: 120.h,
          height: 120.h,
          decoration: BoxDecoration(
              border: image != null ? Border.all(color: Palette.primary) : null,
              color: Palette.lightGrey,
              shape: BoxShape.circle,
              image: image != null
                  ? DecorationImage(image: FileImage(image), fit: BoxFit.cover)
                  : null),
          child: image == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.svg.userAlt, width: 45.h, height: 45.h),
                    if (label != null) const SizedBox(height: 11),
                    if (label != null)
                      Text(
                        label,
                        style: theme.textTheme.labelSmall!.copyWith(fontSize: 12.h),
                      )
                  ],
                )
              : null,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 26.h,
            height: 26.h,
            decoration: const BoxDecoration(color: Palette.primary, shape: BoxShape.circle),
            child: IconButton(
              icon: SvgPicture.asset(Assets.svg.camera),
              padding: EdgeInsets.zero,
              onPressed: () => pickImage(),
            ),
          ),
        ),
      ],
    ),
  );
}

// Gender selecting container

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
      height: 56.dg,
      width: 135.dm,
      decoration: BoxDecoration(
        color: isSelected ? Palette.primary.withOpacity(0.1) : Palette.inputGrey,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: isSelected ? Palette.primary : Palette.inputBorder),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(svg,
              theme: SvgTheme(currentColor: isSelected ? Palette.primary : Palette.inputBorder),
              width: 38.h,
              height: 38.h),
          const SizedBox(width: 10),
          Text(
            option,
            style: theme.textTheme.labelSmall!
                .copyWith(color: isSelected ? Palette.primary : Palette.inputFormHint),
          ),
        ],
      ),
    ),
  );
}

// Family tree structure node

Widget familyTreeNode({required String label, bool? haveSelected}) {
  return SizedBox(
    width: 100.spMax,
    height: 98.spMax,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {
              if (haveSelected == null) {
                navigationService.navigateTo(
                  Routes.addMemberView,
                  arguments: AddMemberViewArguments(relation: label),
                );
              }
            },
            child: Container(
              height: 40.spMax,
              width: 100.spMax,
              decoration: BoxDecoration(
                color: Palette.inputGrey,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Palette.inputBorder),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (haveSelected == null) const Icon(Icons.add, color: Palette.foreground),
                  Text(label, style: theme.textTheme.bodySmall)
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 68.spMax,
            width: 68.spMax,
            decoration: BoxDecoration(
              color: Palette.inputGrey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(34.spMax),
                bottomRight: Radius.circular(34.spMax),
                topLeft: Radius.circular(34.spMax),
              ),
              border: Border.all(color: Palette.inputBorder),
            ),
            child: Center(
              child: SvgPicture.asset(height: 38.spMax, width: 38.spMax, Assets.svg.person),
            ),
          ),
        )
      ],
    ),
  );
}

// Phone number field with country codes

Widget phoneNumberFieldWithCountryCodes({
  required Country selectedCountry,
  required TextEditingController phoneNumberEditingController,
  required Function updateCountry,
}) {
  return Row(
    children: [
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 102),
        child: DropdownButtonFormField<Country>(
          dropdownColor: Palette.secondaryBackground,
          value: selectedCountry,
          items: countries.map(
            (Country country) {
              return DropdownMenuItem<Country>(
                value: country,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SvgPicture.asset(country.flag, width: 20, height: 14),
                    ),
                    const SizedBox(width: 10),
                    Text(country.phoneCode, style: theme.textTheme.titleLarge),
                  ],
                ),
              );
            },
          ).toList(),
          onChanged: (value) => updateCountry(value),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(bottom: 12, left: 10),
          ),
          alignment: Alignment.center,
        ),
      ),
      SvgPicture.asset('assets/svg/line.svg'),
      Flexible(
        child: TextFormField(
          controller: phoneNumberEditingController,
          inputFormatters: [
            LengthLimitingTextInputFormatter(10),
            FilteringTextInputFormatter.digitsOnly
          ],
          style: theme.textTheme.titleLarge,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: '000 000 0000',
            hintStyle: theme.textTheme.bodySmall!.copyWith(color: Palette.opaqueGrey),
            contentPadding: const EdgeInsetsDirectional.only(bottom: 14, start: 14),
            border: InputBorder.none,
            counterText: '',
          ),
          maxLength: 10,
        ),
      ),
    ],
  );
}
