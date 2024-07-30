import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:formularios_front/app/presentation/form/controller/cancel_form_controller.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:gates_microapp_flutter/shared/helpers/utils/screen_helper.dart';
import 'package:image_picker/image_picker.dart';

class DialogFileField extends StatefulWidget {
  final CancelFormController cancelFormController;

  const DialogFileField({
    super.key,
    required this.cancelFormController,
  });

  @override
  State<DialogFileField> createState() => _DialogFileFieldState();
}

class _DialogFileFieldState extends State<DialogFileField>
    with ValidationMixin {
  String? _selectedFile;

  Future<void> _pickFiles() async {
    String base64Image;

    XFile? image = await ImagePicker().pickImage(
      imageQuality: 50,
      source: ImageSource.gallery,
    );

    if (image != null) {
      base64Image = base64Encode(await image.readAsBytes());
      setState(() {
        _selectedFile = image.path;
        widget.cancelFormController.setImage(base64Image);
      });
    }
  }

  void _showImagePopup(BuildContext context) {
    if (_selectedFile == null) return;

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  kIsWeb
                      ? Image.network(
                          _selectedFile!,
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.high,
                        )
                      : Image.file(
                          File(_selectedFile!),
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.high,
                        ),
                ],
              ),
              Positioned(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    IconButton(
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.white),
                          shape:
                              WidgetStatePropertyAll(RoundedRectangleBorder())),
                      color: AppColors.white,
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        size: AppDimensions.iconLarge,
                        color: AppColors.primaryBlue,
                        weight: 900,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    IconButton(
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.white),
                          shape:
                              WidgetStatePropertyAll(RoundedRectangleBorder())),
                      icon: Icon(
                        Icons.close,
                        size: AppDimensions.iconLarge,
                        color: AppColors.red,
                        weight: 900,
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedFile = null;
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String?>(
      validator: (value) {
        return combine([
          () => isRequired(value.toString(), true, true),
        ]);
      },
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Padding(
                padding:
                    const EdgeInsets.only(right: AppDimensions.paddingSmall),
                child: Text(
                  'Selecionar imagem:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Text(
                  '*',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.red,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              )
            ]),
            const SizedBox(height: AppDimensions.paddingSmall),
            ElevatedButton(
              onPressed: _pickFiles,
              style: ElevatedButton.styleFrom(
                elevation: 4,
                padding: const EdgeInsets.symmetric(
                    vertical: AppDimensions.paddingMedium,
                    horizontal: AppDimensions.paddingLarge),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppDimensions.radiusMedium,
                  ),
                  side: BorderSide(
                    color: AppColors.primaryBlue,
                    width: AppDimensions.borderMedium,
                  ),
                ),
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.image_search_rounded,
                    fill: 1,
                    size: AppDimensions.iconLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppDimensions.paddingSmall),
            if (_selectedFile != null)
              GestureDetector(
                onTap: () => _showImagePopup(context),
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: AppDimensions.paddingSmall),
                        child: Center(
                          child: kIsWeb
                              ? Image.network(
                                  _selectedFile!,
                                  width: ScreenHelper.width(context) / 2,
                                  height: ScreenHelper.width(context) / 2,
                                  fit: BoxFit.fill,
                                )
                              : Image.file(
                                  File(_selectedFile!),
                                  width: ScreenHelper.width(context) / 2,
                                  height: ScreenHelper.width(context) / 2,
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedFile = null;
                            });
                          },
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            state.hasError
                ? Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      state.errorText ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.red),
                    ),
                  )
                : const SizedBox(),
          ],
        );
      },
    );
  }
}
