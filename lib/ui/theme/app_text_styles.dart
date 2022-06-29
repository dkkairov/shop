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
    color: AppColors.mainBlack,
  );

  // ProductCard
  static TextStyle productCardTextStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.mainBlack,
  );
  //// Dark
  static TextStyle productCardNameDarkTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.mainWhite,
  );
  static TextStyle productCardRatingDarkTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.mainWhite,
  );
  static TextStyle productCardPriceDarkTextStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.mainWhite,
  );

  //// Light
  static TextStyle productCardNameLightTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.mainBlack,
  );
  static TextStyle productCardRatingLightTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.mainBlack,
  );
  static TextStyle productCardPriceLightTextStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.mainBlack,
  );
}
