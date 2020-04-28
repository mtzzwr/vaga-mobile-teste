import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Abilities {
  final bool isHidden;
  final int slot;
  final String name;
  final String url;

  Abilities({this.isHidden, this.slot, this.name, this.url});

  String getReadableName() {
    String nameString = name;
    return StringUtils.capitalize(nameString);
  }

  factory Abilities.fromJson(Map<String, dynamic> json) {
    return Abilities(
      name: json['ability']['name'],
      url: json['ability']['url'],
      isHidden: json['is_hidden'],
      slot: json['slot'],
    );
  }
}
