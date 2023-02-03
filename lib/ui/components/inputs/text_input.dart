import 'package:core_project/core/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//ignore: must_be_immutable
class TextInput extends StatefulWidget {
  final Widget? label;
  final TextInputType keyboard;
  final TextEditingController _controller;

  bool isPassword = false;

  final String? Function(String?)? validation;
  final AutovalidateMode autovalidateMode;
  final List<TextInputFormatter>? mask;
  final String? hint;
  final int? lines;
  final bool readOnly;
  final bool showError;
  final bool? isLoading;
  final Function(String?)? onChange;
  final Size? size;

  TextInput(TextEditingController controller, {
    super.key,
    this.label,
    this.keyboard = TextInputType.text,
    this.validation,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.mask,
    this.hint,
    this.lines,
    this.showError = true,
    this.onChange,
    this.isLoading,
    this.readOnly = false, this.size,
  }) : _controller = controller;

  TextInput.numeric(TextEditingController controller, {
    super.key,
    required this.label,
    this.keyboard = TextInputType.number,
    this.isPassword = false,
    this.validation,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.mask,
    this.hint,
    this.lines,
    this.onChange,
    this.showError = true,
    this.isLoading,
    this.readOnly = false, this.size,
  }): _controller = controller;

  TextInput.password(TextEditingController controller, {
    super.key,
    required this.label,
    this.isPassword = true,
    this.keyboard = TextInputType.text,
    this.validation,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.mask,
    this.hint,
    this.lines,
    this.onChange,
    this.showError = true,
    this.isLoading,
    this.readOnly = false, this.size,
  }): _controller = controller;

  TextInput.email(TextEditingController controller, {
    super.key,
    required this.label,
    this.keyboard = TextInputType.emailAddress,
    this.validation,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.mask,
    this.hint,
    this.lines,
    this.showError = true,
    this.onChange,
    this.isLoading,
    this.readOnly = false, this.size,
  }): _controller = controller;

  TextEditingController get controller => _controller;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool isValueVisible = true;

  @override
  void initState() {
    isValueVisible = widget.isPassword;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size?.width ?? double.infinity,
      height: widget.size?.height ?? 60,
      child: TextFormField(
        readOnly: widget.readOnly,
        obscureText: isValueVisible,
        controller: widget.controller,
        keyboardType: widget.keyboard,
        onChanged: widget.onChange,
        validator: widget.validation,
        autovalidateMode: widget.autovalidateMode,
        inputFormatters: widget.mask,          
        minLines: isValueVisible ? 1 : widget.lines ?? 1,
        maxLines: isValueVisible ? 1 : 10,  
        decoration:  InputDecoration(
          label: widget.label,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          suffix: widget.isLoading != null ? 
          widget.isLoading == true ? 
          const SizedBox(
            width: 15,
            height: 15,
            child: CircularProgressIndicator(strokeWidth: 2,)                
          ): const SizedBox() : const SizedBox(),
          hintText: widget.hint,
          hintStyle: const TextStyle(color: Colors.black38),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.errorColor),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder:OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          suffixIcon: widget.isPassword
            ? _suffixIcon
            : null,
          fillColor: Theme.of(context).colorScheme.secondaryContainer,
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.grey_100),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.grey_100),
            borderRadius: BorderRadius.circular(10.0),
          ),         
          errorStyle: TextStyle(fontWeight: FontWeight.bold, color: AppColors.errorColor)              
        )
      ),
    );
  }

  Widget get _passwordIcon => Icon(isValueVisible ? Icons.visibility_off : Icons.visibility);
  
  Widget get _suffixIcon => GestureDetector(
    onTap: () {
      setState(() {
        isValueVisible = !isValueVisible;
      });
    },
    child: Padding(
      padding: const EdgeInsets.all(11),
      child: _passwordIcon,
    ),
  );
}