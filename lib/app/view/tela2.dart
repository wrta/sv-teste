import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_sv_teste/app/my_app.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String informacaoEnviada = 'recebe informação';
  Future getInfo() async {
    //comando abaixo "abre" o banco de dados, tornando possível sua manipulação, é o que eu entendo até agora
    // ignore: no_leading_underscores_for_local_identifiers
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    //comando abaixo adiciona o valor da variável 'input' na coleção 'save' do firestore através do comando .add()
    var result = await _firestore.collection('sv').get();
    for (var doc in result.docs) {
      if (doc.id == 'InformacoesEnviadas') {
        //setState para atualizar(rebuildar) a info da variável informacaoEnviada,
        setState(() {
          informacaoEnviada = doc['Valor salvo'];
        });
      }
    }
  }

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela para Leitura da Informação'),
      ),
      body: Column(children: [
        Center(
          child: Text(informacaoEnviada,)),
      ]),
    );
  }
}
