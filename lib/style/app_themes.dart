import 'package:calculator/style/app_theme.dart';
import 'package:calculator/style/colors.dart';

abstract class AppThemes{
  static AppTheme light = AppTheme(
    AppColors.white,
    AppColors.grey,
    AppColors.white,
    AppColors.grey,
    AppColors.lightgrey,
    AppColors.cyan,
    AppColors.grey, 
    AppColors.lightBlueGreen, 
    AppColors.lightgrey, 
    AppColors.black,
    AppColors.black,
    AppColors.cyan,
  );

  static AppTheme dark = AppTheme(
    AppColors.lightBlack,
    AppColors.white,
    AppColors.veryLightBlack,
    AppColors.veryLightBlack,
    AppColors.grey,
    AppColors.blue,
    AppColors.grey,
    AppColors.lightBlue,
    AppColors.veryLightBlack,
    AppColors.white,
    AppColors.white,
    AppColors.blue,
  );
}