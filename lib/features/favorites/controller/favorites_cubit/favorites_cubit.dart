import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../core/di/cubit/custom_cubit.dart';
import '../../../../core/models/detailed_device.dart';

/// ال cubit ده وظيفته انه يدير ال favorite devices
/// ومستخدم ال hydrated mixin عشان احفظ ال state بتاعته
/// يعني لو اليوزر ضاف device للمفضلة وطلع من الابلكيشن
/// ولما يرجع تاني الابلكيشن يفضل الموبايل في المفض
class FavoritesCubit extends CustomCubit<Set<DetailedDevice>> with HydratedMixin {
  FavoritesCubit() : super({}) {
    hydrate();
  }

  /// هنا انا عملت ال state set عشان مفيش موبايل يتكرر في المفضلة
  /// وكمان عشان لو عايز امسح موبايل من المفضلة اقدر اعمل remove بسهولة
  /// لان لو ال state كانت List مثلا هيبقى صعب امسح موبايل
  /// Set O(1) اما List O(n)
  /// ف ال set عملية ال remove اسرع

  void addFavorite(DetailedDevice device) {
    emit({device, ...state});
  }

  void removeFavorite(DetailedDevice device) {
    final newState = {...state}..remove(device);
    emit(newState);
  }

  @override
  Set<DetailedDevice>? fromJson(Map<String, dynamic> json) {
    return (json['favorites'] as List).map((e) => DetailedDevice.fromMap(e)).toSet(); /// هنا بعمل تحويل من ال json اللي جايلي من ال هيدريتد لستة من ال detailed devices
  }

  @override
  Map<String, dynamic>? toJson(Set<DetailedDevice> state) {
    return {
      'favorites': state.map((e) => e.toMap).toList(), /// هنا بستخدم ال toMap اللي عملته في ال detailed device عشان احول الموبايل ل map
    };
  }
}
