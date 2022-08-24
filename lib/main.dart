import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_sv_teste/app/injection.dart';
import 'app/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  setupInjection();
  runApp(const MyApp());
  
  /* var info = FirebaseFirestore.instance.collection('Informacao'); */
  /* info.doc().set({
    'informacao': 'abc',
    'informacao1': 'def',
    'informacao2': 'ghi'
  }).then((value) => print('deu certo!'))
  .catchError((error) => print('deu errado!')); */

  /* var result = await info.get();

  info.snapshots().listen((r){
    result = r;
    print(r.docs[0]['name']);
  }); */

/*   for(var doc in result.docs){
    // ignore: avoid_print
    print(doc['name']);
  } */

}








