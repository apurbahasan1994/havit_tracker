import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/app_assets.dart';
import 'package:habit_tracker/models/task_preset.dart';
import 'package:habit_tracker/ui/home/task_grid.dart';
import 'package:habit_tracker/ui/task/animated_task.dart';
import 'package:habit_tracker/ui/task/task_with_name.dart';

import 'package:habit_tracker/ui/theming/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.of(context).primary,
        body: TaskGrid(tasks: const [
          TaskPreset(name: 'Eat a Healthy Meal', iconName: AppAssets.carrot),
          TaskPreset(name: 'Walk the Dog', iconName: AppAssets.dog),
          TaskPreset(name: 'Do Some Coding', iconName: AppAssets.html),
          TaskPreset(name: 'Meditate', iconName: AppAssets.meditation),
          TaskPreset(name: 'Do 10 Pushups', iconName: AppAssets.pushups),
          TaskPreset(name: 'Sleep 8 Hours', iconName: AppAssets.rest),
        ]));
  }
}
