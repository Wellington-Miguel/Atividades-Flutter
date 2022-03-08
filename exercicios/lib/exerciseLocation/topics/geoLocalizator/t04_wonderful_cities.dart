import 'package:exercicio/exerciseLocation/components/geolocation_error.dart';
import 'package:exercicio/exerciseLocation/topics/geolocation.dart';
import 'package:flutter/material.dart';

import '../../models/title.dart';
import '../../resources/strings.dart';

class WonderfulCities extends StatefulWidget {
  const WonderfulCities({
    Key? key,
    required this.onThemeModePressed,
  }) : super(key: key);

  final VoidCallback onThemeModePressed;

  @override
  _WonderfulCitiesState createState() => _WonderfulCitiesState();
}

class _WonderfulCitiesState extends State<WonderfulCities> {
  final geolocation = Geolocation();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
        actions: [
          IconButton(
            onPressed: widget.onThemeModePressed,
            icon: Icon(
              theme.brightness == Brightness.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
        ],
      ),
      body: FutureBuilder<bool>(
        future: geolocation.checkPermission(),
        builder: (
          context,
          snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.done) {
            final connection = snapshot.data;
            if (connection != null && connection) {
              return const TitleTeste();
            }
            return GeolocationError(
              icon: Icons.lock_outline_rounded,
              title: Strings.errorLocationPermissionTitle,
              description: Strings.errorLocationPermissionDescription,
              actionText: Strings.enableLocationService,
              action: () {
                geolocation.requestPermission().then((connection) {
                  setState(() {});
                });
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
