import 'package:fpdart/fpdart.dart';
import 'package:proyecto_final/problemas.dart';
import 'package:proyecto_final/registro/registro_personaje.dart';
import 'package:proyecto_final/registro/registro_wand.dart';

abstract class RepositorioPersonaje{
  Either<Problemas, Set<Personaje>> obtenerPersonaje(dynamic jsonDePersonajes);
  Either<Problemas, Set<Wand>> obtenerInfoWands(dynamic jsonDePersonajes);
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
  
  @override
  Either<Problemas, Set<Wand>> obtenerInfoWands(jsonDePersonajes) {
    try {
      Set<Wand> setWands = {};
      for (var wands in jsonDePersonajes) {
        if (wands["wand"]["wood"] != "") {
          setWands.add(Wand.constructor(jsonElement: wands));
        }
      }
      return Right(setWands);
    } catch (e) {
      return Left(VersionDeJsonInvalida());
    }
  }
}