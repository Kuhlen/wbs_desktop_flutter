import 'package:flutter/material.dart';

/// The gradient color used for the application background.
const appGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.topRight,
  stops: [0.0, 0.521368],
  colors: [
    Color.fromRGBO(42, 44, 111, 1.0),
    Color.fromRGBO(28, 29, 73, 1.0),
  ],
);

/// The primary color used for the application.
const appPrimaryColor = Color(0xFF3CE7C3);

/// The secondary color used for the application.
const appSecondaryColor = Color(0xFF695F94);

/// The third color used for the application.
const appThirdColor = Color(0xFF8066A8);

/// The color used for the close button.
const closeBtnColor = Color.fromRGBO(255, 0, 0, 1.0);

/// The color used for the close button when hovered.
const closeBtnHoverColor = Color.fromRGBO(7, 2, 2, 0.6);

/// The color used for the minimize button.
const minimizeBtnColor = Color.fromRGBO(85, 255, 127, 1.0);

/// The color used for the minimize button when hovered.
const minimizeBtnHoverColor = Color.fromRGBO(85, 255, 127, 0.6);
