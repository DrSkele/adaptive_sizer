part of adaptive_sizer;

extension SizerExtension on num {
  ///relative width on app
  double get w {
    assert(SizeInfo._initialized,
        'tried to resize widget without AdaptiveSizeBuilder.');
    var value = this /
        SizeInfo.referenceSize.width *
        SizeInfo.deviceSize.width *
        (SizeInfo.ratio > 1 ? SizeInfo.ratio : 1);
    return value;
  }

  ///relative height on app
  double get h {
    assert(SizeInfo._initialized,
        'tried to resize widget without AdaptiveSizeBuilder.');
    var value = this /
        SizeInfo.referenceSize.height *
        SizeInfo.deviceSize.height *
        (SizeInfo.ratio < 1 ? SizeInfo.ratio : 1);
    return value;
  }

  ///relative font size on app
  double get dp {
    assert(SizeInfo._initialized,
        'tried to resize widget without AdaptiveSizeBuilder.');
    var value = this *
        (SizeInfo.ratio < 1
            ? SizeInfo.deviceSize.width / SizeInfo.referenceSize.width
            : SizeInfo.deviceSize.height / SizeInfo.referenceSize.height);
    return value;
  }
}
