import 'package:fpdart/fpdart.dart';
import 'package:proyecto_final/problemas.dart';
import 'package:proyecto_final/registro/registro_hechizos.dart';

abstract class RepositorioHechizos{
  Either<Problemas, Set<Hechizos>> obtenerHechizos(dynamic jsonDeHechizos);
}

class RepositorioHechizosPruebas extends RepositorioHechizos{
  @override
  Either<Problemas, Set<Hechizos>> obtenerHechizos(jsonDeHechizos) {
    try {
      Set<Hechizos> setHechizos = {};
      for (var hechizo in jsonDeHechizos) {
        setHechizos.add(Hechizos.constructor(jsonElement: hechizo));
      }
      return Right(setHechizos);
    } catch (e) {
      return Left(VersionDeJsonInvalida());
    }
  }

}