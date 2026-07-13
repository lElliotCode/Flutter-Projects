import 'package:formz/formz.dart';

// * Definimos input validation errors
enum UsernameError { empty, length }

//* Extendemos FormzInput y proveemos el input type y el error type
class Username extends FormzInput<String, UsernameError> {
  //* Llamamos super.pure para representar un input sin modificación
  const Username.pure() : super.pure('');

  //* Llamamos super.dirty para representar un input modificado
  const Username.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == UsernameError.empty) return 'El campo es requerido';
    if (displayError == UsernameError.length) return 'Mínimo 6 caracteres';
    return null;
  }

  // * Override validator para manejar el valor dado
  @override
  UsernameError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return UsernameError.empty;
    }
    if (value.length < 6) return UsernameError.length;

    return null;
  }
}
