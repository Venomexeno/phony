import 'package:flutter/material.dart';

import '../style/app_text_styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.autoFocus = false,
    this.onTap,
    this.controller,
    this.height = 40,
    this.width = double.infinity,
    this.onChanged,
    this.onFieldSubmitted,
  });

  final bool autoFocus;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final double? height;
  final double? width;
  final void Function(String value)? onChanged;
  final void Function(String value)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
        child: TextFormField(
          enabled: onTap == null,
          controller: controller,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          autofocus: autoFocus,
          style: AppTextStyles.medium14,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          decoration: const InputDecoration(
            hintText: 'Search for a device',
            suffixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
