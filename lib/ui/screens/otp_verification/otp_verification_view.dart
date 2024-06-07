import 'package:famlaika/constants/app_colors.dart';
import 'package:famlaika/constants/app_strings.dart';
import 'package:famlaika/ui/screens/otp_verification/otp_verification_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../services/theme_service.dart';
import '../../widgets/shared.dart';

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
          appBar: appBar(title: AppStrings.otpVerification),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.spMax),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 103,
                  child: Column(
                    children: [
                      const Spacer(flex: 20),
                      Text(
                        AppStrings.enterTheOtp,
                        style: theme.textTheme.titleLarge,
                      ),
                      const Spacer(flex: 50),
                    ],
                  ),
                ),
                Flexible(
                  flex: 92,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 51,
                        child: Pinput(
                          length: 4,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          controller: viewModel.otpController,
                          onChanged: (pin) {
                            print('OTP entered: $pin');
                          },
                          onCompleted: (pin) {
                            print('Completed: $pin');
                          },
                          defaultPinTheme: PinTheme(
                            width: 55,
                            height: 51,
                            margin: const EdgeInsets.symmetric(horizontal: 6.5),
                            textStyle: theme.textTheme.titleLarge!
                                .copyWith(fontWeight: FontWeight.w500),
                            decoration: BoxDecoration(
                              color: Palette.lightGrey,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: Palette.inputBorder, width: 1),
                            ),
                          ),
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
                      customButton(
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
        );
      },
    );
  }
}
