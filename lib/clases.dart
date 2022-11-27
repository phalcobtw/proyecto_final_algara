//Eventos
import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:proyecto_final/problemas.dart';
import 'package:proyecto_final/registro/registro_hechizos.dart';
import 'package:proyecto_final/registro/registro_personaje.dart';
import 'package:proyecto_final/repositorios/repositorio_hechizos.dart';
import 'package:proyecto_final/repositorios/repositorio_json.dart';
import 'package:proyecto_final/repositorios/repositorio_personaje.dart';

class EventoVerificacion{}

class Creado extends EventoVerificacion{}

class CargarPersonajes extends EventoVerificacion{}

class CargarHechizos extends EventoVerificacion{}

class CargarProfesores extends EventoVerificacion{}

class CargarEstudiantes extends EventoVerificacion{}

class CargarInfoCasa extends EventoVerificacion{
   final String nombreCasa;

  CargarInfoCasa(this.nombreCasa);
}


//Estados
class EstadoVerificacion{}

class Creandose extends EstadoVerificacion{}

class PantallaInicio extends EstadoVerificacion{}

class MostrarPersonajes extends EstadoVerificacion{
  final Set<Personaje> setPersonajes;
  MostrarPersonajes({required this.setPersonajes});
}

class MostrarHechizos extends EstadoVerificacion{
  final Set<Hechizos> setHechizos;
  MostrarHechizos({required this.setHechizos});
}

/* class MostrarProfesores extends EstadoVerificacion{}

class MostrarEstudiantes extends EstadoVerificacion{} */

class MostrarInfoCasa extends EstadoVerificacion{}


class ClaseBloc extends Bloc<EventoVerificacion, EstadoVerificacion> {
  RepositorioPersonaje repoPersonajes = RepositorioPersonajePruebas();
  RepositorioJson repoJson = RepositorioJsonOnline();
  late dynamic respuestaPersonajes;
  late dynamic respuestaSpells;
  RepositorioHechizos repoSpells = RepositorioHechizosPruebas();
  ClaseBloc() : super(Creandose()) {
    on<Creado>((event, emit) async {
      respuestaPersonajes = await repoJson.obtenerJSONPersonaje();
      respuestaSpells = await repoJson.obtenerJSONSpells();
      emit(PantallaInicio());
    });
    on<CargarPersonajes>((event, emit) {
      Either<Problemas, Set<Personaje>> setPersonajes = repoPersonajes.obtenerPersonaje(respuestaPersonajes);
      setPersonajes.match((l) => null, (r) {
        emit(MostrarPersonajes(setPersonajes: r));
      });
    });
    on<CargarHechizos>((event, emit) {
      Either<Problemas, Set<Hechizos>> setHechizos = repoSpells.obtenerHechizos(respuestaSpells);
      setHechizos.match((l) => null, (r) {
        emit(MostrarHechizos(setHechizos: r));
      });
    });
    on<CargarEstudiantes>((event, emit) {
      Either<Problemas,Set<Personaje>> setPersonajes = repoPersonajes.obtenerPersonaje(respuestaPersonajes);
      setPersonajes.match((l) => null, (r) {
        Iterable<Personaje> listaEstudiantes = r.where((personaje) => personaje.student == true);
        emit(MostrarPersonajes(setPersonajes: listaEstudiantes.toSet()));
      });
    });
    on<CargarProfesores>((event, emit) {
      Either<Problemas,Set<Personaje>> setPersonajes = repoPersonajes.obtenerPersonaje(respuestaPersonajes);
      setPersonajes.match((l) => null, (r) {
        Iterable<Personaje> listaProfesores = r.where((personaje) => personaje.staff == true);
        emit(MostrarPersonajes(setPersonajes: listaProfesores.toSet()));
      });
    });
    on<CargarInfoCasa>((event, emit) {
      Either<Problemas, Set<Personaje>> setPersonajes = repoPersonajes.obtenerPersonaje(respuestaPersonajes);
      setPersonajes.match((l) => null, (r) {
        Iterable<Personaje> listaPersonajesCasa = r.where((personaje) => personaje.casa == event.nombreCasa);
        emit(MostrarPersonajes(setPersonajes: listaPersonajesCasa.toSet()));
      });
    });
  }
}