import 'package:flutter/material.dart';
import 'package:flutter_application_sv_teste/app/my_app.dart';

class TelaLeitura extends StatelessWidget{
  const TelaLeitura({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela para Leitura da Informação'),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(MyApp.home);
            }, icon: const Icon(Icons.domain_verification))
        ],
        ),
      );
  }
}