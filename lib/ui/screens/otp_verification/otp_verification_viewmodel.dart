import 'package:famlaika/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/utils.dart';

class OtpVerificationViewModel extends BaseViewModel {
  TextEditingController otpController = TextEditingController();

  void verifyOtp() {
    navigationService.navigateTo(Routes.personalInformationView);
  }

  void goBack() {
    navigationService.back();
  }
}
