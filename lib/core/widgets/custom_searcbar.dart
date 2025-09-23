import 'package:flutter/material.dart';

import '../style/app_text_styles.dart';

class CustomSearcbar extends StatelessWidget {
  const CustomSearcbar({
    super.key,
    this.hasFocus = false,
    this.onTap,
    this.controller,
    this.height = 40,
    this.width = double.infinity,
    this.onChanged,
    this.onFieldSubmitted,
  });

  final bool hasFocus;
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
          controller: controller,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          focusNode: hasFocus ? FocusNode() : null,
          style: AppTextStyles.medium14,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            hintText: 'Search for a device',
            suffixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
