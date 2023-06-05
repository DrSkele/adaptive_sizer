part of adaptive_sizer;

extension SizerExtension on num {
  ///relative width on app
  double get w {
    assert(SizeInfo._initialized,
        'tried to resize widget without AdaptiveSizeBuilder.');
    switch (SizeInfo._option) {
      case AdaptOption.respectWidth:
        return this / SizeInfo.referenceSize.width * SizeInfo.deviceSize.width;
      case AdaptOption.respectHeight:
        return this /
            SizeInfo.referenceSize.width *
            SizeInfo.deviceSize.width *
            SizeInfo.ratio;
      default:
        return this /
            SizeInfo.referenceSize.width *
            SizeInfo.deviceSize.width *
            (SizeInfo.ratio > 1 ? SizeInfo.ratio : 1);
    }
  }

  ///relative height on app
  double get h {
    assert(SizeInfo._initialized,
        'tried to resize widget without AdaptiveSizeBuilder.');
    switch (SizeInfo._option) {
      case AdaptOption.respectWidth:
        return this /
            SizeInfo.referenceSize.height *
            SizeInfo.deviceSize.height *
            SizeInfo.ratio;
      case AdaptOption.respectHeight:
        return this /
            SizeInfo.referenceSize.height *
            SizeInfo.deviceSize.height;
      default:
        return this /
            SizeInfo.referenceSize.height *
            SizeInfo.deviceSize.height *
            (SizeInfo.ratio < 1 ? SizeInfo.ratio : 1);
    }
  }

  ///relative font size on app
  double get dp {
    assert(SizeInfo._initialized,
        'tried to resize widget without AdaptiveSizeBuilder.');
    switch (SizeInfo._option) {
      case AdaptOption.respectWidth:
        return this * SizeInfo.deviceSize.width / SizeInfo.referenceSize.width;
      case AdaptOption.respectHeight:
        return this *
            SizeInfo.deviceSize.height /
            SizeInfo.referenceSize.height;
      default:
        return this *
            (SizeInfo.ratio < 1
                ? SizeInfo.deviceSize.width / SizeInfo.referenceSize.width
                : SizeInfo.deviceSize.height / SizeInfo.referenceSize.height);
    }
  }
}
