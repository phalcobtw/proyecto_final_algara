import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_final/repositorios/repositorio_personaje.dart';

void main() {
  String jsonRecortado = """[
{
  "name":"Ron Weasley",
  "alternate_names":["Dragomir Despard"],
  "species":"human",
  "gender":"male",
  "house":"Gryffindor",
  "dateOfBirth":"01-03-1980",
  "yearOfBirth":1980,
  "wizard":true,
  "ancestry":"pure-blood",
  "eyeColour":"blue",
  "hairColour":"red",
  "wand":{"wood":"willow",
  "core":"unicorn tail-hair",
  "length":14},
  "patronus":"Jack Russell terrier",
  "hogwartsStudent":true,
  "hogwartsStaff":false,
  "actor":"Rupert Grint",
  "alternate_actors":[],
  "alive":true,
  "image":"https://hp-api.herokuapp.com/images/ron.jpg"
  },
  {
    "name":"Draco Malfoy",
    "alternate_names":[],
    "species":"human",
    "gender":"male",
    "house":"Slytherin",
    "dateOfBirth":"05-06-1980",
    "yearOfBirth":1980,
    "wizard":true,
    "ancestry":"pure-blood",
    "eyeColour":"grey",
    "hairColour":"blonde",
    "wand":{"wood":"hawthorn",
    "core":"unicorn tail-hair",
    "length":10},
    "patronus":"",
    "hogwartsStudent":true,
    "hogwartsStaff":false,
    "actor":"Tom Felton",
    "alternate_actors":[],
    "alive":true,
    "image":"https://hp-api.herokuapp.com/images/draco.jpg"
    }
   ]""";

  JsonDecoder decoder = const JsonDecoder();
  final objeto = decoder.convert(jsonRecortado);
  group('TEST DE PERSONAJES Y COSAS NO SE xd', () {
    test('TEST OBTENER PERSONAJE DRACO', () {
      RepositorioPersonaje repositorio = RepositorioPersonajePruebas();
      final resultado = repositorio.obtenerPersonaje(objeto);
      resultado.match((l) => null, (r) {
        expect(r.last.nombre, equals("Draco Malfoy"));
      });
    });
    test('TEST OBTENER PERSONAJE RON', () {
      RepositorioPersonaje repositorio = RepositorioPersonajePruebas();
      final resultado = repositorio.obtenerPersonaje(objeto);
      resultado.match((l) => null, (r) {
        expect(r.first.nombre, equals("Ron Weasley"));
      });
    });
    test('Se llena el set con la info', () {
      RepositorioPersonaje repositorio = RepositorioPersonajePruebas();
      final resultado = repositorio.obtenerPersonaje(objeto);
      expect(resultado.isRight(), true);
    });
  });
}
