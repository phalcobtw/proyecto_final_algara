import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_final/repositorios/repositorio_json.dart';

void main() {
  RepositorioJson repoJson = RepositorioJsonOnline();
  group('TESTEOS CON REPOSITORIO ONLINE', () {
    test('obtengo json personajes', () async{
      final resultado = await repoJson.obtenerJSONPersonaje();
      expect(resultado.isRight(), true);
    });
    test('obtengo json hechizos', () async{
      final resultado = await repoJson.obtenerJSONSpells();
      expect(resultado.isRight(), true);
    });
    test('obtengo info de personajes desde el json', () async {
      final resultado = await repoJson.obtenerJSONPersonaje();
      final cursor = resultado.getOrElse((l) => null);
      expect(cursor[1]["name"], equals("Hermione Granger"));
    });
    test('obtengo info de wand de personaje', () async {
      final resultado = await repoJson.obtenerJSONPersonaje();
      final cursor = resultado.getOrElse((l) => null);
      expect(cursor[1]["wand"]["wood"], equals("vine"));
    });
    test('obtengo info de hechizos', () async {
      final resultado = await repoJson.obtenerJSONSpells();
      final cursor = resultado.getOrElse((l) => null);
      expect(cursor[1]["name"], equals("Accio"));
    });
    test('obtengo desc de hechizos', () async {
      final resultado = await repoJson.obtenerJSONSpells();
      final cursor = resultado.getOrElse((l) => null);
      expect(cursor[1]["description"], equals("Summons objects"));
    });
  });
}