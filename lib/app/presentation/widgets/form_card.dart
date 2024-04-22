import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/shared/themes/app_responsive_dimensions.dart';
import 'package:formularios_front/app/shared/themes/app_text_styles.dart';

class FormCard extends StatefulWidget {
  final FormEntity form;

  const FormCard({super.key, required this.form});

  @override
  // ignore: library_private_types_in_public_api
  _FormCardState createState() => _FormCardState();
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
    double responsivePadding =
        ResponsiveDimensions.getResponsivePadding(context);
    double responsiveRadius = ResponsiveDimensions.getResponsiveRadius(context);
    double responsiveBorderThickness =
        ResponsiveDimensions.getResponsiveBorderThickness(context);
    double responsiveVerticalSpace =
        ResponsiveDimensions.getResponsiveVerticalSpace(context);

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Card(
          color: Theme.of(context).cardTheme.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(responsiveRadius),
            side: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
                style: BorderStyle.solid,
                width: responsiveBorderThickness),
          ),
          elevation: Theme.of(context).cardTheme.elevation,
          child: Padding(
            padding: EdgeInsets.all(responsivePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.form.templateName,
                    style: AppTextStyles.headline1.copyWith(
                        color: Theme.of(context).colorScheme.secondary)),
                SizedBox(height: responsiveVerticalSpace),
                Text(widget.form.street,
                    style: AppTextStyles.bodyText1.copyWith(
                        color: Theme.of(context).colorScheme.secondary)),
                SizedBox(height: responsiveVerticalSpace),
                Text(
                  widget.form.expiration.toString(),
                  style: AppTextStyles.bodyText1.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
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
