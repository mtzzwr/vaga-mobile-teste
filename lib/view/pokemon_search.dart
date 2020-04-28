import 'package:flutter/material.dart';
import 'package:pokedex_flutter/controller/pokemon_controller.dart';
import 'package:pokedex_flutter/model/pokemon.dart';
import 'package:pokedex_flutter/view/widgets/pokemon_card.dart';

class PokemonSearch extends StatefulWidget {
  PokemonSearch({Key key}) : super(key: key);

  @override
  _PokemonSearchState createState() => _PokemonSearchState();
}

class _PokemonSearchState extends State<PokemonSearch> {
  final nameController = TextEditingController();

  Pokemon pokemon;
  String name;

  Future<Pokemon> getPokemons() async {
    var name = nameController.text;
    if(name.isEmpty) return null;
    pokemon = await PokemonController.getPokemonByName(name);
    setState(() {
      pokemon = pokemon;
    });
    return pokemon;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Escreva o nome de um Pokémon',
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      getPokemons();
                    },
                    child: Text(
                      'Pesquisar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: pokemon != null ? pokemonSearched() : Container(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget pokemonSearched() {
    return PokemonCard(pokemon: pokemon,);
  }
}
