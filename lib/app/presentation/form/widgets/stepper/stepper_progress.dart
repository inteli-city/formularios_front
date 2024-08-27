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
  ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    widget.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 100,
          width: calculateStepWidth()! * widget.totalSteps,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.totalSteps,
              controller: scrollController,
              itemBuilder: (context, index) {
                return SizedBox(
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
                );
              }),
        ),
        Text(
          widget.sections[currentSectionIndex].sectionId,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }

  double? calculateStepWidth() {
    if (widget.totalSteps == 0) return null;
    return ScreenHelper.width(context) / 6;
  }
}
