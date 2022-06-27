import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shop/ui/theme/app_colors.dart';

abstract class AppTextStyle {
  // Profile
  static TextStyle profileNameTextStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static TextStyle orderNameTextStyle = const TextStyle(
    fontWeight: FontWeight.w700,
  );
  static TextStyle totalSumTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  // ProductCard
  static TextStyle productCardNameTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle productCardRatingTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  static TextStyle productCardPriceTextStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
}