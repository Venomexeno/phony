import 'package:flutter/material.dart';

import '../widgets/hot_deals_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: _padding,
      child: HotDealsSection(),
    );
  }

  EdgeInsets get _padding => EdgeInsets.symmetric(
    horizontal: 10,
  );
}
