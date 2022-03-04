import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Teste extends StatelessWidget {
  const Teste({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Google fonts',
            style: GoogleFonts.roboto(),
          ),
        ),
      ),
    ) // Text

        ;
  }
}
