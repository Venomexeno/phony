import 'package:flutter/material.dart';

import '../widgets/compare_screen_body.dart';

class CompareScreen extends StatelessWidget {
  const CompareScreen._({
    required this.hasScaffold,
  });

  final bool hasScaffold;

  factory CompareScreen.withAppBar() {
    return const CompareScreen._(hasScaffold: true);
  }

  factory CompareScreen() {
    return const CompareScreen._(hasScaffold: false);
  }

  @override
  Widget build(BuildContext context) {
    if (hasScaffold) {
      return Scaffold(
        appBar: AppBar(),
        body: CompareScreenBody(),
      );
    }
    return CompareScreenBody();
  }
}
