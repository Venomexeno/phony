import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/detailed_device.dart';
import '../../controller/favorites_cubit/favorites_cubit.dart';
import '../widgets/favorites_list_view.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, Set<DetailedDevice>>(
      builder: (context, state) {
        final devices = state.toList();
        return FavoritesListView(devices: devices);
      },
    );
  }
}
