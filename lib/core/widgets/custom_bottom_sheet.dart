import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import 'bottom_space_widget.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.child,
    this.height,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    required this.backgroundColor,
    this.constraints,
    this.actionWidget,
    this.showGreyLine = false,
  });
  final Widget child;
  final double? height;
  final CrossAxisAlignment crossAxisAlignment;
  final Color backgroundColor;
  final BoxConstraints? constraints;
  final Widget? actionWidget;
  final bool showGreyLine;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        constraints:
            constraints ??
            BoxConstraints(
              minWidth: MediaQuery.sizeOf(context).height * 0.5,
              maxHeight: MediaQuery.sizeOf(context).height * 0.85,
            ),
        height: height,
        decoration: _boxDecoration,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            showGreyLine ? const Center(child: _GreyLine()) : const SizedBox(),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: child,
              ),
            ),
            if (actionWidget != null)
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: actionWidget!,
              ),
            const BottomSpaceWidget(),
          ],
        ),
      ),
    );
  }

  BoxDecoration get _boxDecoration => BoxDecoration(
    color: backgroundColor,
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
  );
}

class _GreyLine extends StatelessWidget {
  const _GreyLine();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      width: 80,
      margin: const EdgeInsets.only(top: 10, bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.grey500,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
