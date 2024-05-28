import 'package:famlaika/constants/app_colors.dart';
import 'package:famlaika/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../constants/assets.gen.dart';
import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () {
        return LoginViewModel();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Column(
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
                        AppStrings.bringYourFamilyCloserTogetherWithFamlaika,
                        style: theme.textTheme.titleLarge,
                      ),
                      const Spacer(flex: 40),
                      Text(
                        AppStrings.enterMobileNumber,
                        style: theme.textTheme.bodySmall,
                      ),
                      const Spacer(flex: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          constraints: BoxConstraints(
                            maxHeight: 40.sp,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                color: Palette.inputBorder, width: 1),
                          ),
                        ),
                      ),
                      const Spacer(flex: 91),
                      Container(
                        height: 40.sp,
                        width: 328.sp,
                        decoration: const BoxDecoration(
                          gradient: Palette.primaryGradient,
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            AppStrings.requestOtp,
                            style: theme.textTheme.headlineSmall,
                          ),
                        ),
                      ),
                      const Spacer(flex: 42),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
