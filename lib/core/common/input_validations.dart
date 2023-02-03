import 'package:email_validator/email_validator.dart';

class InputValidations {
  /// It's a function that validates the password.
  static String? Function(String?)? inputPasswordValidation = (
    (value) {
      RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@_#\$&*~-]).{8,}$');
    
      if(value == null){
        return 'É obrigatorio passar algum valor.';
      }
      else if(value.isEmpty){
        return 'Insira algum valor!';
      }
      else if(!regex.hasMatch(value)){
        return 'Insira uma senha válida!';
      }
      return null;
    }
  );
  /// It's a function that validates the email.
  static String? Function(String?)? inputEmailValidation = (
    (value) {
      if(value == null){
        return 'É obrigatorio passar algum valor.';
      }
      else if(value.isEmpty){
        return 'Insira algum valor!';
      }
      else if(EmailValidator.validate(value) == false){
        return 'Insira um email válido!';
      }
      return null;
    }
  );

  /// It's a function that validates the email.
  static String? Function(String?)? inputDateValidation = (
    (value) {
      if(value == null){
        return 'É obrigatorio passar algum valor.';
      }
      else if(value.isEmpty){
        return 'Insira algum valor!';
      }
      else{
        var splitted = value.split('/');
        var days = int.tryParse(splitted.first);
        var mouth = splitted.length > 1 ? int.tryParse(splitted[1]) : null;
        var year = splitted.length > 2 ? int.tryParse(splitted[2]) : null;
        if(days != null && (days > 31 || days < 1)){
          return 'Insira um dia válido!';
        }
        if(mouth != null && (mouth > 12 || mouth < 1)){
          return 'Insira um mês válido!';
        }
        if(year != null && (year > 2100 || year < 1900)){
          return 'Insira um ano válido!';
        }
        if(value.length < 10){
          return 'Insira uma data completa!';
        }
      }
      return null;
    }
  );

}