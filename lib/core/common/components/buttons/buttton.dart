import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, this.size, this.action, required this.child});

  final Size? size;
  final void Function()? action;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      child: child,
    );
  }
}