import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../clases.dart';

class VistaPantallaInicio extends StatefulWidget {
  const VistaPantallaInicio({super.key});

  @override
  State<VistaPantallaInicio> createState() => _VistaPantallaInicioState();
}

class _VistaPantallaInicioState extends State<VistaPantallaInicio> {
  bool isButtonActive = false;
  bool isButtonActiveHechizos = false;
  late TextEditingController controller;
  late TextEditingController controllerHechizos;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controllerHechizos = TextEditingController();
    controllerHechizos.addListener(() { 
      final isButtonActiveHechizos = controllerHechizos.text.isNotEmpty;

      setState(() => this.isButtonActiveHechizos = isButtonActiveHechizos);
    });
    controller.addListener(() {
      final isButtonActive = controller.text.isNotEmpty;

      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(child: Text('BUSCAR PERSONAJE POR NOMBRE',style: const TextStyle(fontWeight: FontWeight.bold),),height: 30,),
            Container(
              width: 200,
              height: 35,
              child: TextField(controller: controller),      
            ),
            TextButton(onPressed: isButtonActive ? (){
              setState(() => isButtonActive = false);
              var bloc = context.read<ClaseBloc>();
              bloc.add(CargarPersonajeFiltrado(controller.text));
            }:null, child: Text("Buscar")),
            SizedBox(height: 15),
            SizedBox(child: Text('BUSCAR HECHIZO POR NOMBRE',style: const TextStyle(fontWeight: FontWeight.bold),),height: 30,),
            Container(
              width: 200,
              height: 35,
              child: TextField(controller: controllerHechizos),      
            ),
            TextButton(onPressed: isButtonActiveHechizos ? (){
              setState(() => isButtonActive = false);
              var bloc = context.read<ClaseBloc>();
              bloc.add(CargarHechizoFiltrado(controllerHechizos.text));
            }:null, child: Text("Buscar")),
            SizedBox(height: 15),
            SizedBox(child: Text('VER LISTA COMPLETA SIN FILTRAR',style: const TextStyle(fontWeight: FontWeight.bold),),height: 30,),
            Container(
              width: 200,
              height: 35,
              child: ElevatedButton(onPressed: () {
                var bloc = context.read<ClaseBloc>();
                bloc.add(CargarPersonajes());
              }, child: Text('Ver Personajes')),
            ),
            SizedBox(height: 15),
            Container(
              width: 200,
              height: 35,
              child: ElevatedButton(onPressed: () {
                var bloc = context.read<ClaseBloc>();
                bloc.add(CargarHechizos());
              }, child: Text('Ver Hechizos')),
            ),
            SizedBox(height: 75),
            SizedBox(height: 30,child: Text('VER LISTA FILTRADA',style: const TextStyle(fontWeight: FontWeight.bold),),),
            Container(
              width: 200,
              height: 35,
              child: ElevatedButton(onPressed: (){
                var bloc = context.read<ClaseBloc>();
                bloc.add(CargarEstudiantes());
              }, child: Text('Ver Estudiantes')),
            ),
            SizedBox(height: 15),
            Container(
              width: 200,
              height: 35,
              child: ElevatedButton(onPressed: (){
                var bloc = context.read<ClaseBloc>();
                bloc.add(CargarProfesores());
              }, child: Text('Ver Profesores')),
            ),
            SizedBox(height: 75),
            SizedBox(height: 30,child: Text('VER ESCUELAS/CASAS',style: const TextStyle(fontWeight: FontWeight.bold),),),
            Container(
              width: 200,
              height: 35,
              child: ElevatedButton(onPressed: (){
                var bloc = context.read<ClaseBloc>();
                bloc.add(CargarInfoCasa("Gryffindor"));
              }, child: Text('Gryffindor')),
            ),
            SizedBox(height: 15),
            Container(
              width: 200,
              height: 35,
              child: ElevatedButton(onPressed: (){
                var bloc = context.read<ClaseBloc>();
                bloc.add(CargarInfoCasa("Hufflepuff"));
              }, child: Text('Hufflepuff')),
            ),
            SizedBox(height: 15),
            Container(
              width: 200,
              height: 35,
              child: ElevatedButton(onPressed: (){
                var bloc = context.read<ClaseBloc>();
                bloc.add(CargarInfoCasa("Ravenclaw"));
              }, child: Text('Ravenclaw')),
            ),
            SizedBox(height: 15),
            Container(
              width: 200,
              height: 35,
              child: ElevatedButton(onPressed: (){
                var bloc = context.read<ClaseBloc>();
                bloc.add(CargarInfoCasa("Slytherin"));
              }, child: Text('Slytherin')),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
