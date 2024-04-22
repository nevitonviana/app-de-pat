import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizeScreenExtension on num {
  double get w => ScreenUtil().setWidth(this);

  double get h => ScreenUtil().setHeight(this);

  double get r => ScreenUtil().radius(this);

  double get sp => ScreenUtil().screenWidth * this;

  double get sw => ScreenUtil().scaleHeight * this;

  double get statusBar => ScreenUtil().statusBarHeight * this;
}
