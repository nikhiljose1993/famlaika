/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsCaGen {
  const $AssetsCaGen();

  /// File path: assets/ca/lets-encrypt-r3.pem
  String get letsEncryptR3 => 'assets/ca/lets-encrypt-r3.pem';

  /// List of all assets
  List<String> get values => [letsEncryptR3];
}

class $AssetsFlagsGen {
  const $AssetsFlagsGen();

  /// File path: assets/flags/india.svg
  String get india => 'assets/flags/india.svg';

  /// File path: assets/flags/saudi.svg
  String get saudi => 'assets/flags/saudi.svg';

  /// File path: assets/flags/uae.svg
  String get uae => 'assets/flags/uae.svg';

  /// List of all assets
  List<String> get values => [india, saudi, uae];
}

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Figtree-Black.ttf
  String get figtreeBlack => 'assets/fonts/Figtree-Black.ttf';

  /// File path: assets/fonts/Figtree-BlackItalic.ttf
  String get figtreeBlackItalic => 'assets/fonts/Figtree-BlackItalic.ttf';

  /// File path: assets/fonts/Figtree-Bold.ttf
  String get figtreeBold => 'assets/fonts/Figtree-Bold.ttf';

  /// File path: assets/fonts/Figtree-BoldItalic.ttf
  String get figtreeBoldItalic => 'assets/fonts/Figtree-BoldItalic.ttf';

  /// File path: assets/fonts/Figtree-ExtraBold.ttf
  String get figtreeExtraBold => 'assets/fonts/Figtree-ExtraBold.ttf';

  /// File path: assets/fonts/Figtree-ExtraBoldItalic.ttf
  String get figtreeExtraBoldItalic =>
      'assets/fonts/Figtree-ExtraBoldItalic.ttf';

  /// File path: assets/fonts/Figtree-Italic.ttf
  String get figtreeItalic => 'assets/fonts/Figtree-Italic.ttf';

  /// File path: assets/fonts/Figtree-Light.ttf
  String get figtreeLight => 'assets/fonts/Figtree-Light.ttf';

  /// File path: assets/fonts/Figtree-LightItalic.ttf
  String get figtreeLightItalic => 'assets/fonts/Figtree-LightItalic.ttf';

  /// File path: assets/fonts/Figtree-Medium.ttf
  String get figtreeMedium => 'assets/fonts/Figtree-Medium.ttf';

  /// File path: assets/fonts/Figtree-MediumItalic.ttf
  String get figtreeMediumItalic => 'assets/fonts/Figtree-MediumItalic.ttf';

  /// File path: assets/fonts/Figtree-Regular.ttf
  String get figtreeRegular => 'assets/fonts/Figtree-Regular.ttf';

  /// File path: assets/fonts/Figtree-SemiBold.ttf
  String get figtreeSemiBold => 'assets/fonts/Figtree-SemiBold.ttf';

  /// File path: assets/fonts/Figtree-SemiBoldItalic.ttf
  String get figtreeSemiBoldItalic => 'assets/fonts/Figtree-SemiBoldItalic.ttf';

  /// List of all assets
  List<String> get values => [
        figtreeBlack,
        figtreeBlackItalic,
        figtreeBold,
        figtreeBoldItalic,
        figtreeExtraBold,
        figtreeExtraBoldItalic,
        figtreeItalic,
        figtreeLight,
        figtreeLightItalic,
        figtreeMedium,
        figtreeMediumItalic,
        figtreeRegular,
        figtreeSemiBold,
        figtreeSemiBoldItalic
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/login.png
  AssetGenImage get login => const AssetGenImage('assets/images/login.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/splash4x.png
  AssetGenImage get splash4x =>
      const AssetGenImage('assets/images/splash4x.png');

  /// List of all assets
  List<AssetGenImage> get values => [login, logo, splash4x];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/appbar_back.svg
  String get appbarBack => 'assets/svg/appbar_back.svg';

  /// File path: assets/svg/calender.svg
  String get calender => 'assets/svg/calender.svg';

  /// File path: assets/svg/camera.svg
  String get camera => 'assets/svg/camera.svg';

  /// File path: assets/svg/family_tree.svg
  String get familyTree => 'assets/svg/family_tree.svg';

  /// File path: assets/svg/female.svg
  String get female => 'assets/svg/female.svg';

  /// File path: assets/svg/line.svg
  String get line => 'assets/svg/line.svg';

  /// File path: assets/svg/male.svg
  String get male => 'assets/svg/male.svg';

  /// File path: assets/svg/person.svg
  String get person => 'assets/svg/person.svg';

  /// File path: assets/svg/user_alt.svg
  String get userAlt => 'assets/svg/user_alt.svg';

  /// List of all assets
  List<String> get values => [
        appbarBack,
        calender,
        camera,
        familyTree,
        female,
        line,
        male,
        person,
        userAlt
      ];
}

class Assets {
  Assets._();

  static const $AssetsCaGen ca = $AssetsCaGen();
  static const $AssetsFlagsGen flags = $AssetsFlagsGen();
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
