

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:number_to_words/number_to_words.dart';

import '../my_app.dart';


class Tela3Desafio extends StatefulWidget {
  const Tela3Desafio({Key? key}) : super(key: key);
  

  @override
  State<Tela3Desafio> createState() => _Tela3DesafioState();
}

class _Tela3DesafioState extends State<Tela3Desafio> {
  String? input;
  int numeroEnviado = 0;
  Future save(String input) async {
    //comando abaixo "abre" o banco de dados, tornando possível sua manipulação, é o que eu entendo até agora
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    //comando abaixo adiciona o valor da variável 'input' na coleção 'save' do firestore através do comando .set()
    await firestore.collection('sv').doc('NumerosEnviados').set({'numero': input});
    
  }

  Future getInfo() async{
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    var result = await firestore.collection('sv').get();
    for (var doc in result.docs) {
      if (doc.id == 'NumerosEnviados') {
        //setState para atualizar(rebuildar) a info da variável informacaoEnviada,
        setState(() {
          numeroEnviado = doc['numero'];
        });
      }
      print(numeroEnviado);
    }
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    getInfo();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela do Desafio Extra'),
      ),
      body: Column(children: [
        Form(
          key: formKey,
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Digite um número Inteiro',
              labelStyle:
                  TextStyle(fontSize: 16, color: Color.fromARGB(78, 0, 0, 0)),
              border: OutlineInputBorder(),
            ),
            // ignore: body_might_complete_normally_nullable
            validator: (value) {
              if (value!.isNotEmpty) {
                setState(() {
                  input = value;
                });
              } else {
                return 'Valor Obrigatório.';
              }
            },
            keyboardType: TextInputType.number,
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 'one hundred twenty-three million four hundred fifty-six thousand seven hundred eighty-nine'
                Text(
                  'O número escrito por extenso é: ${NumberToWord().convert('en-in', numeroEnviado)}',
                ),
                ],
            ),
          ),
        ),
        
        ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                save(input!);
              }
            },
            child: const Text('Enviar')),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(MyApp.home);
            },
            child: const Text('Ir para Tela de Envio de Informação'))  
      ]),
    );
    
  }

  
}
