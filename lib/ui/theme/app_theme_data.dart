import 'package:flutter/material.dart';
import 'package:shop/ui/theme/app_colors.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: AppColors.mainBlue,
  textTheme: const TextTheme(
    subtitle1: TextStyle(color: AppColors.mainWhite),
    subtitle2: TextStyle(color: AppColors.mainWhite),
    headline1: TextStyle(color: AppColors.mainWhite),
    headline2: TextStyle(color: AppColors.mainWhite),
    bodyText1: TextStyle(color: AppColors.mainWhite),
    bodyText2: TextStyle(color: AppColors.mainWhite),
  ),
  appBarTheme: const AppBarTheme(color: AppColors.mainBlue),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.mainBlue,
    elevation: 10,
    selectedItemColor: AppColors.mainWhite,
    unselectedItemColor: AppColors.mainWhite,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.mainBlue,
  ),
  listTileTheme: const ListTileThemeData(
    textColor: AppColors.mainWhite,
  )
);

ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: AppColors.mainBlack,
  scaffoldBackgroundColor: AppColors.mainWhite,
  textTheme: const TextTheme(
    subtitle1: TextStyle(color: AppColors.mainBlack),
    subtitle2: TextStyle(color: AppColors.mainBlack),
    headline1: TextStyle(color: AppColors.mainBlack),
    headline2: TextStyle(color: AppColors.mainBlack),
    bodyText1: TextStyle(color: AppColors.mainBlack),
    bodyText2: TextStyle(color: AppColors.mainBlack),
  ),
  appBarTheme: const AppBarTheme(
    color: AppColors.mainBlue,
    actionsIconTheme: IconThemeData(color: AppColors.mainWhite)),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.mainWhite,
    elevation: 10,
    selectedItemColor: AppColors.mainBlue,
    unselectedItemColor: AppColors.mainGrey,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.mainBlue,
  ),
  listTileTheme: const ListTileThemeData(
    textColor: AppColors.mainBlack,
  )
);
