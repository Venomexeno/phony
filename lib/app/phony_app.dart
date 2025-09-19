import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../core/di/service_locator.dart';
import '../core/style/app_theme.dart';
import '../core/widgets/main_layout_widget/main_layout_widget.dart';
import '../dependencies/app_theme_cubit/app_theme_cubit.dart';
import 'environment_type.dart';

class PhonyApp extends StatelessWidget {
  const PhonyApp({
    super.key,
    required this.enviromentType,
  });

  final EnviromentType enviromentType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppThemeCubit>(
      create: (context) => sl<AppThemeCubit>(),
      child: BlocBuilder<AppThemeCubit, bool>(
        builder: (context, isDark) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
            builder: _builder,
            title: 'Phony',
            home: MainLayoutWidget(),
          );
        },
      ),
    );
  }

  Widget _builder(context, child) {
    return ResponsiveBreakpoints.builder(
      breakpoints: _breakpoints,
      child: Builder(
        builder: (context) {
          return ResponsiveScaledBox(
            width: ResponsiveValue<double>(
              context,
              conditionalValues: [
                const Condition.between(start: 0, end: 450, value: 375),
                const Condition.between(start: 450, end: 800, value: 500),
                const Condition.between(start: 800, end: 1100, value: 600),
                const Condition.between(start: 1100, end: 1400, value: 680),
                const Condition.between(start: 1400, end: 9999, value: 900),
              ],
            ).value,
            child: child!,
          );
        },
      ),
    );
  }

  List<Breakpoint> get _breakpoints => [
    const Breakpoint(start: 0, end: 450, name: MOBILE),
    const Breakpoint(start: 451, end: 800, name: TABLET),
    const Breakpoint(start: 801, end: 1920, name: DESKTOP),
    const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
  ];
}
