import 'package:flutter/material.dart';

import '../../../features/home/view/screens/home_screen.dart';
import '../navigation_methods_extension.dart';
import '../navigation_type.dart';

extension HomeScreenNavigation on BuildContext {
  void navigateToHomeScreen() {
    navigate(
      screen: const HomeScreen(),
      navigationType: const PushReplacementNavigation(),
    );
  }
}
