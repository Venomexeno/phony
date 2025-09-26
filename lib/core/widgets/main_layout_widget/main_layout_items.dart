part of 'main_layout_widget.dart';

List<MainLayoutItem> _mainLayoutItems(int index) => [
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
      child: HeroMode(enabled: index == 0, child: HomeScreen()),
    ),
  ),

  MainLayoutItem(
    title: 'Compare',
    icon: Icons.compare_arrows_rounded,
    screen: BlocProvider<CompareDevicesCubit>(
      create: (context) => sl<CompareDevicesCubit>(),
      child: CompareScreen(),
    ),
  ),

  MainLayoutItem(
    title: 'Favorites',
    icon: Icons.favorite_rounded,
    screen: HeroMode(enabled: index == 2, child: FavoritesScreen()),
  ),

  const MainLayoutItem(
    title: 'Settings',
    icon: Icons.settings_rounded,
    screen: SettingsScreen(),
  ),
];
