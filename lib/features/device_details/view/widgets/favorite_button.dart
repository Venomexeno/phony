import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/detailed_device.dart';
import '../../../../core/style/app_colors.dart';
import '../../../favorites/controller/favorites_cubit/favorites_cubit.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.device});

  final DetailedDevice device;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, Set<DetailedDevice>>(
      builder: (context, state) {
        final bool isFavorite = state.contains(device);
        return IconButton(
          onPressed: () {
            if (isFavorite) {
              context.read<FavoritesCubit>().removeFavorite(device);
            } else {
              context.read<FavoritesCubit>().addFavorite(device);
            }
          },
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? AppColors.red : null,
          ),
        );
      },
    );
  }
}
