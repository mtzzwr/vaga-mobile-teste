import 'package:flutter/material.dart';
import 'package:pokedex_flutter/controller/pokemon_controller.dart';
import 'package:pokedex_flutter/model/pokemon.dart';
import 'package:pokedex_flutter/view/pokemon_list.dart';
import 'package:pokedex_flutter/view/pokemon_search.dart';

enum OrderOptions { orderaz, orderza }

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Pokédex',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: TabBar(tabs: [
            Tab(
              child: Text(
                'Pokédex',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Tab(
              child: Text(
                'Buscar Pokémon',
                style: TextStyle(color: Colors.black),
              ),
            )
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: PokemonList()
                  ),
                ],
              ),
            ),
            PokemonSearch()
          ],
        ),
      ),
    );
  }
}
