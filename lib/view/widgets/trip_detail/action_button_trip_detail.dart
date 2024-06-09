import 'package:flutter/material.dart';

class ActionButtonTripDetail extends StatelessWidget {
  const ActionButtonTripDetail({
    super.key,
    required this.name,
    required this.index,
    required this.onPressed,
    required this.icon,
    this.valueAnimation = 0,
    this.borderRadius = 500,
    this.backgroundColor,
  });
  final String name;
  final double valueAnimation, borderRadius;
  final int index;
  final void Function()? onPressed;
  final Widget icon;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    const double fabHeight = 56.0;
    const double moveHeight = 10.0;
    return Transform(
      transform: Matrix4.translationValues(
        0.0,
        (fabHeight - valueAnimation * (moveHeight + fabHeight)) * index,
        0.0,
      ),
      child: FloatingActionButton(
        heroTag: name,
        tooltip: name,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        child: icon,
      ),
    );
  }
}
