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
  void initState(){
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      final isButtonActive = controller.text.isNotEmpty;

      setState(() => this.isButtonActive = isButtonActive);
    });
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: (){}, child: Text('Ver Personajes')),
      ],
    );
  }
}