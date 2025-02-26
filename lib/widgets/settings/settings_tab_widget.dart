import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/settings_provider.dart';

class SettingsTabWidget extends StatelessWidget {
  const SettingsTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return Column(
      children: [
        Row(
          children: [
            Text("Dark Mode:"),
            Expanded(child: Container()),
            Switch(
              value: settingsProvider.darkMode,
              onChanged: (value) => settingsProvider.darkMode = value
            )
          ],
        )
      ],
    );
  }
}