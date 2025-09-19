import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/device.dart';
import '../../../../dependencies/app_theme_cubit/app_theme_cubit.dart';
import '../../../favorites/controller/favorites_cubit/favorites_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () => context.read<AppThemeCubit>().toggleTheme(),
            child: Text(
              'Toggle Theme',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final randomInt = Random().nextInt(100);
              context.read<FavoritesCubit>().addFavorite(
                Device(
                  id: randomInt.toString(),
                  name: "Device $randomInt",
                  image: "https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-17-pro-max.jpg",
                  description: "Device $randomInt Description",
                ),
              );
            },
            child: Text("Add Favorite"),
          ),
        ],
      ),
    );
  }
}
