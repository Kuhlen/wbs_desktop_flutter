import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

/// A widget that provides hover functionality to its child widget.
///
/// This widget creates a container with specified dimensions and border properties.
/// The container changes its border color when hovered over.
/// It also updates the hover state in the [HomeController] using [MouseRegion] and [Obx].
class HoverContainerWidget extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Color borderColor;
  final Color hoverColor;
  final Widget child;

  HoverContainerWidget({
    super.key,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.borderColor,
    required this.hoverColor,
    required this.child,
  });

  final HomeController _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _homeController.isHovered.value = true,
      onExit: (_) => _homeController.isHovered.value = false,
      child: Obx(
        () => Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: _homeController.isHovered.value ? hoverColor : borderColor,
              width: 5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
