part of 'my_form_bloc.dart';

final class MyFormState extends Equatable {
  // コンストラクタを定義
  const MyFormState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
  });

  //多くの場合、フォームの入力フィールドは初期状態で空になっています。
  // この状態は、フォームがまだ触られていない状態や、ユーザーが何も入力していない状態を表します。
  // pure()メソッドは、このような初期状態を表すインスタンスを生成するために使用されます。

  final Email email;
  final Password password;
  final bool isValid;
  final FormzSubmissionStatus status;

  // このcopyWith()メソッドは、既存のMyFormStateのインスタンスを変更せずに、
  // 新しい状態を持つ別のMyFormStateインスタンスを作成するために使用されます。
  MyFormState copyWith({
    Email? email,
    Password? password,
    bool? isValid,
    FormzSubmissionStatus? status,
  }) {
    return MyFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, password, status];
}
