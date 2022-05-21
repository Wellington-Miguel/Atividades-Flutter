import 'package:flutter/material.dart';

class GeolocationError extends StatelessWidget {
  const GeolocationError({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.actionText,
    required this.action,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String description;
  final String actionText;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: AlignmentGeometry.lerp(
        Alignment.topCenter,
        Alignment.center,
        0.7,
      )!,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: theme.colorScheme.secondaryVariant,
            size: 150.0,
          ),
          const SizedBox(height: 20.0),
          Text(title, style: theme.textTheme.headline4),
          const SizedBox(height: 20.0),
          Text(
            description,
            style: theme.textTheme.bodyText2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(onPressed: action, child: Text(actionText)),
        ],
      ),
    );
  }
}
