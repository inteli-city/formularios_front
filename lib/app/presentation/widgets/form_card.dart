import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:formularios_front/app/shared/themes/app_text_styles.dart';

class FormCard extends StatefulWidget {
  final FormEntity form;

  const FormCard({super.key, required this.form});

  @override
  State<FormCard> createState() => _FormCardState();
}

class _FormCardState extends State<FormCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Card(
          color: Theme.of(context).cardTheme.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppDimensions.radiusLarge,
            ),
            side: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              style: BorderStyle.solid,
              width: AppDimensions.borderMedium,
            ),
          ),
          elevation: Theme.of(context).cardTheme.elevation,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingMedium,
              vertical: AppDimensions.paddingMedium,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.form.template,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: AppDimensions.verticalSpaceMedium,
                ),
                Text(
                  widget.form.street,
                  style: AppTextStyles.bodyText1.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(
                  height: AppDimensions.verticalSpaceMedium,
                ),
                Text(
                  widget.form.expirationDate.toString(),
                  style: AppTextStyles.bodyText1.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
