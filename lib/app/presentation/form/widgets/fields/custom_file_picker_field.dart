import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/file_type_enum.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:gates_microapp_flutter/shared/helpers/utils/screen_helper.dart';

class CustomFilePickerFormField extends StatefulWidget {
  final FileFieldEntity field;
  final SectionEntity section;
  final SingleFormProvider singleFormProvider;
  final Function(DateTime?) onChanged;
  final FilePicker filePicker;

  const CustomFilePickerFormField({
    super.key,
    required this.field,
    required this.onChanged,
    required this.singleFormProvider,
    required this.section,
    required this.filePicker,
  });

  @override
  State<CustomFilePickerFormField> createState() =>
      _CustomFilePickerFormFieldState();
}

class _CustomFilePickerFormFieldState extends State<CustomFilePickerFormField>
    with ValidationMixin {
  late List<String> _selectedFiles;

  @override
  void initState() {
    super.initState();
    _selectedFiles = widget.field.value ?? [];
  }

  Future<void> _pickFiles() async {
    FilePickerResult? result = await widget.filePicker.pickFiles(
      allowMultiple: widget.field.maxQuantity > 1,
      type: FileType.custom,
      allowedExtensions: widget.field.fileType == FileTypeEnum.IMAGE
          ? ['jpg', 'jpeg', 'png']
          : widget.field.fileType == FileTypeEnum.DOCUMENT
              ? ['pdf', 'doc', 'docx']
              : null,
    );

    if (result != null && result.files.isNotEmpty) {
      if (widget.field.maxQuantity > 1) {
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
            widget.singleFormProvider.setFieldValue(
                widget.section.sectionId, widget.field.key, _selectedFiles);
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
            widget.singleFormProvider.setFieldValue(
                widget.section.sectionId, widget.field.key, _selectedFiles);
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormField<List<String?>>(
      initialValue: widget.field.value,
      validator: (value) {
        return combine([
          () => isRequired(value.toString(), widget.field.isRequired,
              widget.singleFormProvider.isFormStateLoading),
          () => minQuantity(value?.length, widget.field.minQuantity),
          () => maxQuantity(value?.length, widget.field.maxQuantity),
        ]);
      },
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    color: Theme.of(context).colorScheme.primary,
                    width: 1,
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
            ..._selectedFiles.map(
              (file) {
                return GestureDetector(
                  onTap: () => _showImagePopup(context, file),
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                          width: ScreenHelper.width(context),
                          margin: const EdgeInsets.symmetric(
                              vertical: AppDimensions.paddingSmall),
                          child: kIsWeb
                              ? Image.network(
                                  file,
                                  width: ScreenHelper.width(context) / 2,
                                  height: ScreenHelper.width(context) / 2,
                                  fit: BoxFit.fill,
                                )
                              : Image.file(
                                  File(file),
                                  width: ScreenHelper.width(context) / 2,
                                  height: ScreenHelper.width(context) / 2,
                                  fit: BoxFit.fill,
                                ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedFiles.remove(file);
                                widget.singleFormProvider.setFieldValue(
                                    widget.section.sectionId,
                                    widget.field.key,
                                    _selectedFiles);
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
                );
              },
            ),
            if (state.hasError)
              Text(
                state.errorText ?? '',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
          ],
        );
      },
    );
  }

  void _showImagePopup(BuildContext context, String? selectedFile) {
    if (selectedFile == null) return;

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
                          selectedFile,
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.high,
                        )
                      : Image.file(
                          File(selectedFile),
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
                          _selectedFiles.remove(selectedFile);
                          widget.singleFormProvider.setFieldValue(
                              widget.section.sectionId,
                              widget.field.key,
                              _selectedFiles);
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
}
