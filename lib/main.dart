import 'package:flutter/material.dart';
import 'package:proyecto_final/vistas/vista_creandose.dart';
import 'package:proyecto_final/vistas/vista_error.dart';
import 'package:proyecto_final/vistas/vista_hechizos.dart';
import 'package:proyecto_final/vistas/vista_pantallainicio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/vistas/vista_personajes.dart';
import 'clases.dart';

void main() {
  runApp(const AplicacionInyectada());
}

class AplicacionInyectada extends StatelessWidget {
  const AplicacionInyectada({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        ClaseBloc blocVerificacion=ClaseBloc();
        Future.delayed(Duration(seconds: 2),(){
          blocVerificacion.add(Creado());
        });
        return blocVerificacion;
      },
      child: const Aplicacion(),
    );
  }
}

class Aplicacion extends StatelessWidget {
  const Aplicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body: Builder(builder: (context){
          var estado = context.watch<ClaseBloc>().state;
          if(estado is Creandose){
            return VistaCreandose();
          }
          if (estado is PantallaInicio) {
            return VistaPantallaInicio();
          }
          if (estado is MostrarPersonajes) {
            return VistaListaPersonajes(setPersonaje: estado.setPersonajes);
          }
          if (estado is MostrarVistaError) {
            return VistaError();
          }
          if (estado is MostrarHechizos) {
            return VistaHechizos(setHechizos: estado.setHechizos);
          }
          return const Center(child: Text('Si estas viendo esto algo salio mal, HUYE'));

        }),
      )
    );
  }
}