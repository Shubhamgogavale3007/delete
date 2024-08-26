import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final double? width;
  final double height;
  final VoidCallback? onPressed;
  final Widget child;

  const MyElevatedButton(
      {super.key,
      required this.onPressed,
      required this.child,
      this.width,
      this.height = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Color(0xFFB68E04), Color(0xFFEFD95B)],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0)),
            borderRadius: BorderRadius.circular(10)),
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: child));
  }
}
