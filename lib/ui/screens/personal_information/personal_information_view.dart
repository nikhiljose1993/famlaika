import 'package:famlaika/constants/app_colors.dart';
import 'package:famlaika/constants/assets.gen.dart';
import 'package:famlaika/ui/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../constants/app_strings.dart';
import '../../../services/theme_service.dart';
import '../../widgets/shared.dart';
import 'personal_information_viewmodel.dart';

class PersonalInformationView extends StatelessWidget {
  const PersonalInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = locator<ThemeService>().theme;

    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Palette.inputBorder));

    const contentPadding = EdgeInsetsDirectional.only(bottom: 8, start: 14);

    final hintStyle = theme.textTheme.bodySmall!.copyWith(
      color: Palette.inputFormHint,
    );

    return ViewModelBuilder<PersonalInformationViewModel>.reactive(
      viewModelBuilder: () {
        return PersonalInformationViewModel();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: appBar(title: AppStrings.personalInformation),
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: ScreenSize.height - ScreenSize.safeAreaVertical - appBarHeight,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.spMax),
                child: Form(
                  key: viewModel.personalInformationFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(flex: 20),
                      Text(AppStrings.enteringYourPersonalDetails,
                          style: theme.textTheme.bodySmall),
                      const Spacer(flex: 30),
                      profilePicContainer(
                        image: viewModel.image,
                        label: AppStrings.uploadPhoto,
                        pickImage: viewModel.pickImage,
                      ),
                      const Spacer(flex: 30),
                      Flexible(
                        flex: 296,
                        child: Center(
                          child: Container(
                            width: 328.sp,
                            decoration: BoxDecoration(
                              color: Palette.lightGrey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppStrings.gender, style: theme.textTheme.bodySmall),
                                  const Spacer(flex: 14),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      genderContainer(
                                        index: 0,
                                        svg: Assets.svg.female,
                                        option: AppStrings.female,
                                        isSelected: viewModel.selectedIndex == 0,
                                        onSelectionChanged: viewModel.onSelectionChanged,
                                      ),
                                      genderContainer(
                                        index: 1,
                                        svg: Assets.svg.male,
                                        option: AppStrings.male,
                                        isSelected: viewModel.selectedIndex == 1,
                                        onSelectionChanged: viewModel.onSelectionChanged,
                                      ),
                                    ],
                                  ),
                                  const Spacer(flex: 20),
                                  Text(AppStrings.fullName, style: theme.textTheme.bodySmall),
                                  const Spacer(flex: 14),

                                  // Name field
                                  TextFormField(
                                    controller: viewModel.nameController,
                                    decoration: InputDecoration(
                                      hintText: 'Enter full name',
                                      hintStyle: hintStyle,
                                      constraints: BoxConstraints(
                                        maxHeight: 36.h,
                                      ),
                                      enabledBorder: border,
                                      focusedBorder: border,
                                      contentPadding: contentPadding,
                                    ),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r"[a-zA-Z\s'-]"),
                                      ),
                                    ],
                                    keyboardType: TextInputType.name,
                                    textCapitalization: TextCapitalization.words,
                                  ),
                                  const Spacer(flex: 20),
                                  Row(
                                    children: [
                                      Text(AppStrings.dateOfBirth,
                                          style: theme.textTheme.bodySmall),
                                      Text(
                                        AppStrings.optional,
                                        style: theme.textTheme.bodySmall!.copyWith(
                                          color: Palette.inputFormHint,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(flex: 14),

                                  // DoB field
                                  TextFormField(
                                    controller: viewModel.dateController,
                                    onTap: () => viewModel.selectDate(context),
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(right: 12),
                                        child: SvgPicture.asset(Assets.svg.calender),
                                      ),
                                      suffixIconConstraints: const BoxConstraints(maxHeight: 16),
                                      hintText: 'DD/MM/YYYY',
                                      hintStyle: hintStyle,
                                      constraints: BoxConstraints(
                                        maxHeight: 36.h,
                                      ),
                                      enabledBorder: border,
                                      focusedBorder: border,
                                      contentPadding: contentPadding,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(flex: 52),
                      customButton(
                          buttonText: AppStrings.conti, onTap: viewModel.submitPersonalDetails),
                      const Spacer(flex: 40),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
