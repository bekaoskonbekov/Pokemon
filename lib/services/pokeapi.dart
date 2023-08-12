import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

import '../constants/constant.dart';
import '../models/pokemon.dart';

Future<Pokemon> fetchPokemon(String id) async {
  String url = "$baseUrl/pokemon/$id";
  debugPrint("url: $url");
  final res = await http.get(Uri.parse(url));
  if (res.statusCode == 200) {
    final resString = res.body;
    final decoded = jsonDecode(resString);
    return Pokemon.fromJson(decoded);
  } else {
    throw Exception('Failed to Load Pokemon');
  }
}