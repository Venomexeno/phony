import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../../dependencies/app_theme_cubit/app_theme_cubit.dart';

class SwitchThemeBlocBuilder extends StatelessWidget {
  const SwitchThemeBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, bool>(
      builder: (context, state) {
        return SwitchListTile(
          enableFeedback: false,
          title: Text('Dark Mode', style: AppTextStyles.medium16),
          value: state,
          onChanged: (value) => _onChanged(context, value),
        );
      },
    );
  }

  void _onChanged(BuildContext context, bool value) {
    context.read<AppThemeCubit>().toggleTheme();
  }
}
