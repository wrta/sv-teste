import 'package:flutter_application_sv_teste/app/domain/entities/informacao.dart';
import 'package:flutter_application_sv_teste/app/domain/entities/interfaces/informacao_dao.dart';
import 'package:flutter_application_sv_teste/app/domain/exception/domain_layer_exception.dart';
import 'package:get_it/get_it.dart';


class InformacaoService{
  //var dao = InformacaoDAOImpl();
  final _dao = GetIt.I.get<InformacaoDAO>();

  save(Informacao informacao){
    validateInfo(informacao);
    _dao.save(informacao);
  }

  remove(int id){
    _dao.remove(id);
  }

  Future<List<Informacao>>find(){
    return _dao.find();
  }

  //adicionais demais regras de negócio no serviço
  //validação de tamanho mínimo e máximo de caracteres para a informação
  validateInfo(dynamic info){
    var min = 2;
    var max = 50;

    if(info == null){
      throw DomainLayerException('Informação Necessária.');
    } else if(info.length < min){
      throw DomainLayerException('Digite uma Informação com pelo menos $min caracteres.');
    } else if(info.length > max){
      throw DomainLayerException('Digite uma Informação de até $max caracteres.');
    }

  }
}