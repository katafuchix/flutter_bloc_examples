import 'package:formz/formz.dart';

enum EmailValidationError { invalid }

final class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure([super.value = '']) : super.pure(); // フォームがまだ触られていない状態や、ユーザーが何も入力していない状態
  const Email.dirty([super.value = '']) : super.dirty(); // "dirty"とは、ユーザーが入力フィールドに何らかの変更を加えたことを示します。

  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validator(String? value) {
    return _emailRegex.hasMatch(value ?? '')
        ? null
        : EmailValidationError.invalid;
  }
}
