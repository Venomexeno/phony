import 'package:flutter/material.dart';

import '../../../../core/style/app_text_styles.dart';
import '../../data/enums/top_devices_enum.dart';
import '../widgets/device_filter_widget.dart';
import '../widgets/get_hot_deals_bloc_builder.dart';
import '../widgets/get_top_devices_bloc_builder.dart';
import '../widgets/top_devices_tab_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TopDevicesEnum selectedTopDevicesEnum = TopDevicesEnum.fans;

  void _onTopDevicesTabBarTap(TopDevicesEnum topDevicesEnum) {
    setState(() => selectedTopDevicesEnum = topDevicesEnum);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: DeviceFilterWidget(),
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),

          SliverToBoxAdapter(
            child: TopDevicesTabBarWidget(
              selectedTopDevicesEnum: selectedTopDevicesEnum,
              onTap: _onTopDevicesTabBarTap,
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: 8),
          ),

          GetTopDevicesBlocBuilder(
            selectedTopDevicesEnum: selectedTopDevicesEnum,
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),

          // Hot Deals
          SliverToBoxAdapter(
            child: Text(
              'Hot Deals',
              style: AppTextStyles.bold16,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 8),
          ),
          GetHotDealsBlocBuilder(),

          SliverToBoxAdapter(
            child: SizedBox(height: 100), // Bottom Navbar Space
          ),
        ],
      ),
    );
  }

  EdgeInsets get _padding => EdgeInsets.symmetric(
    horizontal: 10,
  );
}
