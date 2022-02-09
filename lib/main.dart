import 'dart:io';

import 'package:cooking_book/global_vars.dart';
import 'package:cooking_book/objectbox.g.dart';
import 'package:cooking_book/view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:objectbox/objectbox.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Directory appPath = await getApplicationDocumentsDirectory();
  GlobalVars.store = await openStore(
    directory: "${appPath.path}/database/"
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: const TextTheme(
          button: TextStyle(
            color: Colors.white,
          )
        )
      ),
      home: const MainView(),
    );
  }
}
