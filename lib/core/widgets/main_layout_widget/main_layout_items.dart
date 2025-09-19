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
    screen: HomeScreen(),
  ),

  const MainLayoutItem(
    title: 'Profile',
    icon: Icons.person_rounded,
    screen: HomeScreen(),
  ),
];
