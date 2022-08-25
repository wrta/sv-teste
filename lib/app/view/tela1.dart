// ignore_for_file: avoid_web_libraries_in_flutter, unused_import

import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_sv_teste/app/my_app.dart';

// ignore: must_be_immutable
class TelaEnvio extends StatelessWidget {
  TelaEnvio({Key? key}) : super(key: key);
  String? input;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela para Envio da Informação'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(MyApp.tela2);
              },
              icon: const Icon(Icons.arrow_forward_outlined))
        ],
      ),
      body: Column(children: [
        Form(
          key: formKey,
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Digite uma informação',
              labelStyle:
                  TextStyle(fontSize: 16, color: Color.fromARGB(78, 0, 0, 0)),
              border: OutlineInputBorder(),
            ),
            // ignore: body_might_complete_normally_nullable
            validator: (value) {
              if (value!.isNotEmpty) {
                input = value;
              } else {
                return 'Valor Obrigatório.';
              }
            },
            keyboardType: TextInputType.number,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                save(input!);
              }
            },
            child: const Text('Enviar'))
      ]),
    );
  }

  Future save(String input) async {
    //comando abaixo "abre" o banco de dados, tornando possível sua manipulação, é o que eu entendo até agora
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    //comando abaixo adiciona o valor da variável 'input' na coleção 'save' do firestore através do comando .set()
    await firestore
        .collection('sv')
        .doc('InformacoesEnviadas')
        .set({'Valor salvo': input});
  }
}
