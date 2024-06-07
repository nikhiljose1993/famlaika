import 'package:famlaika/services/theme_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/api_service.dart';

import '../ui/screens/splash/splash_view.dart';
import '../ui/screens/login/login_view.dart';
import '../ui/screens/otp_verification/otp_verification_view.dart';
import '../ui/screens/personal_information/personal_information_view.dart';
import '../ui/screens/create_family_tree/create_family_tree_view.dart';
import '../ui/screens/add_member/add_member_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: OtpVerificationView),
    MaterialRoute(page: PersonalInformationView),
    MaterialRoute(page: CreateFamilyTreeView),
    MaterialRoute<String>(page: AddMemberView),
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
