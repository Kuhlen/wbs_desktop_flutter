import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

import 'package:wbs_desktop/core/theme/color_theme.dart';
import 'package:wbs_desktop/core/theme/text_theme.dart';
import 'package:wbs_desktop/core/theme/app_theme.dart';

import '../controllers/home_controller.dart';
import '../controllers/serial_controller.dart';
import '../widgets/hover_container_widget.dart';

/// The [HomeView] class represents the view for the home screen.
/// It extends the [GetView] class and is associated with the [HomeController].
/// This class builds the UI for the home screen, including the title, serial data display, and control buttons.
class HomeView extends GetView<HomeController> {
  final SerialController _serialController = Get.put(SerialController());
  final HomeController _homeController = Get.put(HomeController());

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: appGradientColor,
                border: Border.all(
                  width: 0.0,
                  color: Colors.transparent,
                ),
              ),
              child: Column(
                children: [
                  // Title Row
                  Row(
                    children: [
                      Expanded(
                        child: DragToMoveArea(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(10, 3, 5, 5),
                            child: const Text(
                              'WBS',
                              style: appTitleStyle,
                            ),
                          ),
                        ),
                      ),

                      // Minimize and Close Buttons
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            width: 16.0,
                            height: 16.0,
                            child: appMinimizeBtn,
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            width: 16.0,
                            height: 16.0,
                            child: appCloseBtn,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 23,
                  ),

                  // Serial Data Display
                  Flexible(
                    child: HoverContainerWidget(
                      width: 180,
                      height: 180,
                      borderRadius: 90,
                      borderColor: appPrimaryColor,
                      hoverColor: appSecondaryColor,
                      child: Obx(
                        () => Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Serial Data',
                                style: mainTextStyle,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                _serialController.serialData.value,
                                style: valTextStyle,
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                'Gram',
                                style: mainTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),

                  // Control Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Transform.scale(
                          scale: 1.2,
                          child: IconButton(
                            onPressed: () async {
                              _homeController.isPressed.toggle();

                              if (_homeController.isPressed.value) {
                                _serialController.readSerialData();
                              } else {
                                _serialController.stopReading();
                              }
                            },
                            icon: Obx(
                              () => Icon(
                                _homeController.isPressed.value
                                    ? Icons.stop_circle_rounded
                                    : Icons.play_arrow_rounded,
                                color: const Color(0xFF8066A8),
                                size: 11,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Flexible(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(end: 12),
                          child: Text(
                            'V24.01.3',
                            style: verTestStyle,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
