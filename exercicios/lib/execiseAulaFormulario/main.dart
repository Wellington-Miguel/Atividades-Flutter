import 'package:exercicio/execiseAulaFormulario/pages/form.dart';
import 'package:exercicio/execiseAulaFormulario/resouces/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool currentTheme = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: currentTheme ? ThemeForm.light : ThemeForm.dark,
      debugShowCheckedModeBanner: false,
      title: "Form",
      home: PersonalForms((bool value) {
        setState(() {
          currentTheme = value;
        });
      }, currentTheme),
    );
  }
}
