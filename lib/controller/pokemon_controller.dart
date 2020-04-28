import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex_flutter/model/pokemon.dart';
import 'package:http/http.dart' as http;

const String POKEMON_API_URL = "https://pokeapi.co/api/v2/pokemon/\$/";

class PokemonController {
  static Future<Pokemon> getPokemonById(int id) async {
    final response =
        await http.get(POKEMON_API_URL.replaceAll("\$", id.toString()));
    if (response.statusCode == 200) {
      return Pokemon.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  static Future<Pokemon> getPokemonByName(String name) async {
    final response =
        await http.get(POKEMON_API_URL.replaceAll("\$", name.toLowerCase()));
    if (response.statusCode == 200) {
      return Pokemon.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  static Color changeColor({String type}) {
    switch (type) {
      case 'normal':
        return Colors.brown[400];
        break;
      case 'fire':
        return Colors.red;
        break;
      case 'water':
        return Colors.blue;
        break;
      case 'grass':
        return Colors.green;
        break;
      case 'electric':
        return Colors.amber;
        break;
      case 'ice':
        return Colors.cyanAccent[400];
        break;
      case 'fighting':
        return Colors.orange;
        break;
      case 'poison':
        return Colors.purple;
        break;
      case 'ground':
        return Colors.orange[300];
        break;
      case 'flying':
        return Colors.indigo[200];
        break;
      case 'psychic':
        return Colors.pink;
        break;
      case 'bug':
        return Colors.lightGreen[500];
        break;
      case 'rock':
        return Colors.grey;
        break;
      case 'ghost':
        return Colors.indigo[400];
        break;
      case 'dark':
        return Colors.brown;
        break;
      case 'dragon':
        return Colors.indigo[800];
        break;
      case 'steel':
        return Colors.blueGrey;
        break;
      case 'fairy':
        return Colors.pinkAccent[100];
        break;
      default:
        return Colors.grey;
        break;
    }
  }
}
