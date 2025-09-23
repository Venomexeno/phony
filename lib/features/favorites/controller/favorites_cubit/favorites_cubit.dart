import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../core/di/cubit/custom_cubit.dart';
import '../../../../core/models/device.dart';

class FavoritesCubit extends CustomCubit<Set<Device>> with HydratedMixin {
  FavoritesCubit() : super({}) {
    hydrate();
  }

  void addFavorite(Device device) {
    emit({device, ...state});
  }

  void removeFavorite(Device device) {
    final newState = {...state}..remove(device);
    emit(newState);
  }

  bool isFavorite(Device device) {
    return state.contains(device);
  }

  @override
  Set<Device>? fromJson(Map<String, dynamic> json) {
    return (json['favorites'] as List).map((e) => Device.fromMap(e)).toSet();
  }

  @override
  Map<String, dynamic>? toJson(Set<Device> state) {
    return {
      'favorites': state.map((e) => e.toMap()).toList(),
    };
  }
}
