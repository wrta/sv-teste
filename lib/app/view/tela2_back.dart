import 'package:flutter/cupertino.dart';
import 'package:flutter_application_sv_teste/app/domain/entities/informacao.dart';
import 'package:flutter_application_sv_teste/app/domain/services/informacao_service.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../my_app.dart';

part 'tela2_back.g.dart';

// ignore: library_private_types_in_public_api
class Tela2Back = _Tela2Back with _$Tela2Back;

abstract class _Tela2Back with Store{

final _service = GetIt.I.get<InformacaoService>();

//Tela de exibição da Informação Enviada
late Future<List<Informacao>>list;

//método para atualizar a informação
refreshList(){
  list = _service.find();
}

_Tela2Back(){
  refreshList();
}

//método para chamar o envio da informação (salvar/alterar)
goToForm(BuildContext context, Informacao informacao){
  Navigator.of(context).pushNamed(MyApp.home, arguments: informacao).then(refreshList());
}

//excluir
remove(int id){
  _service.remove(id);
  refreshList();
}


}