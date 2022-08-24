

import 'package:flutter_application_sv_teste/app/database/sqlite/dao/informacao_dao_impl.dart';
import 'package:flutter_application_sv_teste/app/domain/entities/interfaces/informacao_dao.dart';
import 'package:flutter_application_sv_teste/app/domain/services/informacao_service.dart';
import 'package:get_it/get_it.dart';

setupInjection(){
  final getIt = GetIt.instance;

  getIt.registerSingleton<InformacaoDAO>(InformacaoDAOImpl());
  getIt.registerSingleton<InformacaoService>(InformacaoService());
}