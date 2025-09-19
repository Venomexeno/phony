import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_text_styles.dart';

class TryAgainButton extends StatelessWidget {
  const TryAgainButton({
    super.key,
    required this.onTryAgain,
  });

  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.red,
        padding: const EdgeInsets.symmetric(
          vertical: 7,
          horizontal: 20,
        ),
      ),
      onPressed: onTryAgain,
      child: Text(
        'Try Again',
        style: AppTextStyles.regular14.copyWith(
          color: AppColors.light,
        ),
      ),
    );
  }
}
