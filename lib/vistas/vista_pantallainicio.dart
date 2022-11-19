import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../clases.dart';

class VistaPantallaInicio extends StatefulWidget {
  const VistaPantallaInicio({super.key});

  @override
  State<VistaPantallaInicio> createState() => _VistaPantallaInicioState();
}

class _VistaPantallaInicioState extends State<VistaPantallaInicio> {
  bool isButtonActive = false;
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
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
            SizedBox(child: Text('VER LISTA COMPLETA SIN FILTRAR',style: const TextStyle(fontWeight: FontWeight.bold),),height: 30,),
            Container(
              width: 200,
              height: 35,
              child: ElevatedButton(onPressed: () {}, child: Text('Ver Personajes')),
            ),
            SizedBox(height: 15),
            Container(
              width: 200,
              height: 35,
              child: ElevatedButton(onPressed: () {}, child: Text('Ver Hechizos')),
            ),
            SizedBox(height: 75),
            SizedBox(height: 30,child: Text('VER LISTA FILTRADA',style: const TextStyle(fontWeight: FontWeight.bold),),),
            Container(
              width: 200,
              height: 35,
              child: ElevatedButton(onPressed: (){}, child: Text('Ver Estudiantes')),
            ),
            SizedBox(height: 15),
            Container(
              width: 200,
              height: 35,
              child: ElevatedButton(onPressed: (){}, child: Text('Ver Profesores')),
            ),
            SizedBox(height: 75),
            SizedBox(height: 30,child: Text('VER ESCUELAS/CASAS',style: const TextStyle(fontWeight: FontWeight.bold),),),
            Container(
              width: 200,
              height: 35,
              child: ElevatedButton(onPressed: (){}, child: Text('Gryffindor')),
            ),
            SizedBox(height: 15),
            Container(
              width: 200,
              height: 35,
              child: ElevatedButton(onPressed: (){}, child: Text('Hufflepuff')),
            ),
            SizedBox(height: 15),
            Container(
              width: 200,
              height: 35,
              child: ElevatedButton(onPressed: (){}, child: Text('Ravenclaw')),
            ),
            SizedBox(height: 15),
            Container(
              width: 200,
              height: 35,
              child: ElevatedButton(onPressed: (){}, child: Text('Slytherin')),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
