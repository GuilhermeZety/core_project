import 'package:email_validator/email_validator.dart';

class InputValidations {
  static String? Function(String?)? inputPasswordValidation = (
    (value) {
      if(value == null){
        return 'É obrigatorio passar algum valor.';
      }
      else if(value.isEmpty){
        return 'Insira algum valor!';
      }
      //TODO: Melhorar validação da senha
      else if(value.length < 6){
        return 'O mínimo é 6 caracteres!';
      }
      return null;
    }
  );
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