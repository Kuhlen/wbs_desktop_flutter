/// This file contains the text styles used in the app's theme.
/// It includes styles for the app title, main text, value text, and version text.
import 'package:flutter/material.dart';
import 'color_theme.dart';

/// The text style for the app title.
const appTitleStyle = TextStyle(
  color: appPrimaryColor,
  fontSize: 18.0,
  fontWeight: FontWeight.w600,
);

/// The text style for the main text.
const mainTextStyle = TextStyle(
  color: appPrimaryColor,
  fontSize: 15.0,
);

/// The text style for the value text.
const valTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 40.0,
);

/// The text style for the version text.
const verTestStyle = TextStyle(
  color: appThirdColor,
  fontSize: 11.0,
);
