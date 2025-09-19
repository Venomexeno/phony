import 'package:flutter/material.dart';

import 'environment_type.dart';

class PhonyApp extends StatelessWidget {
  const PhonyApp({
    super.key,
    required this.enviromentType,
  });

  final EnviromentType enviromentType;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Placeholder(),
    );
  }
}