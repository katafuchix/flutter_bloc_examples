import 'package:equatable/equatable.dart';

sealed class ThecocktaildbSearchEvent extends Equatable {
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
