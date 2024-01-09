import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wbs_desktop/core/theme/color_theme.dart';
import 'package:window_manager/window_manager.dart';
import 'package:screen_retriever/screen_retriever.dart';

import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(221, 283),
    center: false,
    minimumSize: Size(221, 283),
    maximumSize: Size(221, 283),
    alwaysOnTop: true,
    fullScreen: false,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    title: 'Simple Weight Bridge',
    titleBarStyle: TitleBarStyle.hidden,
    windowButtonVisibility: false,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    Display primaryDisplay = await screenRetriever.getPrimaryDisplay();
    var availableGeometry = primaryDisplay.visibleSize;
    var screenGeometry = primaryDisplay.size;
    var appGeometry = await windowManager.getSize();
    var xValue = availableGeometry!.width - appGeometry.width;
    var yValue = 2 * availableGeometry.height -
        screenGeometry.height -
        appGeometry.height;

    await windowManager.setAsFrameless();
    await windowManager.setHasShadow(false);
    await windowManager.setPosition(Offset(xValue, yValue));
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      color: Colors.transparent,
      builder: (context, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: appGradientColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 0.0,
                    color: Colors.transparent,
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.zero),
                    child: child,
                  ),
                ),
              )
            ],
          ),
        );
      },
      title: 'Simple Weight Bridge',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
