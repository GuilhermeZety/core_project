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

}