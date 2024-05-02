import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const Color white1 = Color(0xFFF6F1EB);
  static const Color white2 = Color(0xFFCFCAC6);
  static const Color lightYellow = Color(0xFFFDF7F0);
  static const Color dark = Color(0xFF0B0A0A);
  static const Color dark2 = Color(0xFF413A29);
  static const Color dark3 = Color(0xFF787665);
  static const Color dark4 = Color(0xFF291514);
  static const Color dark5 = Color(0xFF0C0C0C);
  static const Color lightBrown = Color(0xFFAF8554);
  static const Color brown = Color(0xFF7C5E3C);
  static const Color mainLight = Color(0xFFEAE9CE);
  static const Color darkGreen1 = Color(0xFF2C4129);
  static const Color darkGreen2 = Color(0xFF1B1F0C);
  static const Color darkGreen3 = Color(0xFF465544);
  static const Color green = Color(0xFF5C682F);
  static const Color green2 = Color(0xFF9C947A);
  static const Color lightGreen = Color(0xFF9CBF51);
  static const Color lightGreen2 = Color(0xFF72990A);
  static const Color yellow = Color(0xFFEAC70C);
  static const Color yellow2 = Color(0xFFFFF0A3);
  static const Color darkRed = Color(0xFF412220);
  static const Color red = Color(0xFFCD4542);

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

  static final LinearGradient gradient3 = LinearGradient(
    colors: [
      const Color(0xFF4C4742).withOpacity(0.3),
      const Color(0xFF3D3833).withOpacity(0.3),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient greenGradient = LinearGradient(
    colors: [
      Color(0xFF3D5530),
      Color(0xFF222A20),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static final RadialGradient whiteBorderGradient = RadialGradient(
    colors: [
      Colors.white.withOpacity(0),
      Colors.white,
    ],
  );

  static final RadialGradient radialGradient1 = RadialGradient(
    colors: [
      Colors.black,
      const Color(0xFFADA295).withOpacity(0),
      const Color(0xFF726352),
    ],
  );

  static final LinearGradient bgGradient = LinearGradient(
    colors: [
      const Color(0xFFFDF7F0).withOpacity(0.3),
      const Color(0xFF97938F).withOpacity(0.3),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static BoxShadow boxShadow1 = BoxShadow(
    offset: const Offset(2, 3),
    blurRadius: 3.r,
    spreadRadius: 1.r,
    color: Colors.black.withOpacity(0.25),
  );

  static BoxShadow boxShadow2 = BoxShadow(
    offset: const Offset(0, 10),
    blurRadius: 30.r,
    color: Colors.black.withOpacity(0.3),
  );

  static BoxShadow boxShadow3 = BoxShadow(
    offset: const Offset(0, 2),
    blurRadius: 20.r,
    color: Colors.black.withOpacity(0.25),
  );

  static BoxShadow boxShadow4 = BoxShadow(
    offset: const Offset(2, 2),
    blurRadius: 3.r,
    color: AppTheme.darkGreen1.withOpacity(0.72),
  );

  static BoxShadow boxShadow5 = BoxShadow(
    offset: const Offset(2, 5),
    blurRadius: 5.r,
    spreadRadius: 2.r,
    color: AppTheme.dark5.withOpacity(0.25),
  );
}
