import 'package:formz/formz.dart';

enum PasswordValidationError { invalid }

final class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure([super.value = '']) : super.pure(); // フォームがまだ触られていない状態や、ユーザーが何も入力していない状態
  const Password.dirty([super.value = '']) : super.dirty(); // "dirty"とは、ユーザーが入力フィールドに何らかの変更を加えたことを示します。

  static final _passwordRegex =
  RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidationError? validator(String? value) {
    return _passwordRegex.hasMatch(value ?? '')
        ? null
        : PasswordValidationError.invalid;
  }
}
