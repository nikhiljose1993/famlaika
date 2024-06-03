import 'package:stacked/stacked.dart';

import '../../../app/utils.dart';

class OtpVerificationViewModel extends BaseViewModel {
  String _otp = '';

  String get otp => _otp;

  void updateOtp(String otp) {
    _otp = otp;
    notifyListeners();
  }

  void verifyOtp() {
    // Logic to handle OTP submission
    print('OTP Submitted: $_otp');
    // navigationService.navigateTo();
  }

  void goBack() {
    navigationService.back();
  }
}
