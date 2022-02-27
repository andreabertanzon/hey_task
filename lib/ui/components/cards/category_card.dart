import 'package:flutter/material.dart';
import 'package:hey_task/ui/theme/colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {Key? key,
      required this.categoryTitle,
      required this.completionPerc,
      required this.numOfTasks,
      required this.totalTasks,
      this.categoryColor = 0})
      : super(key: key);

  final String categoryTitle;
  final double completionPerc;
  final int numOfTasks;
  final int totalTasks;
  final int categoryColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      shadowColor: LightColors.iconsGrey,
      color: LightColors.defaultContainerColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                top: 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$numOfTasks / $totalTasks",
                      style: const TextStyle(
                          color: LightColors.subTitleGrey, fontSize: 12)),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    categoryTitle,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SizedBox(
                width: 180,
                child: LinearPercentIndicator(
                  backgroundColor: LightColors.iconsGrey,
                  progressColor: getCategoryColor(categoryColor),
                  animation: false,
                  percent: completionPerc,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getCategoryColor(int category) {
    switch (category) {
      case 1:
        return LightColors.iconBlue;
      default:
        return LightColors.iconBlue;
    }
  }
}
