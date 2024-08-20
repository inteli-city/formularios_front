import 'package:flutter/material.dart';

class StepperComponent extends StatelessWidget {
  final int index;
  final int currentIndex;
  final VoidCallback onTap;

  final bool isLast;
  final bool isFirst;
  const StepperComponent({
    super.key,
    required this.currentIndex,
    required this.index,
    required this.onTap,
    this.isLast = false,
    this.isFirst = false,
  });

  @override
  Widget build(BuildContext context) {
    return isLast
        ? Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 3,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              StepWidget(
                color: index == currentIndex
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
                onTap: onTap,
                isActive: index == currentIndex,
                title: index.toString(),
              ),
              Expanded(
                child: Container(
                  height: 3,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          )
        : isFirst
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      height: 3,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  StepWidget(
                    color: index == currentIndex
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey,
                    onTap: onTap,
                    isActive: index == currentIndex,
                    title: index.toString(),
                  ),
                  Expanded(
                    child: Container(
                      height: 3,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 3,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  StepWidget(
                    color: index == currentIndex
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey,
                    onTap: onTap,
                    isActive: index == currentIndex,
                    title: index.toString(),
                  ),
                  Expanded(
                    child: Container(
                      height: 3,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              );
  }
}

class StepWidget extends StatelessWidget {
  final Color color;
  final bool isActive;
  final Function() onTap;
  final String title;
  const StepWidget({
    super.key,
    required this.color,
    required this.onTap,
    required this.isActive,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: isActive ? 40 : 30,
            height: isActive ? 40 : 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: color,
            ),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                      height: 2.5,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
