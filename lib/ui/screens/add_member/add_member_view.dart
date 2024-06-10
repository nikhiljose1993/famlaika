import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import 'package:famlaika/ui/screens/add_member/add_member_viewmodel.dart';
import 'package:famlaika/constants/app_strings.dart';
import 'package:famlaika/ui/widgets/shared.dart';

import '../../../app/app.locator.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/assets.gen.dart';
import '../../../services/theme_service.dart';

class AddMemberView extends StatelessWidget {
  const AddMemberView({super.key, required this.relation});

  final String relation;

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

    return ViewModelBuilder<AddMemberViewModel>.reactive(
      viewModelBuilder: () {
        return AddMemberViewModel();
      },
      onViewModelReady: (viewModel) {
        viewModel.initializeRelation(relation);
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: appBar(title: AppStrings.addMember, skip: viewModel.skipTo),
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 945 - appBarHeight,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.spMax),
                child: Form(
                  key: viewModel.addMemberFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(flex: 20),
                      Text(
                        AppStrings.addMemberBodyTitle,
                        style: theme.textTheme.bodySmall,
                      ),
                      const Spacer(flex: 40),
                      profilePicContainer(
                        image: viewModel.image,
                        pickImage: viewModel.pickImage,
                      ),
                      const Spacer(flex: 30),
                      Container(
                        height: 482,
                        width: 328.sw,
                        decoration: BoxDecoration(
                          color: Palette.secondaryBackground,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.spMax, vertical: 30.spMax),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(AppStrings.personAlive, style: theme.textTheme.bodySmall),
                                  const SizedBox(width: 3),
                                  Transform.scale(
                                    scale: 0.55,
                                    child: Switch.adaptive(
                                      value: viewModel.isAlive,
                                      onChanged: (value) => viewModel.isAliveChanged(context),
                                      activeColor: Palette.primary,
                                      activeTrackColor: Palette.inputFormHint,
                                      inactiveTrackColor: Palette.inputFormHint,
                                      materialTapTargetSize: MaterialTapTargetSize.padded,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(flex: 18),
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
                                    onSelectionChanged: viewModel.onGenderSelectionChanged,
                                  ),
                                  genderContainer(
                                    index: 1,
                                    svg: Assets.svg.male,
                                    option: AppStrings.male,
                                    isSelected: viewModel.selectedIndex == 1,
                                    onSelectionChanged: viewModel.onGenderSelectionChanged,
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
                                    constraints: const BoxConstraints(maxHeight: 36),
                                    enabledBorder: border,
                                    focusedBorder: border,
                                    contentPadding: contentPadding),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s'-]")),
                                ],
                                keyboardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
                              ),
                              const Spacer(flex: 20),
                              Text(
                                AppStrings.relation,
                                style: theme.textTheme.bodySmall!
                                    .copyWith(color: Palette.readOnlyText),
                              ),
                              const Spacer(flex: 14),

                              // Relation field
                              TextFormField(
                                controller: viewModel.relationController,
                                readOnly: true,
                                style: theme.textTheme.bodySmall!
                                    .copyWith(color: Palette.readOnlyText),
                                decoration: InputDecoration(
                                  constraints: const BoxConstraints(maxHeight: 36),
                                  enabledBorder: border,
                                  focusedBorder: border,
                                  contentPadding: contentPadding,
                                ),
                              ),
                              const Spacer(flex: 20),
                              Text(AppStrings.mobNo, style: theme.textTheme.bodySmall),
                              const Spacer(flex: 14),

                              // Phone number Field
                              Container(
                                height: 36,
                                decoration: BoxDecoration(
                                    color: Palette.lightGrey,
                                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                                    border: Border.all(color: Palette.inputBorder, width: 1)),
                                child: phoneNumberFieldWithCountryCodes(
                                  selectedCountry: viewModel.selectedCountry,
                                  phoneNumberEditingController:
                                      viewModel.phoneNumberEditingController,
                                  updateCountry: viewModel.updateCountry,
                                  padding: 14,
                                ),
                              ),
                              const Spacer(flex: 20),
                              Row(
                                children: [
                                  Text(AppStrings.dateOfBirth, style: theme.textTheme.bodySmall),
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
                                  constraints: const BoxConstraints(maxHeight: 36),
                                  enabledBorder: border,
                                  focusedBorder: border,
                                  contentPadding: contentPadding,
                                ),
                              ),

                              const Spacer(flex: 28),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(flex: 30),
                      customButton(
                          buttonText: AppStrings.addMember, onTap: viewModel.submitAddMember),
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
