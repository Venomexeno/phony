import 'package:flutter/material.dart';

import '../widgets/switch_theme_bloc_builder.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchThemeBlocBuilder(),
      ],
    );
  }
}
