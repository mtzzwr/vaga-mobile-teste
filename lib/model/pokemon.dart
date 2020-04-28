import 'dart:convert';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/controller/pokemon_controller.dart';
import 'package:pokedex_flutter/model/pokemon_abilities.dart';
import 'package:pokedex_flutter/model/pokemon_stat.dart';
import 'package:pokedex_flutter/model/pokemon_type.dart';
import 'package:pokedex_flutter/view/pokemon_details.dart';

class Pokemon {
  final String name;
  final String body;
  final int weight;
  final int height;
  final int id;
  final String spriteUrl;
  final List<Stat> stats;
  final List<PokemonType> types;
  final List<Abilities> abilities;
  final Image image;

  Pokemon(
      {this.types,
      this.image,
      this.height,
      this.stats,
      this.name,
      this.body,
      this.weight,
      this.id,
      this.abilities,
      this.spriteUrl});

  String getReadableName() {
    String nameString = name;
    return StringUtils.capitalize(nameString);
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    List<Stat> stats = List<Stat>();
    if (json['stats'] != null) {
      json['stats'].forEach((value) {
        Stat stat = Stat.fromJson(value);
        stats.add(stat);
      });
    }

    List<PokemonType> types = List<PokemonType>();
    if (json['types'] != null) {
      json['types'].forEach((value) {
        PokemonType type = PokemonType.fromJson(value);
        types.add(type);
      });
    }

    List<Abilities> abilities = List<Abilities>();
    if (json['abilities'] != null) {
      json['abilities'].forEach((value) {
        Abilities ability = Abilities.fromJson(value);
        abilities.add(ability);
      });
    }

    return Pokemon(
      name: json['name'],
      body: json['body'],
      weight: json['weight'],
      id: json['id'],
      spriteUrl: json['sprites']['front_default'],
      stats: stats,
      types: types,
      abilities: abilities,
      height: json['height'],
      image: Image.network(
        json['sprites']['front_default'],
      ),
    );
  }
}
