import 'package:flutter/material.dart';

class ResponsiveLayout {
  final double _designWidth = 375;
  final double _designHeight = 812;
  final double screenWidth;
  final double screenHeight;

  ResponsiveLayout(this.screenWidth, this.screenHeight);

  // For width-based scaling
  double width(double value) => (value / _designWidth) * screenWidth;

  // For height-based scaling
  double height(double value) => (value / _designHeight) * screenHeight;

  // Font size based on width scaling (you could also use height-based)
  double fontSize(double size) => width(size);

  // Padding and Margin with EdgeInsets
  EdgeInsets padding({double left = 0, double top = 0, double right = 0, double bottom = 0}) {
    return EdgeInsets.fromLTRB(width(left), height(top), width(right), height(bottom));
  }

  // All-sides padding/margin
  EdgeInsets allPadding(double value) => EdgeInsets.all(width(value));

  // Symmetric padding/margin
  EdgeInsets symmetricPadding({double horizontal = 0, double vertical = 0}) {
    return EdgeInsets.symmetric(horizontal: width(horizontal), vertical: height(vertical));
  }

  // Responsive SizedBox
  SizedBox sizedBox({double width = 0, double height = 0}) {
    return SizedBox(width: this.width(width), height: this.height(height));
  }

  // Responsive image size
  double imageSize(double size) => width(size);

  // Access the instance throughout the app
  static ResponsiveLayout of(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ResponsiveLayout(size.width, size.height);
  }
}
