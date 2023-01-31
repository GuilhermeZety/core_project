import 'package:core_project/core/common/constants/app_colors.dart';
import 'package:core_project/core/common/extensions/color_extension.dart';
import 'package:flutter/material.dart';

// Custom buttons are created by extending the MaterialButton class
class Button extends FilledButton {
  // The constructor made all Custom Button
  const Button({
    super.key, 
    required super.onPressed, 
    required super.child,
    super.style,
    super.autofocus,
    super.clipBehavior,
    super.focusNode,
    super.onFocusChange, 
    super.onHover, 
    super.onLongPress, 
    super.statesController
  });

  // The constructor made all Primary Custom Button
  Button.primary({
    super.key,
    required super.onPressed, 
    required super.child
  }) : super(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        )
      ),
      backgroundColor: AppColors.yellow_500.toMaterialStateProperty(),
      foregroundColor: Colors.black.toMaterialStateProperty(),
      textStyle: MaterialStateProperty.all<TextStyle?>(TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
    )
  );

  // The constructor made all Secondary Custom Button
  Button.secondary({
    super.key,
    required super.onPressed, 
    required super.child,
  }) : super(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: AppColors.grey_100, width: 1)
        )
      ),
      backgroundColor: Colors.white.toMaterialStateProperty(),
      foregroundColor: Colors.black.toMaterialStateProperty(),
      textStyle: MaterialStateProperty.all<TextStyle?>(TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    )
  );
}

extension Expanding on Button{
  Widget expanded() => Expanded(child: this);
}