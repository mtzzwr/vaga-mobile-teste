import 'package:flutter/material.dart';
import 'package:pokedex_flutter/controller/pokemon_controller.dart';
import 'package:pokedex_flutter/model/pokemon.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class PokemonDetails extends StatefulWidget {
  final Pokemon pokemon;

  PokemonDetails({Key key, this.pokemon}) : super(key: key);

  @override
  _PokemonDetailsState createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PokemonController.changeColor(
        type: widget.pokemon.types.length < 2
            ? widget.pokemon.types[0].name
            : widget.pokemon.types[1].name,
      ),
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 200,
              width: double.infinity,
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  Text(
                    widget.pokemon.getReadableName(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                  Image.network(widget.pokemon.spriteUrl),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6),
                      child: Text(
                        widget.pokemon.types.length < 2
                            ? widget.pokemon.types[0].name
                            : widget.pokemon.types[1].name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text('Weight'),
                  Text(widget.pokemon.weight.toString()),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Height'),
                  Text(widget.pokemon.height.toString()),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Status',
                    style: TextStyle(fontSize: 26),
                  ),
                  Expanded(
                    flex: 2,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.pokemon.stats.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text(widget.pokemon.stats[index]
                                  .getReadableName()),
                              SizedBox(
                                height: 10,
                              ),
                              StepProgressIndicator(
                                totalSteps: 200,
                                currentStep:
                                    widget.pokemon.stats[index].baseStat,
                                size: 8,
                                padding: 0,
                                selectedColor: PokemonController.changeColor(
                                  type: widget.pokemon.types.length < 2
                                      ? widget.pokemon.types[0].name
                                      : widget.pokemon.types[1].name,
                                ),
                                unselectedColor: Colors.grey[300],
                                roundedEdges: Radius.circular(10),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Text(
                    'Abilities',
                    style: TextStyle(fontSize: 26),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.pokemon.abilities.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Image.network(
                                    'https://imagensemoldes.com.br/wp-content/uploads/2020/04/Pokebola-Pok%C3%A9mon-PNG-1200x1197.png',
                                    height: 30,
                                    width: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(widget.pokemon.abilities[index]
                                      .getReadableName()),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
