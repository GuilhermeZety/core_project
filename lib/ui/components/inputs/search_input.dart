import 'dart:developer';

import 'package:core_project/core/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchInput extends StatelessWidget {
  const SearchInput(TextEditingController controller, {
    super.key, 
    this.label, 
    this.keyboard = TextInputType.text, 
    this.validation, 
    this.autovalidateMode = AutovalidateMode.disabled, 
    this.mask, 
    this.hint, 
    this.lines, 
    this.readOnly = false, 
    this.showError = false, 
    this.isLoading, 
    this.onChange, 
    this.size}
  ) : _controller = controller;
  
  final Widget? label;
  final TextInputType keyboard;
  final TextEditingController _controller;


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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size?.width ?? double.infinity,
      height: size?.height ?? 60,
      child: TextFormField(
        readOnly: readOnly,
        controller: _controller,
        keyboardType: keyboard,
        onChanged: onChange,
        validator: validation,
        autovalidateMode: autovalidateMode,
        inputFormatters: mask,          
        minLines: lines,
        maxLines: 1,  
        decoration:  InputDecoration(
          label: label,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          suffix: isLoading != null ? 
          isLoading == true ? 
          const SizedBox(
            width: 15,
            height: 15,
            child: CircularProgressIndicator(strokeWidth: 2,)                
          ): const SizedBox() : const SizedBox(),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black38),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.red_500),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder:OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          suffixIcon: IconButton(icon: Icon(Icons.search), onPressed: () {
            log('search');
          },),
          fillColor: Theme.of(context).colorScheme.secondaryContainer,
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.grey_100),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.grey_100),
            borderRadius: BorderRadius.circular(10.0),
          ),         
          errorStyle: TextStyle(fontWeight: FontWeight.bold, color: AppColors.red_500)              
        )
      ),
    );
  }
}