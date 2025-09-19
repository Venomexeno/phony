import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../dependencies/app_theme_cubit/app_theme_cubit.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => context.read<AppThemeCubit>().toggleTheme(),
        child: const Text(
          'Toggle Theme',
        ),
      ),
    );
  }
}
