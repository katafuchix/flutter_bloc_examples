import 'package:equatable/equatable.dart';

// abstractであるため、このクラス自体をインスタンス化することはできません。
abstract class ThecocktaildbSearchEvent extends Equatable {
  const ThecocktaildbSearchEvent();
}

final class TextChanged extends ThecocktaildbSearchEvent {
  final String text;

  const TextChanged({required this.text});

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'TextChanged { text: $text }';
}
