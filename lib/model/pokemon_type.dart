import 'package:flutter/material.dart';

class PokemonType {
  final int slot;
  final String name;
  final String url;

  PokemonType({this.slot, this.name, this.url});

  String getReadableName() {
    String nameString = name;
    nameString = nameString.substring(0, 1).toUpperCase() +
        nameString.substring(1, nameString.length);
    nameString = nameString.replaceAll("-", " ");
    return nameString;
  }

  Widget getListTile(BuildContext context) {
    return ListTile(
      title: Text(getReadableName()),
      subtitle: Text(slot.toString()),
    );
  }

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonType(
      slot: json['slot'],
      name: json['type']['name'],
      url: json['type']['url']
    );
  }
}
