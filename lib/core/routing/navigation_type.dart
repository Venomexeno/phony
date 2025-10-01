import 'package:flutter/material.dart';


/// ال class ده بيمثل نوع التنقل اللي انا عايزه اعمله في الابلكيشن
/// زي مثلا push او pushReplacement او pushAndRemoveUntil
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
