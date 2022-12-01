import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:proyecto_final/problemas.dart';
import 'package:http/http.dart' as http;

abstract class RepositorioJson{
  Future<Either<Problemas, dynamic>> obtenerJSONPersonaje();
  Future<Either<Problemas, dynamic>> obtenerJSONSpells();
}


class RepositorioJsonOnline extends RepositorioJson{
  @override
  Future<Either<Problemas, dynamic>> obtenerJSONPersonaje() async {
    try {
      final respuesta = await http.get(Uri.parse('https://hp-api.onrender.com/api/characters'));
      String docJsonPersonajes = respuesta.body;
      JsonDecoder decoder = const JsonDecoder();
      final objeto = decoder.convert(docJsonPersonajes);
      return Right(objeto);
    } catch (e) {
      return Left(VersionDeJsonInvalida());
    }
  }

  @override
  Future<Either<Problemas, dynamic>> obtenerJSONSpells() async{
    try {
      final respuesta = await http.get(Uri.parse('https://hp-api.onrender.com/api/spells'));
      String docJsonSpells = respuesta.body;
      JsonDecoder decoder = const JsonDecoder();
      final objeto = decoder.convert(docJsonSpells);
      return Right(objeto);
    } catch (e) {
      return Left(VersionDeJsonInvalida());
    }
  }

}