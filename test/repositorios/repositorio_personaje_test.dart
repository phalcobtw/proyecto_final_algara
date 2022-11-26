import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:proyecto_final/repositorios/repositorio_hechizos.dart';
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
  group('TEST DE PERSONAJES Y WANDS DE PESRSONAJES', () {
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
    test('obtengo info de varas', () {
      RepositorioPersonaje repositorio = RepositorioPersonajePruebas();
      final resultado = repositorio.obtenerInfoWands(objeto);
      expect(resultado.isRight(), true);
    });
    test('existe varita en el personaje de ambos', () {
      RepositorioPersonaje repositorio = RepositorioPersonajePruebas();
      final resultado = repositorio.obtenerInfoWands(objeto);
      resultado.match((l) => null, (r) {
        expect(r.length, equals(2));
      });
    });
    test('saco link de imagen', () {
      RepositorioPersonaje repositorio = RepositorioPersonajePruebas();
      final resultado = repositorio.obtenerPersonaje(objeto);
      resultado.match((l) => null, (r) {
        expect(r.first.imagenurl, equals("https://hp-api.herokuapp.com/images/ron.jpg"));
      });
    });
    test('actor de draco obtenido', () {
      RepositorioPersonaje repositorio = RepositorioPersonajePruebas();
      final resultado = repositorio.obtenerPersonaje(objeto);
      resultado.match((l) => null, (r) {
        expect(r.toList()[1].actorNombre, equals("Tom Felton"));
      });
    });
  });
}
