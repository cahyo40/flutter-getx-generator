import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  const AppLayout({
    super.key,
    required this.mobile,
    this.tablet,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobile;
        } else {
          return OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.landscape) {
                return tablet ?? mobile;
              } else {
                return mobile;
              }
            },
          );
        }
      },
    );
  }
}
