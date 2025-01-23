import 'package:bookme_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';


class BMShadowStyling {

  static final verticalCardShadow = BoxShadow(
    color: BMColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset (0, 2)
  );

  static final horizontalCardShadow = BoxShadow(
      color: BMColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset (0, 2)
  );
}