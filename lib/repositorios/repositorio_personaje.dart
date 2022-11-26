import 'package:fpdart/fpdart.dart';
import 'package:proyecto_final/problemas.dart';
import 'package:proyecto_final/registro/registro_personaje.dart';

abstract class RepositorioPersonaje{
  Either<Problemas, Set<Personaje>> obtenerPersonaje(dynamic jsonDePersonajes);
}

class RepositorioPersonajePruebas extends RepositorioPersonaje{
  @override
  Either<Problemas, Set<Personaje>> obtenerPersonaje(jsonDePersonajes) {
    try {
      Set<Personaje> setDePersonajes = {};
      for (var personaje in jsonDePersonajes) {
        setDePersonajes.add(Personaje.constructor(jsonElement: personaje));
      }
      return Right(setDePersonajes);
    } catch (e) {
      return Left(VersionDeJsonInvalida());
    }
  }

}