import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../core/di/cubit/custom_cubit.dart';

class AppThemeCubit extends CustomCubit<bool> with HydratedMixin {
  AppThemeCubit() : super(false) {
    hydrate();
  }

  void toggleTheme() {
    emit(!state);
  }

  static late bool _isDark;

  static bool get isDark => _isDark;

  @override
  bool? fromJson(Map<String, dynamic> json) {
    _isDark = json['isDark'] as bool? ?? false;
    return _isDark;
  }

  @override
  Map<String, dynamic>? toJson(bool state) {
    _isDark = state;
    return {'isDark': _isDark};
  }
}
