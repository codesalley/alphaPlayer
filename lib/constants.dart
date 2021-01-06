import 'package:flutter/material.dart';

const kheaderTextStyle = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 24,
  fontWeight: FontWeight.w600,
);

const kMenuItemTextStyle = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 21,
  fontWeight: FontWeight.w400,
  color: Colors.white70,
);

final kTheneData = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: Color(0xFF31373D),
  splashColor: Color(0xFF1A1E21),
  scaffoldBackgroundColor: Color(0xFF282C31),
  primaryColor: Colors.pinkAccent,
  accentColor: Colors.pinkAccent,
  cursorColor: Colors.pinkAccent,
  dividerColor: Colors.white54,
  fontFamily: 'Acme',
  sliderTheme: SliderThemeData(
    trackHeight: 1.0,
    thumbColor: Colors.pinkAccent,
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
    overlayColor: Colors.pinkAccent.withOpacity(0.1),
    activeTrackColor: Colors.pinkAccent,
    inactiveTrackColor: Colors.white54,
  ),
);
