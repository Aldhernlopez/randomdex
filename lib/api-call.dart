import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:randomdex/models/pokemon-model.dart';

Future<Pokemon> fetchPokemon() async{
  final int id = Random().nextInt(1025)+1;
  final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'));
  if(response.statusCode == 200){
    final jsonResponse = json.decode(response.body);
    return Pokemon.fromJson(jsonResponse);
  }
  else {
    throw Exception('Unable to load Pokemon');
  }
}