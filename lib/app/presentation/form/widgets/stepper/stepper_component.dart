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
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                    height: 2, color: Theme.of(context).colorScheme.primary),
              ),
              buildStep(context),
            ],
          )
        : isFirst
            ? Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildStep(context),
                  Expanded(
                    child: Container(
                      height: 2,
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
                      height: 2,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  buildStep(context),
                  Expanded(
                    child: Container(
                        height: 2,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              );
  }

  Widget buildStep(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: index == currentIndex
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
            ),
            child: Center(
              child: Text(
                index.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                      height: 2,
                    ),
              ),
            ),
          ),
        ),
        Text(
          'FORMID',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
