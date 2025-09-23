import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../core/di/cubit/custom_cubit.dart';
import '../../../../core/models/detailed_device.dart';
import '../../../../core/models/device.dart';

class FavoritesCubit extends CustomCubit<Set<DetailedDevice>> with HydratedMixin {
  FavoritesCubit() : super({}) {
    hydrate();
  }

  void addFavorite(DetailedDevice device) {
    emit({device, ...state});
  }

  void removeFavorite(DetailedDevice device) {
    final newState = {...state}..remove(device);
    emit(newState);
  }

  bool isFavorite(Device device) {
    return state.contains(device);
  }

  @override
  Set<DetailedDevice>? fromJson(Map<String, dynamic> json) {
    return (json['favorites'] as List).map((e) => DetailedDevice.fromMap(e)).toSet();
  }

  @override
  Map<String, dynamic>? toJson(Set<DetailedDevice> state) {
    return {
      'favorites': state.map((e) => e.toMap).toList(),
    };
  }
}
