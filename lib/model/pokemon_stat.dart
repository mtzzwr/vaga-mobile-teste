import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stat {
  final int baseStat;
  final int effort;
  final String name;
  final String url;

  Stat({this.baseStat, this.effort, this.name, this.url});

  String getReadableName() {
    String nameString = name;
    return StringUtils.capitalize(nameString);
  }

  Widget getListTile(BuildContext context)
  {
    return ListTile(
      title: Text(getReadableName()),
      subtitle: Text(baseStat.toString()),
    );
  }

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(
      name: json['stat']['name'],
      url: json['stat']['url'],
      effort: json['effort'],
      baseStat: json['base_stat'],
    );
  }
}
