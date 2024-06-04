import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/enum/file_type_enum.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class CustomFilePickerFormField extends StatefulWidget {
  final FileFieldEntity field;
  final Function(DateTime?) onChanged;

  const CustomFilePickerFormField({
    super.key,
    required this.field,
    required this.onChanged,
  });

  @override
  State<CustomFilePickerFormField> createState() =>
      _CustomFilePickerFormFieldState();
}

class _CustomFilePickerFormFieldState extends State<CustomFilePickerFormField> {
  late List<String> _selectedFiles;
  bool _showError = false;

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
            return file.name;
          } else {
            return file.path!;
          }
        }).toList();
        setState(
          () {
            _selectedFiles.addAll(files);
            // widget.controller.setFieldValue(widget.field.key, _selectedFiles);
          },
        );
      } else {
        String file =
            kIsWeb ? result.files.single.name : result.files.single.path!;
        setState(
          () {
            _selectedFiles.add(file);
            // widget.controller.setFieldValue(widget.field.key, _selectedFiles);
          },
        );
      }
    }
  }

  bool validate() {
    setState(
      () {
        _showError = widget.field.isRequired && _selectedFiles.isEmpty ||
            _selectedFiles.length < widget.field.minQuantity ||
            _selectedFiles.length > widget.field.maxQuantity;
      },
    );
    return !_showError;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.field.placeholder,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: AppDimensions.paddingSmall),
        ElevatedButton(
          onPressed: _pickFiles,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingExtraLarge,
                vertical: AppDimensions.paddingMedium),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  AppDimensions.radiusMedium,
                ),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1.5,
                )),
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.attach_file,
                size: AppDimensions.iconMedium,
              ),
              Text(
                'Selecionar Arquivos',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDimensions.paddingSmall),
        ..._selectedFiles.map(
          (file) => ListTile(
            title: Text(
              textAlign: TextAlign.center,
              file.split('/').last,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete,
                  size: AppDimensions.iconMedium,
                  color: Theme.of(context).colorScheme.primary),
              onPressed: () {
                setState(
                  () {
                    _selectedFiles.remove(file);
                    // widget.controller
                    //     .setFieldValue(widget.field.key, _selectedFiles);
                  },
                );
              },
            ),
          ),
        ),
        if (_showError)
          Text(
            'Este campo é obrigatório, ou a quantidade de arquivos está fora do permitido.',
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
      ],
    );
  }
}
