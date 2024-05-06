import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:intl/intl.dart';

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
    Modular.to.navigate('/home/forms/${widget.form.externFormId}');
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    Color iconStatusColor = widget.form.status == FormStatusEnum.NAO_INICIADO
        ? AppColors.green
        : widget.form.status == FormStatusEnum.EM_ANDAMENTO
            ? AppColors.yellow
            : AppColors.red;

    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(widget.form.expirationDate);
    String formattedDate = DateFormat('dd/MM/yyyy HH:mm:ss').format(dateTime);

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Card(
          elevation: 5,
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
          child: Container(
            height: 130,
            padding: const EdgeInsets.symmetric(
                vertical: AppDimensions.paddingSmall,
                horizontal: AppDimensions.paddingMedium),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(widget.form.system,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold)),
                        Text(widget.form.template,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(
                            width: AppDimensions.horizontalSpaceSmall),
                        Text(widget.form.externFormId,
                            style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(widget.form.city,
                            style: Theme.of(context).textTheme.bodyLarge),
                        const SizedBox(
                            width: AppDimensions.horizontalSpaceSmall),
                        Text('${widget.form.street}, ${widget.form.number}',
                            style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                    Text(formattedDate,
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text(widget.form.description ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
                Positioned(
                  right: -10,
                  top: -10,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.circle,
                      size: AppDimensions.iconSmall * 1.6,
                      color: iconStatusColor,
                    ),
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
