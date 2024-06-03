import 'package:famlaika/services/theme_service.dart';
import 'package:famlaika/ui/screens/otp_verification/otp_verification_view.dart';
import 'package:famlaika/ui/screens/personal_information/personal_information_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/api_service.dart';
import '../ui/screens/login/login_view.dart';
import '../ui/screens/splash/splash_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: OtpVerificationView),
    MaterialRoute(page: PersonalInformationView),
  ],
  dependencies: [
    LazySingleton(classType: ApiService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: ThemeService),
  ],
)
class AppSetup {}
