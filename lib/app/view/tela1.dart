import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_sv_teste/app/my_app.dart';

class TelaEnvio extends StatelessWidget{
  const TelaEnvio({Key? key}) : super(key: key);

  @override
  
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela para Envio da Informação'),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(MyApp.tela2);
            }, icon: const Icon(Icons.data_thresholding_outlined))
        ],
        ),
        body: Column(children: [
          Form(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Digite uma informação',
                labelStyle: TextStyle(fontSize:16, color: Color.fromARGB(78, 0, 0, 0)),
                border: OutlineInputBorder(),
              ),
            ),)
        ]),
      );
  }
}