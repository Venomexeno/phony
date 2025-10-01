import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../core/di/cubit/custom_cubit.dart';


/// ال cubit ده وظيفته انه يدير ال theme بتاع الابلكيشن
/// ومستخدم ال hydrated mixin عشان احفظ ال state بتاعته
/// يعني لو اليوزر اختار ال dark theme مثلا وطلع من الابلكيشن
/// ولما يرجع تاني الابلكيشن يفضل على ال dark theme
class AppThemeCubit extends CustomCubit<bool> with HydratedMixin {
  AppThemeCubit() : super(false) {
    hydrate();
  }

  void toggleTheme() {
    emit(!state);
    _isDark = state;
  }

  /// هنا بستخدم static variable عشان اقدر اوصل لل theme من غير ما اعمل instance من ال cubit ولا احتاج context
  /// وده بيساعدني في ال theming بتاع الابلكيشن
  static late bool _isDark;

  static bool get isDark => _isDark; /// دي ميثود بترجعلي ال theme الحالي

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
