import 'package:famlaika/constants/app_colors.dart';
import 'package:famlaika/constants/app_strings.dart';
import 'package:famlaika/ui/tools/screen_size.dart';
import 'package:famlaika/ui/widgets/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                      padding: EdgeInsets.symmetric(horizontal: 20.spMax),
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
                                height: 40.sp,
                                decoration: BoxDecoration(
                                  color: Palette.lightGrey,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                  border: Border.all(
                                      color: Palette.inputBorder, width: 1),
                                ),
                                child: phoneNumberFieldWithCountryCodes(
                                  selectedCountry: viewModel.selectedCountry,
                                  phoneNumberEditingController:
                                      viewModel.phoneNumberEditingController,
                                  updateCountry: viewModel.updateCountry,
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
