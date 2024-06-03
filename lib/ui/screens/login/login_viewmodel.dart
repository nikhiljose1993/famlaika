import 'package:famlaika/app/app.router.dart';
import 'package:famlaika/app/utils.dart';
import 'package:famlaika/models/country.dart';
import 'package:famlaika/ui/screens/otp_verification/otp_verification_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  Country? selectedCountry = defaultCountry;
  String errMsg = '';

  final loginFormKey = GlobalKey<FormState>();

  TextEditingController phoneNumberEditingController = TextEditingController();

  isValidMobileNumber(String mobileNumber) {
    const String pattern = r'^[1-9]\d{9}$';
    final RegExp regExp = RegExp(pattern);
    if (regExp.hasMatch(mobileNumber)) {
      return null;
    }
    // errMsg = AppStrings.mobileNumberError;
    notifyListeners();
    return;
  }

  // String formatPhoneNumber(String input) {
  //   final buffer = StringBuffer();
  //   var digits =
  //       input.replaceAll(RegExp(r'\D'), ''); // Remove non-digit characters

  //   for (var i = 0; i < digits.length; i++) {
  //     if (i == 3 || i == 6) {
  //       buffer.write(' '); // Add space after 3rd and 6th digits
  //     }
  //     buffer.write(digits[i]);
  //   }
  //   return buffer.toString();
  // }

  void getOtp() {
    final validate = loginFormKey.currentState!.validate();
    if (validate) {
      errMsg = '';
      notifyListeners();
      //
    }
    navigationService.navigateWithTransition(
      const OtpVerificationView(),
      routeName: Routes.otpVerificationView,
      transitionStyle: Transition.rightToLeft,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 300),
    );
  }
}
