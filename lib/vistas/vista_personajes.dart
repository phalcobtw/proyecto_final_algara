import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/registro/registro_personaje.dart';

import '../clases.dart';

class VistaListaPersonajes extends StatelessWidget {
  const VistaListaPersonajes({super.key, required this.setPersonaje});

  final Set<Personaje> setPersonaje;

  @override
  Widget build(BuildContext context) {
    List<Personaje> listaPersonajes = setPersonaje.toList();
    return Column(
      children: [
        Expanded(child: ListView.builder(itemCount: setPersonaje.length,itemBuilder: (context, index){
          return ListTile(
            leading: Text((index + 1).toString()),
            title: Text(listaPersonajes[index].nombre.toString()),
            subtitle: Text(listaPersonajes[index].casa.toString()),
            /* trailing: Text(listaPersonajes[index]..toString()), */
          );
        })),
        FloatingActionButton(onPressed: (){
          var bloc = context.read<ClaseBloc>();
          bloc.add(Creado());
        },child: const Text('Regresr'),
        )
      ],
    );
  }
}