import 'package:flutter/material.dart';
import '../../../../core/routing/navigations/search_screen_navigation.dart';
import '../../../../core/widgets/custom_search_bar.dart';
import 'show_brands_button.dart';

class DeviceFilterWidget extends StatelessWidget {
  const DeviceFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Expanded(
          child: CustomSearchBar(
            onTap: () => context.navigateToSearchScreen(),
          ),
        ),
        ShowBrandsButton(),
      ],
    );
  }
}
