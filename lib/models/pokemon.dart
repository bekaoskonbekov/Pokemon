import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'pokemon.freezed.dart';
part 'pokemon.g.dart'; 

@freezed
class Pokemon with _$Pokemon {
  const Pokemon._();

  const factory Pokemon(
    int id,{
    required String name,
    required List<String> types,
    required String imageUrl,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) {

    List<String> typesToList(dynamic types) {
      List<String> ret = [];
      for (int i = 0; i < types.length; i++) {
        ret.add(types[i]['type']['name']);
      }
      return ret;
    }
    return _$PokemonFromJson({
      'id': json['id'],
      'name': json['name'],
      'types': typesToList(json['types']),
      'imageUrl': json['sprites']['other']['official-artwork']['front_default'],
    });
  }
}