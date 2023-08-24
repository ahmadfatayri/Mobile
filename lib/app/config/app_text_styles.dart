import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqlim/app/config/app_colors.dart';

/// AppTextStyle format as follows:
/// [fontWeight][fontSize][colorName][opacity]
/// Example: bold18White05
///
class AppTextStyles {
  static TextStyle appBar = GoogleFonts.nunito(
    color: AppColors.quaternary,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static TextStyle title = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle title_cat = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle title_store = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle discounted_price = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.lightGray,
    decoration: TextDecoration.lineThrough
  );

  static TextStyle price = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColors.lightGray,
  );

  static TextStyle compare_price = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.quaternary,
  );

  static TextStyle desc_store = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static TextStyle bigTitle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle hidden = const TextStyle(
    fontSize: 0,
  );

  static TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.darkGrey,
  );

  static TextStyle date = TextStyle(
    fontSize: 12,
    color: AppColors.darkGrey,
  );

  static TextStyle view_all = TextStyle(
    fontSize: 16,
    color: AppColors.blue,
  );

  static TextStyle tag = TextStyle(
    fontSize: 16,
    color: AppColors.quaternary,
  );

  static TextStyle title_menu = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle body_menu = TextStyle(
    fontSize: 16,
    color: AppColors.darkGrey,
  );

  static TextStyle button = GoogleFonts.nunito(
    color: AppColors.white,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static TextStyle field = GoogleFonts.nunito(
    color: AppColors.black,
    fontSize: 16,
  );

  static TextStyle hint = GoogleFonts.nunito(
    color: AppColors.darkGrey,
    fontStyle: FontStyle.italic,
    fontSize: 16,
  );

  static TextStyle text_button = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    decoration: TextDecoration.underline
  );

}
