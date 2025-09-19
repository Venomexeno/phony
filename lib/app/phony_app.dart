import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/di/service_locator.dart';
import '../core/style/app_theme.dart';
import '../core/widgets/main_layout_widget/main_layout_widget.dart';
import '../dependencies/app_theme/get_app_theme/get_app_theme_cubit.dart';
import 'environment_type.dart';

class PhonyApp extends StatelessWidget {
  const PhonyApp({
    super.key,
    required this.enviromentType,
  });

  final EnviromentType enviromentType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAppThemeCubit>(
      create: (context) => sl<GetAppThemeCubit>(),
      child: BlocBuilder<GetAppThemeCubit, bool>(
        builder: (context, isDark) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
            title: 'Phony',
            home: MainLayoutWidget(),
          );
        },
      ),
    );
  }
}
