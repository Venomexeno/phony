import 'package:flutter/material.dart';

import '../../../../core/style/app_text_styles.dart';
import 'get_hot_deals_bloc_builder.dart';

class HotDealsSection extends StatelessWidget {
  const HotDealsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          'Hot Deals',
          style: AppTextStyles.bold16,
        ),
        GetHotDealsBlocBuilder(),
      ],
    );
  }
}
