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

class CargarPersonajeFiltrado extends EventoVerificacion{
  final String nombrePersonaje;

  CargarPersonajeFiltrado(this.nombrePersonaje);

}

class CargarHechizoFiltrado extends EventoVerificacion{
  final String hechizoAFiltrar;

  CargarHechizoFiltrado(this.hechizoAFiltrar);
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

class MostrarVistaError extends EstadoVerificacion{}

/* class MostrarProfesores extends EstadoVerificacion{}

class MostrarEstudiantes extends EstadoVerificacion{} */

class MostrarInfoCasa extends EstadoVerificacion{}


class ClaseBloc extends Bloc<EventoVerificacion, EstadoVerificacion> {
  RepositorioPersonaje repoPersonajes = RepositorioPersonajePruebas();
  RepositorioHechizos repoSpells = RepositorioHechizosPruebas();
  RepositorioJson repoJson = RepositorioJsonOnline();
  late Either<Problemas, dynamic> jsonPersonajes;
  late Either<Problemas, dynamic> jsonSpells;
  late dynamic respuestaPersonajes;
  late dynamic respuestaSpells;
  ClaseBloc() : super(Creandose()) {
    on<Creado>((event, emit) async {
      jsonPersonajes = await repoJson.obtenerJSONPersonaje();
      respuestaPersonajes = jsonPersonajes.getOrElse((l) => emit(MostrarVistaError()));
      jsonSpells = await repoJson.obtenerJSONSpells();
      respuestaSpells = jsonSpells.getOrElse((l) => emit(MostrarVistaError()));
      emit(PantallaInicio());
    });
    on<CargarPersonajes>((event, emit) {
      Either<Problemas, Set<Personaje>> setPersonajes = repoPersonajes.obtenerPersonaje(respuestaPersonajes);
      setPersonajes.match((l) {
        emit(MostrarVistaError());
      }, (r) {
        emit(MostrarPersonajes(setPersonajes: r));
      });
    });
    on<CargarHechizos>((event, emit) {
      Either<Problemas, Set<Hechizos>> setHechizos = repoSpells.obtenerHechizos(respuestaSpells);
      setHechizos.match((l) {
        emit(MostrarVistaError());
      }, (r) {
        emit(MostrarHechizos(setHechizos: r));
      });
    });
    on<CargarEstudiantes>((event, emit) {
      Either<Problemas,Set<Personaje>> setPersonajes = repoPersonajes.obtenerPersonaje(respuestaPersonajes);
      setPersonajes.match((l) {
        emit(MostrarVistaError());
      }, (r) {
        Iterable<Personaje> listaEstudiantes = r.where((personaje) => personaje.student == true);
        emit(MostrarPersonajes(setPersonajes: listaEstudiantes.toSet()));
      });
    });
    on<CargarPersonajeFiltrado>((event, emit) {
      Either<Problemas,Set<Personaje>> setPersonajes = repoPersonajes.obtenerPersonaje(respuestaPersonajes);
      setPersonajes.match((l) {
        emit(MostrarVistaError());
      }, (r) {
        Iterable<Personaje> listaEstudiantes = r.where((personaje) => personaje.nombre == event.nombrePersonaje);
        emit(MostrarPersonajes(setPersonajes: listaEstudiantes.toSet()));
      });
    });
    on<CargarHechizoFiltrado>((event, emit) {
      Either<Problemas,Set<Hechizos>> setHechizos = repoSpells.obtenerHechizos(respuestaSpells);
      setHechizos.match((l) {
        emit(MostrarVistaError());
      }, (r) {
        Iterable<Hechizos> listaHechizos = r.where((hechizo) => hechizo.nombre == event.hechizoAFiltrar);
        emit(MostrarHechizos(setHechizos: listaHechizos.toSet()));
      });
    });
    on<CargarProfesores>((event, emit) {
      Either<Problemas,Set<Personaje>> setPersonajes = repoPersonajes.obtenerPersonaje(respuestaPersonajes);
      setPersonajes.match((l) {
        emit(MostrarVistaError());
      }, (r) {
        Iterable<Personaje> listaProfesores = r.where((personaje) => personaje.staff == true);
        emit(MostrarPersonajes(setPersonajes: listaProfesores.toSet()));
      });
    });
    on<CargarInfoCasa>((event, emit) {
      Either<Problemas, Set<Personaje>> setPersonajes = repoPersonajes.obtenerPersonaje(respuestaPersonajes);
      setPersonajes.match((l) {
        emit(MostrarVistaError());
      }, (r) {
        Iterable<Personaje> listaPersonajesCasa = r.where((personaje) => personaje.casa == event.nombreCasa);
        emit(MostrarPersonajes(setPersonajes: listaPersonajesCasa.toSet()));
      });
    });
  }
}