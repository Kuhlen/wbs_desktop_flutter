/// This file contains the definition of the app theme, including the close and minimize buttons.
/// The close button is an [ElevatedButton] that closes the window when pressed.
/// The minimize button is an [ElevatedButton] that minimizes the window when pressed.
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'color_theme.dart';

var appCloseBtn = ElevatedButton(
  onPressed: () {
    windowManager.close();
  },
  style: ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.all(0.0),
    ),
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return closeBtnHoverColor;
        }
        return closeBtnColor;
      },
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  ),
  child: const Text(''),
);

var appMinimizeBtn = ElevatedButton(
  onPressed: () {
    windowManager.minimize();
  },
  style: ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.all(0.0),
    ),
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return minimizeBtnHoverColor;
        }
        return minimizeBtnColor;
      },
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  ),
  child: const Text(''),
);
