part of 'main_layout_widget.dart';

List<MainLayoutItem> get _mainLayoutItems => [
  MainLayoutItem(
    title: 'Home',
    icon: Icons.home_rounded,
    screen: MultiBlocProvider(
      providers: [
        BlocProvider<GetHotDealsCubit>(
          create: (context) => sl<GetHotDealsCubit>()..getHotDealDevices(),
        ),
        BlocProvider<GetTopDevicesCubit>(
          create: (context) => sl<GetTopDevicesCubit>()..getTopDevices(),
        ),
      ],
      child: HomeScreen(),
    ),
  ),

  const MainLayoutItem(
    title: 'Compare',
    icon: Icons.compare_arrows_rounded,
    screen: Placeholder(),
  ),

  const MainLayoutItem(
    title: 'Favorites',
    icon: Icons.favorite_rounded,
    screen: FavoritesScreen(),
  ),

  const MainLayoutItem(
    title: 'Settings',
    icon: Icons.settings_rounded,
    screen: Placeholder(),
  ),
];
