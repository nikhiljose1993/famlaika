import 'package:famlaika/constants/app_colors.dart';
import 'package:famlaika/constants/app_strings.dart';
import 'package:famlaika/models/country.dart';
import 'package:famlaika/ui/tools/screen_size.dart';
import 'package:famlaika/ui/widgets/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../constants/assets.gen.dart';
import '../../../services/theme_service.dart';
import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = locator<ThemeService>().theme;
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () {
        return LoginViewModel();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: ScreenSize.height),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 409,
                    child: Assets.images.login.image(),
                  ),
                  Flexible(
                    flex: 391,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.helloLetsGetStarted,
                            style: theme.textTheme.headlineLarge,
                          ),
                          const Spacer(flex: 30),
                          Text(
                            AppStrings
                                .bringYourFamilyCloserTogetherWithFamlaika,
                            style: theme.textTheme.titleLarge,
                          ),
                          const Spacer(flex: 40),
                          Text(
                            AppStrings.enterMobileNumber,
                            style: theme.textTheme.bodySmall,
                          ),
                          const Spacer(flex: 20),
                          Form(
                            key: viewModel.loginFormKey,
                            child: Flexible(
                              flex: 233,
                              child: Container(
                                width: 328.sp,
                                height: 40.sp,
                                decoration: BoxDecoration(
                                  color: Palette.lightGrey,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                  border: Border.all(
                                      color: Palette.inputBorder, width: 1),
                                ),
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: 88,
                                      child: DropdownButtonFormField<Country>(
                                        dropdownColor:
                                            Palette.secondaryBackground,
                                        value: viewModel.selectedCountry,
                                        items: countries.map(
                                          (Country country) {
                                            return DropdownMenuItem<Country>(
                                              value: country,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: SvgPicture.asset(
                                                      country.flag,
                                                      width: 20,
                                                      height: 14,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    country.phoneCode,
                                                    style: theme
                                                        .textTheme.titleLarge,
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ).toList(),
                                        onChanged: (value) {},
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              bottom: 8, left: 10),
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                    SvgPicture.asset('assets/svg/line.svg'),
                                    Flexible(
                                      flex: 200,
                                      child: TextFormField(
                                        controller: viewModel
                                            .phoneNumberEditingController,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(10),
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        style: theme.textTheme.titleLarge,
                                        keyboardType: TextInputType.phone,
                                        decoration: InputDecoration(
                                          hintText: '000 000 0000',
                                          hintStyle: theme.textTheme.bodySmall!
                                              .copyWith(
                                                  color: Palette.opaqueGrey),
                                          contentPadding:
                                              const EdgeInsetsDirectional.only(
                                                  bottom: 8, start: 14),
                                          border: InputBorder.none,
                                          counterText: '',
                                        ),
                                        maxLength: 10,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        onChanged: (value) {
                                          viewModel.isValidMobileNumber(value);
                                        },
                                        validator: (value) {
                                          return viewModel
                                              .isValidMobileNumber(value!);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // if (viewModel.errMsg.isNotEmpty)
                          //   Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: Text(
                          //       viewModel.errMsg,
                          //       style: theme.textTheme.labelSmall!.copyWith(
                          //         color: Palette.errColor,
                          //       ),
                          //     ),
                          //   ),
                          const Spacer(flex: 91),
                          customButton(
                            buttonText: AppStrings.requestOtp,
                            onTap: viewModel.getOtp,
                          ),
                          const Spacer(flex: 42),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
