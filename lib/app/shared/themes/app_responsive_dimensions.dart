import 'package:flutter/material.dart';
import 'package:formularios_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class ResponsiveDimensions {
  static double getResponsivePadding(BuildContext context) {
    var screenWidth = ScreenHelper.width(context);
    if (screenWidth > AppDimensions.screenLarge) {
      return AppDimensions.paddingLarge;
    } else if (screenWidth > AppDimensions.screenMedium) {
      return AppDimensions.paddingMedium;
    } else {
      return AppDimensions.paddingSmall;
    }
  }

  static double getResponsiveMargin(BuildContext context) {
    var screenWidth = ScreenHelper.width(context);
    if (screenWidth > AppDimensions.screenLarge) {
      return AppDimensions.marginLarge;
    } else if (screenWidth > AppDimensions.screenMedium) {
      return AppDimensions.marginMedium;
    } else {
      return AppDimensions.marginSmall;
    }
  }

  static double getResponsiveFontSize(BuildContext context) {
    var screenWidth = ScreenHelper.width(context);
    if (screenWidth > AppDimensions.screenLarge) {
      return AppDimensions.fontExtraLarge;
    } else {
      return AppDimensions.fontMedium;
    }
  }

  static double getResponsiveFabSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1024) {
      return 96.0;
    } else if (screenWidth > 600) {
      return 76.0;
    } else {
      return 56.0;
    }
  }

  static double getResponsiveIconSize(BuildContext context) {
    var screenWidth = ScreenHelper.width(context);
    if (screenWidth > AppDimensions.screenLarge) {
      return AppDimensions.iconExtraLarge;
    } else if (screenWidth > AppDimensions.screenMedium) {
      return AppDimensions.iconLarge;
    } else {
      return AppDimensions.iconLarge;
    }
  }

  static double getResponsiveVerticalSpace(BuildContext context) {
    var screenWidth = ScreenHelper.width(context);
    if (screenWidth > AppDimensions.screenLarge) {
      return AppDimensions.verticalSpaceExtraLarge;
    } else if (screenWidth > AppDimensions.screenMedium) {
      return AppDimensions.verticalSpaceLarge;
    } else {
      return AppDimensions.verticalSpaceMedium;
    }
  }

  static double getResponsiveHorizontalSpace(BuildContext context) {
    var screenWidth = ScreenHelper.width(context);
    if (screenWidth > AppDimensions.screenLarge) {
      return AppDimensions.horizontalSpaceExtraLarge;
    } else if (screenWidth > AppDimensions.screenMedium) {
      return AppDimensions.horizontalSpaceLarge;
    } else {
      return AppDimensions.horizontalSpaceSmall;
    }
  }

  static double getResponsiveRadius(BuildContext context) {
    var screenWidth = ScreenHelper.width(context);
    if (screenWidth > AppDimensions.screenLarge) {
      return AppDimensions.radiusExtraLarge;
    } else if (screenWidth > AppDimensions.screenMedium) {
      return AppDimensions.radiusLarge;
    } else {
      return AppDimensions.radiusMedium;
    }
  }

  static double getResponsiveBorderThickness(BuildContext context) {
    var screenWidth = ScreenHelper.width(context);
    if (screenWidth > AppDimensions.screenLarge) {
      return AppDimensions.borderMedium;
    } else {
      return AppDimensions.borderThin;
    }
  }
}
