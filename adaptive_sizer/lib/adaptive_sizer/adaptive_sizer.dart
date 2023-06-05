library adaptive_sizer;

import 'package:flutter/material.dart';

part 'sizer_extension.dart';

enum AdaptOption {
  auto,
  respectWidth,
  respectHeight,
}

class SizeInfo {
  static bool _initialized = false;

  static late final AdaptOption _option;

  ///respective device size on design
  static late final Size referenceSize;

  ///aspect ratio on design
  static late final double referenceRatio;

  ///logical pixel size of the device
  static late final Size deviceSize;

  ///aspect ratio of the device
  static late final double deviceRatio;

  ///pixel ratio(real pixels per logical pixel) of the device
  ///pixel ratio * deviceSize = actual pixel size of the device
  static late final double pixelRatio;

  ///device aspect ratio over reference aspect ratio </br>
  ///ratio smaller than 1 : respect WIDTH </br>
  ///ratio larget than 1 : respect HEIGHT
  static double get ratio => SizeInfo.deviceRatio / SizeInfo.referenceRatio;

  static void _setSizeInfo({
    required Size referenceScreenSize,
    required Size deviceScreenSize,
    required double screenPixelRatio,
    required AdaptOption option,
  }) {
    if (_initialized) return;

    referenceSize = referenceScreenSize;
    referenceRatio = referenceSize.width / referenceSize.height;

    deviceSize = deviceScreenSize;
    deviceRatio = deviceSize.width / deviceSize.height;

    pixelRatio = screenPixelRatio;

    _option = option;
    _initialized = true;
  }
}

class AdaptiveSizeBuilder extends StatelessWidget {
  const AdaptiveSizeBuilder({
    super.key,
    required this.referenceSize,
    required this.builder,
    this.option = AdaptOption.auto,
  });

  final AdaptOption option;
  final Size referenceSize;
  final Widget Function(BuildContext context) builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      SizeInfo._setSizeInfo(
        referenceScreenSize: referenceSize,
        deviceScreenSize: Size(constraints.maxWidth, constraints.maxHeight),
        screenPixelRatio: WidgetsBinding.instance.window.devicePixelRatio,
        option: option,
      );
      return Builder(builder: builder);
    });
  }
}
