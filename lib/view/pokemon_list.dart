import 'package:flutter/material.dart';
import 'package:pokedex_flutter/controller/pokemon_controller.dart';
import 'package:pokedex_flutter/model/pokemon.dart';
import 'package:pokedex_flutter/view/widgets/pokemon_card.dart';

class PokemonList extends StatefulWidget {
  PokemonList({Key key}) : super(key: key);

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  Pokemon pokemon;

  Future<Pokemon> getPokemons(int index) async {
    pokemon = await PokemonController.getPokemonById(index);
    return pokemon;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 964,
      itemBuilder: (BuildContext context, int index) {
        return FutureBuilder(
          future: getPokemons(index + 1),
          builder: (BuildContext z, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == null) {
                return Text("Erro");
              }
              return PokemonCard(pokemon: snapshot.data,);
            } else if (snapshot.hasError) {
              return Text("Erro");
            }
            return Card(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        );
      },
    );
  }
}
