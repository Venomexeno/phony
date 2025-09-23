import 'package:flutter/widgets.dart';

class BottomSpaceWidget extends StatelessWidget {
  const BottomSpaceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10 + MediaQuery.of(context).padding.bottom,
    );
  }
}
