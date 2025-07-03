import 'package:flutter/material.dart';

class AppColors {
  // Sampled colors from the screenshot
  static const Color primaryGreen = Color(
    0xFF388E3C,
  ); // Main brand green (banner, buttons, dots)
  // We can keep accentGreen if needed for other effects later, but won't use it for solid fills based on screenshot
  static const Color accentGreen = Color(0xFF66BB6A); // Slightly lighter green

  static const Color darkGreen = Color.fromRGBO(0, 138, 96, 1.0);
  // Darker green (cart bar background) - Adjust if needed, 0xFF1B5E20 was also an option
  static const Color lightGrey = Color(
    0xFFEEEEEE,
  ); // Light grey (search bar, bottom banner background)
  static const Color mediumGrey = Color(
    0xFFCCCCCC,
  ); // Medium grey (inactive switch, page indicators)
  static const Color darkGrey = Color(
    0xFF616061,
  ); // Dark grey (secondary text, icons, bullet points)

  static const Color yellowRating = Color(0xFFFFC107); // Star ratings color
  static const Color white = Colors.white;
  static const Color black = Color(
    0xFF212121,
  ); // Very dark grey for main titles and menu button background
  static const Color red =
      Colors.red; // For error indicators (not in screenshot)
}
