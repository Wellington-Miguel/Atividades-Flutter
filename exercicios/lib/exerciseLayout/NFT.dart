import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Nft extends StatelessWidget {
  const Nft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AppBarIcon',
        home: Scaffold(
          backgroundColor: Colors.blue[200],
          body: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      width: 2,
                    )),
                elevation: 10,
                margin: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/macaco.jpg'),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'NFT BAYC #3429',
                    style: GoogleFonts.rowdies(
                      fontSize: 25,
                      backgroundColor: Colors.amber,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Text(
                    'Cada Bored Ape é único e gerado programaticamente a partir de mais de 170 características possíveis, incluindo expressão, headwear, roupas e muito mais. Todos os macacos são legais, mas alguns são mais raros que outros.',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.rowdies(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: Container(
                  height: 1,
                  color: Colors.amber,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 100,
                      child: ClipOval(
                        child: Image.network(
                            'https://ik.imagekit.io/bayc/assets/bayc-footer.png'),
                      ),
                    ),
                    const Text(
                      'Criado por Bored Ape Yacht Club (BAYC)',
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
