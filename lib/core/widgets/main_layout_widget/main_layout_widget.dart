import 'dart:io';

import 'package:flutter/material.dart';


import '../../../dependencies/app_theme/get_app_theme/get_app_theme_cubit.dart';
import '../../../features/home/view/screens/home_screen.dart';
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
          key: _scaffoldKey,

          bottomNavigationBar: _MainLayoutNavBar(state: this),
          body: _mainLayoutItems[index].screen,
        ),
      ),
    );
  }
}
