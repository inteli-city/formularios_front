import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/presentation/form/widgets/stepper/stepper_component.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:gates_microapp_flutter/shared/helpers/utils/screen_helper.dart';

class StepperProgress extends StatefulWidget {
  final int totalSteps;
  final List<SectionEntity> sections;
  final PageController pageController;

  const StepperProgress({
    super.key,
    required this.totalSteps,
    required this.pageController,
    required this.sections,
  });

  @override
  State<StepperProgress> createState() => _StepperProgressState();
}

class _StepperProgressState extends State<StepperProgress> {
  int currentSectionIndex = 0;
  PageController stepPageController = PageController();
  ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    widget.pageController.dispose();
    stepPageController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLastSection = widget.totalSteps - 1 == currentSectionIndex;
    bool isFirstSection = currentSectionIndex == 0;

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
              onPressed: isFirstSection
                  ? null
                  : () {
                      setState(() {
                        if (isFirstSection) return;
                        currentSectionIndex = currentSectionIndex - 1;
                      });

                      widget.pageController.previousPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.fastEaseInToSlowEaseOut,
                      );

                      scrollToIndex(currentSectionIndex);
                    },
              icon: Icon(
                Icons.arrow_left_rounded,
                color: AppColors.white,
                size: AppDimensions.iconLarge,
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    isFirstSection ? AppColors.gray : AppColors.primaryBlue),
                elevation: const WidgetStatePropertyAll(8),
                fixedSize: const WidgetStatePropertyAll(Size(30, 30)),
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.all(0),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 160,
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                controller: scrollController,
                itemCount: widget.totalSteps,
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
                            scrollToIndex(index);
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            IconButton(
              onPressed: isLastSection
                  ? null
                  : () {
                      setState(() {
                        if (isLastSection) return;
                        currentSectionIndex = currentSectionIndex + 1;
                      });

                      widget.pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.fastEaseInToSlowEaseOut,
                      );

                      scrollToIndex(currentSectionIndex);
                    },
              icon: Icon(
                Icons.arrow_right_rounded,
                color: AppColors.white,
                size: AppDimensions.iconLarge,
              ),
              
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    isLastSection ? AppColors.gray : AppColors.primaryBlue),
                elevation: const WidgetStatePropertyAll(8),
                fixedSize: const WidgetStatePropertyAll(Size(30, 30)),
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.all(0),
                ),
              ),
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

  void scrollToIndex(int index) {
    double stepWidth = calculateStepWidth() ?? 0.0;
    double offset = stepWidth * index;

    scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 400),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }
}
