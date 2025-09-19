part of 'main_layout_widget.dart';

List<MainLayoutItem> get _mainLayoutItems => [
  const MainLayoutItem(
    title: 'Home',
    icon: Icons.home_rounded,
    screen: HomeScreen(),
  ),

  const MainLayoutItem(
    title: 'Compare',
    icon: Icons.compare_arrows_rounded,
    screen: HomeScreen(),
  ),

  const MainLayoutItem(
    title: 'Favorites',
    icon: Icons.favorite_rounded,
    screen: FavoritesScreen(),
  ),

  const MainLayoutItem(
    title: 'Settings',
    icon: Icons.settings_rounded,
    screen: HomeScreen(),
  ),
];
