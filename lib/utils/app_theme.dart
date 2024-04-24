import 'package:flutter/material.dart';

class AppTheme {
  static const Color white1 = Color(0xFFF6F1EB);
  static const Color white2 = Color(0xFFCFCAC6);
  static const Color white3 = Color(0xFFFDF7F0);
  static const Color dark = Color(0xFF0B0A0A);
  static const Color dark2 = Color(0xFF413A29);
  static const Color dark3 = Color(0xFF787665);
  static const Color dark4 = Color(0xFF291514);
  static const Color lightBrown = Color(0xFFAF8554);
  static const Color brown = Color(0xFF7C5E3C);
  static const Color mainLight = Color(0xFFEAE9CE);
  static const Color darkGreen1 = Color(0xFF2C4129);
  static const Color darkGreen2 = Color(0xFF1B1F0C);
  static const Color yellow = Color(0xFFEAC70C);
  static const Color yellow2 = Color(0xFFFFF0A3);

  static final LinearGradient gradient1 = LinearGradient(
    colors: [
      const Color(0xFF0B4441).withOpacity(0.78),
      const Color(0xFF83A335).withOpacity(0.78),
      const Color(0xFFF9E78A).withOpacity(0.78),
    ],
  );

  static final LinearGradient gradient2 = LinearGradient(
    colors: [
      const Color(0xFFFDF7F0).withOpacity(0.3),
      const Color(0xFF97938F).withOpacity(0.3),
    ],
  );

  static const LinearGradient greenGradient = LinearGradient(
    colors: [
      Color(0xFF3D5530),
      Color(0xFF222A20),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
