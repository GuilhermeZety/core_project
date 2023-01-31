import 'package:flutter/material.dart';

class SubScaffold extends StatefulWidget {
  const SubScaffold({super.key, this.bottom, required this.body});

  final Widget? bottom;
  final Widget body;

  @override
  State<SubScaffold> createState() => _SubScaffoldState();
}

class _SubScaffoldState extends State<SubScaffold> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: widget.body,
        ),
        if (widget.bottom != null)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: widget.bottom ?? SizedBox(),
          ),
      ],
    );
  }
}