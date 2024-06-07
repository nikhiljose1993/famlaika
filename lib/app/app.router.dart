// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:famlaika/ui/screens/add_member/add_member_view.dart' as _i7;
import 'package:famlaika/ui/screens/create_family_tree/create_family_tree_view.dart'
    as _i6;
import 'package:famlaika/ui/screens/login/login_view.dart' as _i3;
import 'package:famlaika/ui/screens/otp_verification/otp_verification_view.dart'
    as _i4;
import 'package:famlaika/ui/screens/personal_information/personal_information_view.dart'
    as _i5;
import 'package:famlaika/ui/screens/splash/splash_view.dart' as _i2;
import 'package:flutter/material.dart' as _i8;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i9;

class Routes {
  static const splashView = '/';

  static const loginView = '/login-view';

  static const otpVerificationView = '/otp-verification-view';

  static const personalInformationView = '/personal-information-view';

  static const createFamilyTreeView = '/create-family-tree-view';

  static const addMemberView = '/add-member-view';

  static const all = <String>{
    splashView,
    loginView,
    otpVerificationView,
    personalInformationView,
    createFamilyTreeView,
    addMemberView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashView,
      page: _i2.SplashView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i3.LoginView,
    ),
    _i1.RouteDef(
      Routes.otpVerificationView,
      page: _i4.OtpVerificationView,
    ),
    _i1.RouteDef(
      Routes.personalInformationView,
      page: _i5.PersonalInformationView,
    ),
    _i1.RouteDef(
      Routes.createFamilyTreeView,
      page: _i6.CreateFamilyTreeView,
    ),
    _i1.RouteDef(
      Routes.addMemberView,
      page: _i7.AddMemberView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashView(),
        settings: data,
      );
    },
    _i3.LoginView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LoginView(),
        settings: data,
      );
    },
    _i4.OtpVerificationView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.OtpVerificationView(),
        settings: data,
      );
    },
    _i5.PersonalInformationView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.PersonalInformationView(),
        settings: data,
      );
    },
    _i6.CreateFamilyTreeView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.CreateFamilyTreeView(),
        settings: data,
      );
    },
    _i7.AddMemberView: (data) {
      final args = data.getArgs<AddMemberViewArguments>(nullOk: false);
      return _i8.MaterialPageRoute<String>(
        builder: (context) =>
            _i7.AddMemberView(key: args.key, relation: args.relation),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class AddMemberViewArguments {
  const AddMemberViewArguments({
    this.key,
    required this.relation,
  });

  final _i8.Key? key;

  final String relation;

  @override
  String toString() {
    return '{"key": "$key", "relation": "$relation"}';
  }

  @override
  bool operator ==(covariant AddMemberViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.relation == relation;
  }

  @override
  int get hashCode {
    return key.hashCode ^ relation.hashCode;
  }
}

extension NavigatorStateExtension on _i9.NavigationService {
  Future<dynamic> navigateToSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOtpVerificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.otpVerificationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPersonalInformationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.personalInformationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateFamilyTreeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createFamilyTreeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<String?> navigateToAddMemberView({
    _i8.Key? key,
    required String relation,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<String?>(Routes.addMemberView,
        arguments: AddMemberViewArguments(key: key, relation: relation),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOtpVerificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.otpVerificationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPersonalInformationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.personalInformationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreateFamilyTreeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.createFamilyTreeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<String?> replaceWithAddMemberView({
    _i8.Key? key,
    required String relation,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<String?>(Routes.addMemberView,
        arguments: AddMemberViewArguments(key: key, relation: relation),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
