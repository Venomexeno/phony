import 'package:flutter/material.dart';

import 'navigation_type.dart';

/// ال extension ده بضيف ميثودز لل navigation عشان استخدمها في اي مكان في الابلكيشن
/// بدل ما اكتب الكود بتاع ال Navigator.of(context).push... في كل مكان
extension NavigationMethodsExtension on BuildContext {

  void navigate({
    required Widget screen,
    required NavigationType navigationType,
  })async {
    if (navigationType is PushNavigation) {
      push(screen: screen, navigationType: navigationType);
    } else if (navigationType is PushAndRemoveUntilNavigation) {
      _pushAndRemoveUntil(screen: screen, until: navigationType.until);
    } else if (navigationType is PushReplacementNavigation) {
      pushReplacement(screen: screen);
    }else{
      throw Exception('Navigation type not found');
    }
  }

  void push({required Widget screen,required PushNavigation navigationType}) {
    Navigator.of(this).push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    ).then((_)=>navigationType.toExecuteAfterPop?.call());
  }

  void _pushAndRemoveUntil({required Widget screen, Type? until}) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
      (route) =>route is MaterialPageRoute && route.builder(this).runtimeType == until,
    );
  }

  void pushReplacement({required Widget screen}) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  void pop() {
    Navigator.of(this).pop();
  }

  void popUntil({required Type screen}) {
    Navigator.of(this).popUntil(
      (route) =>route is MaterialPageRoute && route.builder(this).runtimeType == screen,
    );
  }
}
