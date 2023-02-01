import 'package:core_project/core/common/constants/app_colors.dart';
import 'package:core_project/core/common/extensions/color_extension.dart';
import 'package:flutter/material.dart';

enum ButtonType{
  filled,
  outlined,
  text,
}

// Custom buttons are created by extending the MaterialButton class
class Button extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;
  final ButtonStyle? style;
  final bool autofocus;
  final Clip clipBehavior;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onFocusChange;
  final ValueChanged<bool>? onHover;
  final VoidCallback? onLongPress;
  final ButtonType? buttonType;
  // The constructor made all Custom Button
  const Button({
    super.key,
    required this.onPressed, 
    required this.child,
    this.style,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.onFocusChange, 
    this.onHover, 
    this.onLongPress, 
    this.buttonType, 
  });



  // The constructor made all Primary Custom Button
  Button.primary({
    super.key,
    required this.onPressed, 
    required this.child,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.onFocusChange, 
    this.onHover, 
    this.onLongPress, 
    this.buttonType = ButtonType.filled, 
   }) : style = 
  ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      )
    ),
    backgroundColor: AppColors.yellow_500.toMaterialStateProperty(),
    foregroundColor: Colors.black.toMaterialStateProperty(),
    textStyle: MaterialStateProperty.all<TextStyle?>(TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
  );

  // The constructor made all Secondary Custom Button
  Button.secondary({
    super.key,
    required this.onPressed, 
    required this.child,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.onFocusChange, 
    this.onHover, 
    this.onLongPress, 
    this.buttonType = ButtonType.filled, 
  }) : style = 
  ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: AppColors.grey_100, width: 1)
      )
    ),
    backgroundColor: Colors.white.toMaterialStateProperty(),
    foregroundColor: Colors.black.toMaterialStateProperty(),
    textStyle: MaterialStateProperty.all<TextStyle?>(TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
  );

  // The constructor made all Primary Custom Button
  const Button.outlined({
    super.key,
    required this.onPressed, 
    required this.child,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.onFocusChange, 
    this.onHover, 
    this.style, 
    this.onLongPress, 
    this.buttonType = ButtonType.outlined, 
   });

  @override
  Widget build(BuildContext context) {

    if(buttonType == ButtonType.outlined){
      return OutlinedButton(
        onPressed: onPressed,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        focusNode: focusNode,
        onFocusChange: onFocusChange,
        onHover: onHover,
        onLongPress: onLongPress,
        style: ButtonStyle().copyWith(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Theme.of(context).primaryColor, width: 1)
            )
          ),
          side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Theme.of(context).primaryColor, width: 1)),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          foregroundColor: Theme.of(context).textTheme.titleMedium!.color!.toMaterialStateProperty(),
          textStyle: MaterialStateProperty.all<TextStyle?>(TextStyle(color: AppColors.grey_100, fontWeight: FontWeight.bold)),
        ), 
        child : child,
      );
    }

    return FilledButton(
      onPressed: onPressed,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      onFocusChange: onFocusChange,
      onHover: onHover,
      onLongPress: onLongPress,
      style: style, 
      child : child,
    );
  }
}

extension Expanding on Button{
  Widget expanded() => Expanded(child: this);
}