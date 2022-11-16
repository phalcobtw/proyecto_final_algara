//Eventos
import 'package:bloc/bloc.dart';

class EventoVerificacion{}

class Creado extends EventoVerificacion{}


//Estados
class EstadoVerificacion{}

class Creandose extends EstadoVerificacion{}

class PantallaInicio extends EstadoVerificacion{}


class ClaseBloc extends Bloc<EventoVerificacion, EstadoVerificacion> {
  ClaseBloc() : super(Creandose()) {
    on<Creado>((event, emit) {
      emit(PantallaInicio());
    });
  }
}