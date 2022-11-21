/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/background_list_app.png
  AssetGenImage get backgroundListApp =>
      const AssetGenImage('assets/icon/background_list_app.png');

  /// File path: assets/icon/check_box.png
  AssetGenImage get checkBox =>
      const AssetGenImage('assets/icon/check_box.png');

  /// File path: assets/icon/uncheck_box.png
  AssetGenImage get uncheckBox =>
      const AssetGenImage('assets/icon/uncheck_box.png');

  /// List of all assets
  List<AssetGenImage> get values => [backgroundListApp, checkBox, uncheckBox];
}

class $AssetsImageGen {
  const $AssetsImageGen();

  /// File path: assets/image/lpdp_appbar.png
  AssetGenImage get lpdpAppbar =>
      const AssetGenImage('assets/image/lpdp_appbar.png');

  /// File path: assets/image/lpdp_header.png
  AssetGenImage get lpdpHeader =>
      const AssetGenImage('assets/image/lpdp_header.png');

  /// File path: assets/image/lpdp_logo.png
  AssetGenImage get lpdpLogo =>
      const AssetGenImage('assets/image/lpdp_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [lpdpAppbar, lpdpHeader, lpdpLogo];
}

class Assets {
  Assets._();

  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsImageGen image = $AssetsImageGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
