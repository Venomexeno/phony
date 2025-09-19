import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/device.dart';
import '../../../../core/style/app_colors.dart';
import '../../controller/favorites_cubit/favorites_cubit.dart';

class RemoveFavoriteButton extends StatelessWidget {
  const RemoveFavoriteButton({
    super.key,
    required this.device,
  });

  final Device device;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<FavoritesCubit>().removeFavorite(device);
      },
      icon: Icon(
        Icons.delete,
        color: AppColors.red,
      ),
    );
  }
}
