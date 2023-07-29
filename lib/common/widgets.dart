import 'package:flutter/material.dart';

class KHeight extends StatelessWidget {
  const KHeight({
    this.height,
    super.key,
  });
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class KWidth extends StatelessWidget {
  const KWidth({
    this.width,
    super.key,
  });
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width,
    );
  }
}
