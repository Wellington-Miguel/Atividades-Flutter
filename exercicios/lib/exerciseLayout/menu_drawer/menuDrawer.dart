import 'package:flutter/material.dart';

class menuDrawer extends StatelessWidget {
  const menuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AppBarIcon',
        home: Scaffold(
          endDrawer: Drawer(
            backgroundColor: Colors.white,
            child: ListView(
              children: [
                DrawerHeader(
                    decoration: BoxDecoration(color: Colors.pink[100]),
                    child: const Center(
                      child: Text(
                        'Menu',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                ListTile(
                  onTap: () => Navigator.pop(context),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  title: const Text('Flutter'),
                  subtitle: const Text('Everything is a widget'),
                  leading: const Icon(
                    Icons.flash_on,
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  onTap: () => Navigator.pop(context),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  title: const Text('Coffee'),
                  subtitle: const Text('I love coffee'),
                  leading: const Icon(
                    Icons.coffee,
                    color: Colors.brown,
                  ),
                ),
                ListTile(
                  onTap: () => Navigator.pop(context),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  title: const Text('Flutter'),
                  subtitle: const Text('Tudo é um widget'),
                  leading: const Icon(
                    Icons.sentiment_very_satisfied_outlined,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
          appBar: AppBar(
            title: const Text('Menu Drawer'),
            backgroundColor: Colors.pink[600],
          ),
        ));
  }
}
