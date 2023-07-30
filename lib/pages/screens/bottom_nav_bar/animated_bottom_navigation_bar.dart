library molten_navigationbar_flutter;

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:proje/themecolors/colors.dart';

class MoltenBottomNavigationBar extends StatelessWidget {
  final double barHeight;
  final double domeHeight;
  final double domeWidth;
  final Color? domeCircleColor;
  final double domeCircleSize;
  final EdgeInsets margin;
  final Color? barColor;
  final List<MoltenTab> tabs;

  /// The currently selected tab
  final int selectedIndex;

  /// A callback function that will be triggered whenever a [MoltenTab] is clicked, and will return it's index.
  final Function(int index) onTabChange;
  final Curve curve;
  final Duration? duration;
  final double borderSize;
  final Color? borderColor;
  final BorderRadius? borderRaduis;
  const MoltenBottomNavigationBar({
    Key? key,
    this.barHeight = kBottomNavigationBarHeight,
    this.barColor,
    this.domeHeight = 15.0,
    this.domeWidth = 100,
    this.domeCircleColor,
    this.domeCircleSize = 50.0,
    required this.tabs,
    this.margin = EdgeInsets.zero,
    required this.selectedIndex,
    required this.onTabChange,
    this.duration,
    this.curve = Curves.linear,
    this.borderColor,
    this.borderSize = 0,
    this.borderRaduis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final _borderRaduis = borderRaduis ??
          BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10));

      final Color _barColor =
          (barColor?.withOpacity(1)) ?? Theme.of(context).colorScheme.surface;

      Theme.of(context).colorScheme.primary;

      final double _tabWidth =
          (constraints.biggest.width - margin.horizontal) / tabs.length;

      final double _domeWidth = min(domeWidth, _tabWidth);

      assert(domeCircleSize <= (barHeight + domeHeight),
          'domeCircleSize must be less than or equal to (barHeight + domeHeight)');
      final selectedTab = tabs[selectedIndex];
      return Container(
        height: barHeight + domeHeight,
        margin: margin,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: barHeight,
              decoration: BoxDecoration(
                color: _barColor,
                borderRadius: _borderRaduis,
                border: Border.all(
                  width: borderSize,
                  color: (borderColor == null || borderSize < 1)
                      ? _barColor
                      : borderColor!,
                ),
              ),
            ),
            // border for the dome
            _animatedPositionedDome(
              top: 0,
              tabWidth: _tabWidth,
              domeWidth: _domeWidth - _borderRaduis.topRight.x,
              domeHeight: domeHeight,
              domeColor:
                  borderSize > 0 ? (borderColor ?? _barColor) : _barColor,
            ),
            // Actual dome
            _animatedPositionedDome(
              top: borderSize < 1 ? 1 : (borderSize + 0.2),
              tabWidth: _tabWidth,
              domeWidth: _domeWidth - borderSize - _borderRaduis.topRight.x,
              domeHeight: domeHeight,
              domeColor: _barColor,
            ),
            AnimatedPositioned(
              top: 0,
              bottom: selectedTab.title == null ? 0 : 16,
              curve: curve,
              duration: duration ?? Duration(milliseconds: 150),
              left: _tabWidth * selectedIndex,
              width: _normalizeDomeOnEdge(_tabWidth, selectedIndex),
              child: Center(
                child: Container(
                  height: domeCircleSize,
                  decoration: BoxDecoration(
                    color: OurColor.firstColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            ...tabs.asMap().entries.map((entry) {
              final index = entry.key;
              final isSelected = index == selectedIndex;
              final title = entry.value.title;
              return AnimatedPositioned(
                curve: curve,
                duration: duration ?? Duration(milliseconds: 150),
                top: isSelected ? 0 : domeHeight,
                bottom: 0,
                left: _tabWidth * index,
                width: _normalizeDomeOnEdge(_tabWidth, index),
                child: Column(
                  children: [
                    Expanded(
                      child: _MoltenTabWrapper(
                        tab: entry.value,
                        onTab: () => onTabChange(index),
                        isSelected: isSelected,
                        circleSize: domeCircleSize,
                      ),
                    ),
                    // const SizedBox(height: 8),
                    if (isSelected && title != null) title,
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      );
    });
  }

  Widget _animatedPositionedDome({
    required double top,
    required double domeWidth,
    required double domeHeight,
    required Color domeColor,
    required double tabWidth,
  }) {
    return AnimatedPositioned(
      curve: curve,
      duration: duration ?? Duration(milliseconds: 150),
      top: top,
      left: tabWidth * selectedIndex,
      child: AnimatedContainer(
        duration: duration ?? Duration(milliseconds: 150),
        width: _normalizeDomeOnEdge(tabWidth, selectedIndex),
        child: Center(
          child: _MoltenDome(
            color: domeColor,
            height: domeHeight,
            width: domeWidth,
          ),
        ),
      ),
    );
  }

  double _normalizeDomeOnEdge(double x, int index) {
    double newPos;
    if (index == 0)
      newPos = x + borderSize;
    else if (index == tabs.length - 1)
      newPos = x - borderSize;
    else
      newPos = x;

    return newPos;
  }
}

/// Wraps the [MoltenTab] with extra attributes.
class _MoltenTabWrapper extends StatelessWidget {
  final MoltenTab tab;
  final bool isSelected;
  final Function onTab;
  final double circleSize;
  _MoltenTabWrapper({
    required this.tab,
    required this.isSelected,
    required this.onTab,
    required this.circleSize,
  });
  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(
        color: isSelected
            ? tab.selectedColor ?? Colors.white
            : tab.unselectedColor ?? Colors.grey,
      ),
      child: Container(
        height: circleSize,
        width: circleSize,
        child: Material(
          shape: CircleBorder(
              side: BorderSide(width: 0, color: Colors.transparent)),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
            onTap: () => onTab(),
            child: tab.icon,
          ),
        ),
      ),
    );
  }
}

class MoltenTab {
  /// Can be any [Widget].
  final Widget icon;

  /// title when tab is selected
  final Widget? title;

  /// The [icon] color when the tab is selected
  ///
  /// White if not set
  final Color? selectedColor;

  /// The [icon] color when the tab is unselected
  ///
  /// Grey if not set
  final Color? unselectedColor;

  /// This represents each tab in the navigation bar.
  ///
  /// [icon] must not be null
  MoltenTab({
    required this.icon,
    this.selectedColor,
    this.title,
    this.unselectedColor,
  });
}

class _MoltenDome extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  _MoltenDome({
    required this.color,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(
          painter: _DomePainter(color: color),
          size: Size(width, height),
        );
      },
    );
  }
}

class _DomePainter extends CustomPainter {
  final Color color;
  _DomePainter({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = color;
    Path path = Path();
    path.lineTo(0, size.height);
    path.cubicTo(
        0, size.height, size.width, size.height, size.width, size.height);
    path.cubicTo(size.width * 0.94, size.height, size.width * 0.83,
        size.height * 0.65, size.width * 0.72, size.height * 0.31);
    path.cubicTo(size.width * 0.67, size.height * 0.12, size.width * 0.59,
        size.height * 0.01, size.width * 0.51, 0);
    path.cubicTo(
        size.width * 0.51, 0, size.width * 0.51, 0, size.width * 0.51, 0);
    path.cubicTo(size.width * 0.42, -0.01, size.width * 0.34,
        size.height * 0.11, size.width * 0.27, size.height * 0.31);
    path.cubicTo(size.width * 0.17, size.height * 0.65, size.width * 0.06,
        size.height, 0, size.height);
    path.cubicTo(0, size.height, 0, size.height, 0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
