import 'package:flutter/material.dart';

abstract class NavigationType {
  const NavigationType();
}

class PushNavigation extends NavigationType {

  final VoidCallback? toExecuteAfterPop;
  const PushNavigation({
    this.toExecuteAfterPop,
  });
}

class PushReplacementNavigation extends NavigationType {
  const PushReplacementNavigation();
}

class PushAndRemoveUntilNavigation extends NavigationType {
  final Type? until;
  
  const PushAndRemoveUntilNavigation({this.until});
}
