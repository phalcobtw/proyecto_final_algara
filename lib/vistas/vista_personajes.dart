import 'package:cached_network_image/cached_network_image.dart';
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: ListView.builder(itemCount: setPersonaje.length,itemBuilder: (context, index){
          return ListTile(
            leading: Image(image: NetworkImage(listaPersonajes[index].imagenurl)),
            title: Text(listaPersonajes[index].nombre.toString()),      
            subtitle: Column(
                  children: [
                    Text("Genero: ${listaPersonajes[index].genero}"),
                    Text("Casa: ${listaPersonajes[index].casa}"),
                    Text("Raza: ${listaPersonajes[index].raza}"),
                    Text("Fecha de Nacimiento: ${listaPersonajes[index].fechaNacimiento} de ${listaPersonajes[index].anioNacimiento}"),
                    Text("Cabello color ${listaPersonajes[index].colorDeCabello} y ojos ${listaPersonajes[index].colorDeOjos}"),
                    Text("Patronus: ${listaPersonajes[index].patronus}"),
                    Text("Nombre del Actor/Actriz: ${listaPersonajes[index].actorNombre}"),
                    Text("Estado actual (Vivo/Muerto): ${listaPersonajes[index].tavivo}")
                  ],
                ),
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