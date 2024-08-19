import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/presentation/form/widgets/stepper/stepper_component.dart';
import 'package:gates_microapp_flutter/shared/helpers/utils/screen_helper.dart';

class StepperProgress extends StatefulWidget {
  final int totalSteps;
  final List<SectionEntity> sections;
  final PageController pageController;
  const StepperProgress(
      {super.key,
      required this.totalSteps,
      required this.pageController,
      required this.sections});

  @override
  State<StepperProgress> createState() => _StepperProgressState();
}

class _StepperProgressState extends State<StepperProgress> {
  int currentSectionIndex = 0;
  int lastAccessedIndex = 0;

  @override
  void dispose() {
    widget.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  if (currentSectionIndex == 0) return;
                  currentSectionIndex = currentSectionIndex - 1;
                });
              },
              icon: const Icon(Icons.arrow_left_rounded),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: widget.totalSteps,
                controller: ,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(
                        width: calculateStepWidth(),
                        child: StepperComponent(
                          currentIndex: currentSectionIndex,
                          index: index,
                          isLast: index == widget.totalSteps - 1,
                          isFirst: index == 0,
                          onTap: () {
                            setState(() {
                              currentSectionIndex = index;
                            });
                            widget.pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.fastEaseInToSlowEaseOut,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  if (widget.totalSteps == currentSectionIndex) return;
                  currentSectionIndex = currentSectionIndex + 1;
                });
              },
              icon: const Icon(Icons.arrow_right_rounded),
            ),
          ],
        ),
        Text(
          widget.sections[currentSectionIndex].sectionId,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ],
    );
  }

  double? calculateStepWidth() {
    if (widget.totalSteps == 0) return null;
    return ScreenHelper.width(context) / 6;
  }
}
