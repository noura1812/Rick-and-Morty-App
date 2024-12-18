import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;

  const BannerWidget({
    super.key,
    required this.label,
    this.backgroundColor = Colors.redAccent,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: -40,
      child: Transform.rotate(
        angle: -0.785398, // 45 degrees in radians
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 1),
          color: backgroundColor,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,

              //letterSpacing: 2,
            ),
          ),
        ),
      ),
    );
  }
}
