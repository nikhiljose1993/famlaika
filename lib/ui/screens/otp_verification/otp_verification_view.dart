import 'package:famlaika/constants/app_colors.dart';
import 'package:famlaika/constants/app_strings.dart';
import 'package:famlaika/ui/screens/otp_verification/otp_verification_viewmodel.dart';
import 'package:famlaika/ui/tools/screen_size.dart';
import 'package:famlaika/ui/widgets/custom_button.dart';
import 'package:famlaika/ui/widgets/otp_input.dart';
import 'package:famlaika/ui/widgets/rounded_svg_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../constants/assets.gen.dart';
import '../../../services/theme_service.dart';

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = locator<ThemeService>().theme;

    return ViewModelBuilder<OtpVerificationViewModel>.reactive(
      viewModelBuilder: () {
        return OtpVerificationViewModel();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
              child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: ScreenSize.height),
            child: Column(
              children: [
                Flexible(
                  // flex: 480,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 169,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(flex: 20),
                              Row(
                                children: [
                                  RoundButtonWithSvg(
                                    svgAssetPath: Assets.svg.appbarBack,
                                    backgroundColor: Palette.lightGrey,
                                    size: 36,
                                    onPressed: () {
                                      viewModel.goBack();
                                    },
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    AppStrings.otpVerification,
                                    style: theme.textTheme.headlineLarge!
                                        .copyWith(fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const Spacer(flex: 30),
                              Text(
                                AppStrings.enterTheOtp,
                                style: theme.textTheme.titleLarge,
                              ),
                              const Spacer(flex: 50),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 92,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 51,
                              width: 261,
                              child: OtpInput(
                                onChanged: (value) {
                                  viewModel.updateOtp(value);
                                },
                              ),
                            ),
                            const Spacer(flex: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppStrings.didntReceiveOtp,
                                  style: theme.textTheme.titleLarge,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    AppStrings.resend,
                                    style: theme.textTheme.titleLarge!.copyWith(
                                      color: Palette.primary,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 175,
                        child: Column(
                          children: [
                            const Spacer(flex: 69),
                            CustomButton(
                              buttonText: AppStrings.verify,
                              onTap: viewModel.verifyOtp,
                            ),
                            const Spacer(flex: 69),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // Flexible(
                //   flex: 320,
                //   child: Container(),
                // ),
              ],
            ),
          )),
        );
      },
    );
  }
}
