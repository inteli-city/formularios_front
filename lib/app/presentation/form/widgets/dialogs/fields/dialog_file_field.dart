import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:formularios_front/app/presentation/form/controller/cancel_form_controller.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class DialogFileField extends StatefulWidget {
  final int maxQuantity;
  final CancelFormController cancelFormController;

  const DialogFileField({
    super.key,
    required this.cancelFormController,
    required this.maxQuantity,
  });

  @override
  State<DialogFileField> createState() => _DialogFileFieldState();
}

class _DialogFileFieldState extends State<DialogFileField>
    with ValidationMixin {
  final List<String> _selectedFiles = [];

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png']);
    if (result != null && result.files.isNotEmpty) {
      if (widget.maxQuantity > 1) {
        List<String> files = result.files.map((file) {
          if (kIsWeb) {
            return file.bytes != null
                ? 'data:image/${file.extension};base64,${base64Encode(file.bytes!)}'
                : file.name;
          } else {
            return file.path!;
          }
        }).toList();
        setState(
          () {
            _selectedFiles.addAll(files);
            widget.cancelFormController.selectedImages = files;
          },
        );
      } else {
        String file = kIsWeb
            ? (result.files.single.bytes != null
                ? 'data:image/${result.files.single.extension};base64,${base64Encode(result.files.single.bytes!)}'
                : result.files.single.name)
            : result.files.single.path!;
        setState(
          () {
            _selectedFiles.add(file);
            widget.cancelFormController.selectedImages = [file];
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String?>(
      validator: (value) {
        return combine([
          () => isRequired(value.toString(), true, true),
          () => minQuantity(_selectedFiles.length, 1),
          () => maxQuantity(_selectedFiles.length, 1),
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
            Center(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: AppDimensions.paddingSmall),
                    child: Column(
                      children: [
                        if (_selectedFiles.isNotEmpty)
                          ..._selectedFiles.map(
                            (file) {
                              return Center(
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: AppDimensions.paddingSmall),
                                      child: kIsWeb
                                          ? Image.network(
                                              file,
                                              width: 150,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.file(
                                              File(file),
                                              width: 150,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _selectedFiles.remove(file);
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
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ],
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
