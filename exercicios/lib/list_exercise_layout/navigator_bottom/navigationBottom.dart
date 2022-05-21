import 'package:flutter/material.dart';

class navigationBottom extends StatelessWidget {
  const navigationBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AppBarIcon',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Bottom navigation'),
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 5,
            backgroundColor: const Color.fromARGB(255, 27, 124, 204),
            selectedItemColor: Colors.amber[300],
            unselectedItemColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                tooltip: 'Home',
                label: 'Home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                tooltip: 'Settings',
                label: 'Settings',
                icon: Icon(Icons.settings),
              ),
              BottomNavigationBarItem(
                tooltip: 'Login',
                label: 'Login',
                icon: Icon(Icons.login),
              ),
            ],
          ),
        ));
  }
}
