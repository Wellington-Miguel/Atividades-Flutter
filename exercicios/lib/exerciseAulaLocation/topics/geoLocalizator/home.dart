import 'package:exercicio/exerciseAulaLocation/components/geolocation_error.dart';
import 'package:exercicio/exerciseAulaLocation/topics/geolocation.dart';
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
  late Future<bool> hasPemission;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hasPemission = geolocation.checkPermission();
  }

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
        future: hasPemission,
        builder: (
          context,
          snapshot,
        ) {
          debugPrint(snapshot.toString());
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
              action: () async {
                final permission = await geolocation.requestPermission();

                setState(() {
                  hasPemission = Future.value(permission);
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
