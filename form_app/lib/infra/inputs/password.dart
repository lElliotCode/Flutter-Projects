import 'package:formz/formz.dart';

// * Definimos input validation errors
enum PasswordError { empty, length }

//* Extendemos FormzInput y proveemos el input type y el error type
class Password extends FormzInput<String, PasswordError> {
  //* Llamamos super.pure para representar un input sin modificación
  const Password.pure() : super.pure('');

  //* Llamamos super.dirty para representar un input modificado
  const Password.dirty(super.value) : super.dirty();

    String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == PasswordError.empty) return 'El campo es requerido';
    if (displayError == PasswordError.length) return 'Mínimo 6 caracteres';
    return null;
  }


  // * Override validator para manejar el valor dado
  @override
  PasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return PasswordError.empty;
    }
    if (value.length < 6) return PasswordError.length;

    return null;
  }
}
