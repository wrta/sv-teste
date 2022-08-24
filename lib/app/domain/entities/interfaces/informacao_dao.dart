import 'package:flutter_application_sv_teste/app/domain/entities/informacao.dart';

abstract class InformacaoDAO{
  save(Informacao informacao);
  remove(int id);
  Future<List<Informacao>>find();

 
}