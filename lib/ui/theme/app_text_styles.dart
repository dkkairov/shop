import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shop/ui/theme/app_colors.dart';

abstract class AppTextStyle {
  // General
  static TextStyle boldTextStyle = const TextStyle(
    fontWeight: FontWeight.w700,
  );
  static TextStyle headerTextStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  // Cart
  static TextStyle cartTotalSumTextStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  // Profile
  static TextStyle profileNameTextStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static TextStyle historyTextStyle = const TextStyle(
    fontSize: 18,
  );
  static TextStyle profileTotalSumTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  // ProductCard
  static TextStyle productCardNameTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.mainBlack,
  );
  static TextStyle productCardRatingTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.mainBlack,
  );
  static TextStyle productCardPriceTextStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.mainBlack,
  );
}
