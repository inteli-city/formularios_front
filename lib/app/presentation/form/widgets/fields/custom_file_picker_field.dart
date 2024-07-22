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
import 'package:formularios_front/generated/l10n.dart';

class CustomFilePickerFormField extends StatefulWidget {
  final FileFieldEntity field;
  final SectionEntity section;
  final SingleFormProvider singleFormProvider;
  final Function(DateTime?) onChanged;

  const CustomFilePickerFormField({
    super.key,
    required this.field,
    required this.onChanged,
    required this.singleFormProvider,
    required this.section,
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
    FilePickerResult? result = await FilePicker.platform.pickFiles(
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
    String requiredAsterisk = widget.field.isRequired ? '*' : '';

    return FormField<List<String?>>(
      initialValue: widget.field.value,
      validator: (value) {
        return combine([
          () => isRequired(value.toString(), widget.field.isRequired,
              widget.singleFormProvider.isSendingForm),
          () => minQuantity(value?.length, widget.field.minQuantity),
          () => maxQuantity(value?.length, widget.field.maxQuantity),
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
                  '${widget.field.placeholder}:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Text(
                  requiredAsterisk,
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
                    color: Theme.of(context).colorScheme.primary,
                    width: 1.5,
                  ),
                ),
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.attach_file,
                    size: AppDimensions.iconMedium,
                  ),
                  const SizedBox(
                    width: AppDimensions.paddingSmall,
                  ),
                  Text(
                    S.current.selectFiles,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppDimensions.paddingSmall),
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
}
