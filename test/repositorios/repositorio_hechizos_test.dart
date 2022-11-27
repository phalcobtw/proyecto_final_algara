import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_final/repositorios/repositorio_hechizos.dart';

void main() {
  String jsonHechizos = """[
    {
    "name":"Homenum Revelio",
    "description":"Reveals the presence of another person"
    },
    {
    "name":"Homonculus Charm",
    "description":"Detects anyone's true identity and location on a piece of parchment; used to create the Marauder's Map"
    },
    {
    "name":"Immobulus",
    "description":"Immobilises living targets"
    },
    {
    "name":"Impedimenta",
    "description":"A temporary jinx that slows the movement of the target"
    },
    {
    "name":"Incarcerous",
    "description":"Conjures ropes"
    },
    {
    "name":"Imperio",
    "description":"One of the three Unforgivable Curses, it places the target under the complete control of the caster"
    },
    {
    "name":"Impervius",
    "description":"Makes an object waterproof"
    }
  ]""";

  JsonDecoder decoder = const JsonDecoder();
  final objeto = decoder.convert(jsonHechizos);
  RepositorioHechizos repositorio = RepositorioHechizosPruebas();
  group('tests para los hechizos', () {
    test('obtengo la info de los hechizos', () {
      final resultado = repositorio.obtenerHechizos(objeto);
      expect(resultado.isRight(), true);
    });
    test('saco info de un hechizo', () {
      final resultado = repositorio.obtenerHechizos(objeto);
      resultado.match((l) => null, (r) {
        expect(r.toList()[4].nombre, equals("Incarcerous"));
      });
    });
    test('devuelve 7 resultados', () {
      final resultado = repositorio.obtenerHechizos(objeto);
      resultado.match((l) => null, (r) {
        expect(r.length, equals(7));
      });
    });
    test('obtengo la desc del hechizo', () {
      final resultado = repositorio.obtenerHechizos(objeto);
      resultado.match((l) => null, (r) {
        expect(r.toList()[4].desc, equals("Conjures ropes"));
      });
    });
  });
}