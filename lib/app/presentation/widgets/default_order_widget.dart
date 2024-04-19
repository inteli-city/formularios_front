import 'package:flutter/material.dart';
import 'package:formularios_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:formularios_front/app/shared/themes/app_text_styles.dart';

class DefaultOrderWidget extends StatefulWidget {
  final String defaultOrderTitle;
  final String keyValue;
  final int count;

  const DefaultOrderWidget(
      {super.key,
      required this.defaultOrderTitle,
      required this.count,
      required this.keyValue});

  @override
  // ignore: library_private_types_in_public_api
  _DefaultOrderWidgetState createState() => _DefaultOrderWidgetState();
}

class _DefaultOrderWidgetState extends State<DefaultOrderWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  String get keyValue => widget.keyValue;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(_controller);
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
      key: Key(keyValue),
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTap: () {},
      child: SizedBox(
        height: 80,
        width: ScreenHelper.width(context) * 0.4,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Card(
            margin: const EdgeInsets.symmetric(
                horizontal: AppDimensions.marginMedium, vertical: 0),
            elevation: 5,
            shape: Theme.of(context).cardTheme.shape,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingSmall, vertical: 0),
              child: Center(
                child: Text(
                  '${widget.defaultOrderTitle}\n(${widget.count})',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyText1.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
