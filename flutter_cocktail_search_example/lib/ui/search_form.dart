import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../bloc/thecocktaildb_search_bloc.dart';
import '../bloc/thecocktaildb_search_event.dart';
import '../bloc/thecocktaildb_search_state.dart';
import '../model/drink.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _SearchBar(),
        _SearchBody(),
      ],
    );
  }
}

class _SearchBar extends StatefulWidget {
  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  final _textController = TextEditingController();
  late ThecocktaildbSearchBloc _thecocktaildbSearchBloc;

  @override
  void initState() {
    super.initState();
    // contextは、Flutterフレームワークによって提供される、ウィジェットツリー内の現在のウィジェットのビルドコンテキストを表します。
    // FlutterのStateクラス内では、context変数は初期化する必要はありません。
    // context変数は、Stateオブジェクトが作成されたときに自動的に提供されるものであり、
    // Stateオブジェクトが所属するウィジェットツリーのビルドコンテキストを表します。
    _thecocktaildbSearchBloc = context.read<ThecocktaildbSearchBloc>();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      autocorrect: false,
      onChanged: (text) {
        _thecocktaildbSearchBloc.add(
          TextChanged(text: text),
        );
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        suffixIcon: GestureDetector(
          onTap: _onClearTapped,
          child: const Icon(Icons.clear),
        ),
        border: InputBorder.none,
        hintText: 'Enter a search term',
      ),
    );
  }

  void _onClearTapped() {
    _textController.text = '';
    _thecocktaildbSearchBloc.add(const TextChanged(text: ''));
  }
}

class _SearchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThecocktaildbSearchBloc, ThecocktaildbSearchState>(
      builder: (context, state) {
        return switch (state) {
          SearchStateEmpty() => const Text('Please enter a term to begin'),
          SearchStateLoading() => const CircularProgressIndicator.adaptive(),
          SearchStateError() => Text(state.error),
          SearchStateSuccess() => state.items.isEmpty
              ? const Text('No Results')
              : Expanded(child: _SearchResults(drinks: state.items)),
        };
      },
    );
  }
}

class _SearchResults extends StatelessWidget {
  final List<Drink> drinks;

  const _SearchResults({required this.drinks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: drinks.length,
      itemBuilder: (BuildContext context, int index) {
        return _SearchResultItem(item: drinks[index]);
      },
    );
  }
}

class _SearchResultItem extends StatelessWidget {
  final Drink item;

  const _SearchResultItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          child: Image.network(item.strDrinkThumb),
      ),
      title: Text(item.strDrink),
      //onTap: () => launchUrl(Uri.parse(item.htmlUrl)),
    );
  }
}
