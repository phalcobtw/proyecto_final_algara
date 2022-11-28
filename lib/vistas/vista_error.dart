import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../clases.dart';



class VistaError extends StatelessWidget {
  const VistaError({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,children: [
      Text('ERROR'),
      TextButton(onPressed: (){
        var bloc = context.read<ClaseBloc>();
        bloc.add(Creado());
      }, child: Text('Regresar'))
    ],);
  }
}