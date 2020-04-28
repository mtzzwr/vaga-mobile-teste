import 'package:flutter/material.dart';
import 'package:pokedex_flutter/controller/pokemon_controller.dart';
import 'package:pokedex_flutter/model/pokemon.dart';
import 'package:pokedex_flutter/view/pokemon_details.dart';

class PokemonCard extends StatelessWidget {

  final Pokemon pokemon;

  const PokemonCard({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: PokemonController.changeColor(
        type: pokemon.types.length < 2 ? pokemon.types[0].name : pokemon.types[1].name,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PokemonDetails(
                  pokemon: pokemon,
                ),
              ),
            );
          },
          child: Column(
            children: <Widget>[
              Text(
                pokemon.getReadableName(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 6, right: 6),
                  child: Text(
                    pokemon.types.length < 2 ? pokemon.types[0].name : pokemon.types[1].name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Hero(
                tag: pokemon.name,
                child: pokemon.image,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
