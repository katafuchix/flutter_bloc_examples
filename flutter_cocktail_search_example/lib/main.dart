import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './bloc/thecocktaildb_search_bloc.dart';
import './repository/thecocktaildb_cache.dart';
import './repository/thecocktaildb_client.dart';
import './repository/thecocktaildb_repository.dart';
import './ui/search_form.dart';

void main() {
  final thecocktaildbRepository = ThecocktaildbRepository(
    ThecocktaildbCache(),
    ThecocktaildbClient(),
  );
  runApp(App(thecocktaildbRepository: thecocktaildbRepository));
}


class App extends StatelessWidget {
  final ThecocktaildbRepository thecocktaildbRepository;

  const App({required this.thecocktaildbRepository, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Search',
      home: Scaffold(
        appBar: AppBar(title: const Text('The Cocktail DB Search'),
                        backgroundColor: Theme.of(context).colorScheme.inversePrimary),
        body: BlocProvider(
          create: (_) => ThecocktaildbSearchBloc(thecocktaildbRepository: thecocktaildbRepository),
          child: const SearchForm(),
        ),
      ),
    );
  }
}
