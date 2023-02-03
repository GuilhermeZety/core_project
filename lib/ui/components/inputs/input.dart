import 'package:core_project/core/common/constants/app_colors.dart';
import 'package:core_project/core/common/extensions/date_format_extension.dart';
import 'package:core_project/core/common/input_validations.dart';
import 'package:core_project/main.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


//ignore: must_be_immutable
class Input extends StatefulWidget {
  final Widget? label;
  final TextInputType keyboard;
  final TextEditingController _controller;

  final String? Function(String?)? validation;
  final AutovalidateMode autovalidateMode;
  List<TextInputFormatter>? mask;
  final String? hint;
  final int? lines;
  final bool readOnly;
  final bool showError;
  final bool? isLoading;
  final Function(String?)? onChange;
  final Size? size;

  Input(TextEditingController controller, {
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

  Input.numeric(TextEditingController controller, {
    super.key,
    required this.label,
    this.keyboard = TextInputType.number,
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

  Input.password(TextEditingController controller, {
    super.key,
    required this.label,
    this.keyboard = TextInputType.visiblePassword,
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

  Input.email(TextEditingController controller, {
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

  Input.dateYear(TextEditingController controller, {
    super.key,
    required this.label,
    this.keyboard = TextInputType.datetime,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.hint,
    this.lines,
    this.showError = true,
    this.onChange,
    this.isLoading,
    this.readOnly = false, 
    this.size,
  }): _controller = controller, mask = [TextInputMask(mask: '99/99/9999')], validation = InputValidations.inputDateValidation;

  TextEditingController get controller => _controller;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool isValueVisible = false;

  @override
  void initState() {
    if(widget.keyboard == TextInputType.visiblePassword) isValueVisible = true;
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
          suffixIcon: _suffixIcon(),
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
  
  Widget _suffixIcon() {
    if (widget.keyboard == TextInputType.visiblePassword) {
      return IconButton(
        onPressed: () {
          setState(() {
            isValueVisible = !isValueVisible;
          });
        },
        icon: Material(elevation: 2, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)), child: Padding(
          padding: const EdgeInsets.all(3),
          child: _passwordIcon,
        )),
      );
    }
    else if(widget.keyboard == TextInputType.datetime){
      var formatter = DateFormat('dd/MM/yyyy');
      return IconButton(
        onPressed: () async {
          await showDatePicker(
            context: context, 
            initialDate: formatter.tryParse(widget.controller.text) ?? DateTime.now(), 
            firstDate: DateTime(1900), 
            lastDate: DateTime(2100),
            locale: Locale(settingsLogic.currentLocale.value ?? 'en'),
          ).then((value) {
            if(value != null) {
              widget.controller.text = formatter.format(value);
              return;
            }
            widget.controller.text = formatter.format(formatter.tryParse(widget.controller.text) ?? DateTime.now());
          });
        }, 
        icon: Material(
          elevation: 2, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)
          ), 
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Icon(
              Icons.date_range, 
              color: Colors.black,
            ),
          )
        )
      );
    }
    return SizedBox();
  }
  
}