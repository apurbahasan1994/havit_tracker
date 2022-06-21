import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/constants/app_assets.dart';
import 'package:habit_tracker/ui/common_widgets/centered_svg.dart';
import 'package:habit_tracker/ui/task/task_comp_ring.dart';
import 'package:habit_tracker/ui/theming/app_theme.dart';

class AnimatedTask extends StatefulWidget {
  const AnimatedTask({Key? key, required this.iconName}) : super(key: key);
  final String iconName;

  @override
  State<AnimatedTask> createState() => _AnimatedTaskState();
}

class _AnimatedTaskState extends State<AnimatedTask>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _curvedAnimation;
  bool _showCheckIcon = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _curvedAnimation =
        _animationController.drive(CurveTween(curve: Curves.easeInOut));
    _animationController.addStatusListener(_checkStatusListener);
  }

  void _checkStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _showCheckIcon = true;
    }
    Future.delayed(Duration(milliseconds: 3000), () {
      setState(() {
        _showCheckIcon = false;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
    _animationController.removeStatusListener(_checkStatusListener);
  }

  void _handleTpDown(TapDownDetails details) {
    if (_animationController.status != AnimationStatus.completed) {
      _animationController.forward();
    } else if (!_showCheckIcon) {
      _animationController.reset();
    }
  }

  void _handleTapCancel() {
    if (_animationController.status != AnimationStatus.completed) {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTpDown,
      onTapUp: (_) => _handleTapCancel,
      onTapCancel: _handleTapCancel,
      child: AnimatedBuilder(
        animation: _curvedAnimation,
        builder: (context, child) {
          final themedata = AppTheme.of(context);
          final progress = _curvedAnimation.value;
          final hasComplted = progress == 1.0;
          final iconColor =
              hasComplted ? themedata.accentNegative : themedata.taskIcon;
          return Stack(
            children: [
              TaskComRing(
                progress: progress,
              ),
              Positioned.fill(
                child: CenteredSvgIcon(
                  iconName: hasComplted && _showCheckIcon
                      ? AppAssets.check
                      : widget.iconName,
                  color: iconColor,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
