part of 'main_layout_widget.dart';

class _MainLayoutNavBar extends StatefulWidget {
  const _MainLayoutNavBar({required this.state});
  final _MainLayoutWidgetState state;

  @override
  State<_MainLayoutNavBar> createState() => _MainLayoutNavBarState();
}

class _MainLayoutNavBarState extends State<_MainLayoutNavBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _prevCenterX = 0;
  double _targetCenterX = 0;
  final double dotSize = 16;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = const AlwaysStoppedAnimation(0);
  }

  void animateNotchAndDot(double newCenterX) {
    _prevCenterX = _targetCenterX == 0 ? newCenterX : _targetCenterX;
    _targetCenterX = newCenterX;

    _animation = Tween<double>(begin: _prevCenterX, end: _targetCenterX).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double itemWidth = width / _mainLayoutItems(widget.state.index).length;
        final double targetCenterX = (widget.state.index + 0.5) * itemWidth;

        if (_targetCenterX != targetCenterX) {
          animateNotchAndDot(targetCenterX);
        }

        return AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            final double notchCenterX = _animation.value;

            return Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                CustomPaint(
                  painter: BottomNavBarPainter(
                    notchCenterX: notchCenterX,
                    color: bottomNavBarColor,
                  ),
                  child: Padding(
                    padding: _padding(dotSize),
                    child: Row(
                      children: _mainLayoutItems(widget.state.index).asMap().entries.map((item) {
                        return NavBarItemWidget(
                          item: item.value,
                          isSelected: widget.state.index == item.key,
                          onTap: () => widget.state._onBottomNavigationBarTap(item.key),
                        );
                      }).toList(),
                    ),
                  ),
                ),

                PositionedDirectional(
                  start: notchCenterX - (dotSize / 2),
                  top: -(dotSize / 2) + 2,
                  child: NavDot(
                    color: AppColors.secondary,
                    size: dotSize,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Color get bottomNavBarColor => AppThemeCubit.isDark ? AppColors.dark : AppColors.light;

  EdgeInsets _padding(double dotSize) => EdgeInsets.only(top: 12 + dotSize, bottom: 12);
}
