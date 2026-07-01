import 'package:formz/formz.dart';

// * Definimos input validation errors
enum EmailError { empty, format }

//* Extendemos FormzInput y proveemos el input type y el error type
class Email extends FormzInput<String, EmailError> {
  //* Llamamos super.pure para representar un input sin modificación
  const Email.pure() : super.pure('');

  //* Llamamos super.dirty para representar un input modificado
  const Email.dirty(super.value) : super.dirty();

  static final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == EmailError.empty) return 'El campo es requerido';
    if (displayError == EmailError.format) return 'El formato es incorrecto';
    return null;
  }

  // * Override validator para manejar el valor dado
  @override
  EmailError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return EmailError.empty;
    if ( !emailRegExp.hasMatch(value)) return EmailError.format;

    return null;
  }
}
