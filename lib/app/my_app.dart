import 'package:flutter/material.dart';
import 'package:flutter_application_sv_teste/app/view/tela1.dart';
import 'package:flutter_application_sv_teste/app/view/tela2.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const home = '/';
  static const tela2 = 'tela-2';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Silicon Village Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/':(context) =>  TelaEnvio(),
        'tela-2':(context) =>  const MyWidget(),
      },
    );
  }
}