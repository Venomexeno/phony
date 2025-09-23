import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';

import '../../../dependencies/app_theme_cubit/app_theme_cubit.dart';
import '../../../features/favorites/view/screens/favorites_screen.dart';
import '../../../features/home/controllers/get_hot_deals_cubit/get_hot_deals_cubit.dart';
import '../../../features/home/controllers/get_top_devices_cubit/get_top_devices_cubit.dart';
import '../../../features/home/view/screens/home_screen.dart';
import '../../../features/settings/view/screens/settings_screen.dart';
import '../../di/service_locator.dart';
import '../../models/main_layout_item.dart';
import '../../style/app_colors.dart';
import 'bottom_nav_bar_painter.dart';
import 'nav_bar_item_widget.dart';
import 'nav_dot.dart';

part 'main_layout_items.dart';
part 'main_layout_nav_bar.dart';

class MainLayoutWidget extends StatefulWidget {
  const MainLayoutWidget({super.key});

  @override
  State<MainLayoutWidget> createState() => _MainLayoutWidgetState();
}

class _MainLayoutWidgetState extends State<MainLayoutWidget> {
  int index = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  void _onBottomNavigationBarTap(int index) {
    this.index = index;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (index != 0) {
          setState(() {
            index = 0;
          });
        } else {
          exit(0);
        }
      },
      child: SafeArea(
        top: false,
        left: false,
        right: false,
        child: Scaffold(
          extendBody: true,
          appBar: AppBar(
            title: Text(_mainLayoutItems[index].title),
          ),
          key: _scaffoldKey,
          bottomNavigationBar: _MainLayoutNavBar(state: this),
          body: LazyIndexedStack(
            index: index,
            children: _mainLayoutItems.map((item) => item.screen).toList(),
          ),
        ),
      ),
    );
  }
}
