import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/pages/home_page.dart';

void main() async {
  //init hive in flutter
  await Hive.initFlutter();

  //and create (open) a new instance of database (box 😂) with whatever name
  await Hive.openBox("myBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.ubuntuTextTheme(),
      ),
    );
  }
}
