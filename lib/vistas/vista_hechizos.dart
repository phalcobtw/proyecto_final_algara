import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/registro/registro_hechizos.dart';

import '../clases.dart';


class VistaHechizos extends StatelessWidget {
  const VistaHechizos({super.key, required this.setHechizos});

  final Set<Hechizos> setHechizos;

  @override
  Widget build(BuildContext context) {
    List<Hechizos> listaHechizos = setHechizos.toList();
    return Column(
      children: [
        Expanded(child: ListView.builder(itemCount: setHechizos.length,itemBuilder: (context, index){
          return ListTile(
            leading: Text((index + 1).toString()),
            title: Text(listaHechizos[index].nombre.toString()),
            subtitle: Text(listaHechizos[index].desc.toString()),
            /* trailing: Text(listaPersonajes[index]..toString()), */
          );
        })),
        TextButton(onPressed: (){
          var bloc = context.read<ClaseBloc>();
          bloc.add(Creado());
        },child: const Text('Regresar'),
        )
      ],
    );
  }
}