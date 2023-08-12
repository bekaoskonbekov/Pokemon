import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../services/pokeapi.dart';
import '../models/pokemon.dart';

final pokeMapProvider = ChangeNotifierProvider((ref) => PokeMapNotifier());

class PokeMapNotifier extends ChangeNotifier {
  Map<String, Pokemon> pokeMap = {};
  void add(String id) {
    if (pokeMap[id] == null) {
      fetchPokemon(id).then((pokemon) {
        pokeMap[id.toString()] = pokemon;
        notifyListeners();
      }).catchError((err) {
      });
    }
  }

}