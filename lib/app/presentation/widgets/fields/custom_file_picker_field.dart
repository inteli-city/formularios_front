import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/enum/file_type_enum.dart';
import 'package:formularios_front/app/presentation/controllers/form_section_controller.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class CustomFilePickerFormField extends StatefulWidget {
  final FileFieldEntity field;
  final FormSectionController controller;

  const CustomFilePickerFormField(
      {super.key, required this.field, required this.controller});

  @override
  State<CustomFilePickerFormField> createState() =>
      _CustomFilePickerFormFieldState();
}

class _CustomFilePickerFormFieldState extends State<CustomFilePickerFormField> {
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

    if (result != null) {
      setState(() {
        _selectedFiles = result.paths.cast<String>().toList();
        widget.controller.setFieldValue(widget.field.key, _selectedFiles);
      });
    }
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
                  horizontal: AppDimensions.paddingLarge,
                  vertical: AppDimensions.paddingSmall),
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
                const SizedBox(width: AppDimensions.paddingSmall),
                Text(
                  'Selecionar Arquivos',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            )),
        const SizedBox(height: AppDimensions.paddingSmall),
        ..._selectedFiles.map((file) => ListTile(
              title: Text(
                file.split('/').last,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    _selectedFiles.remove(file);
                    widget.controller
                        .setFieldValue(widget.field.key, _selectedFiles);
                  });
                },
              ),
            )),
        if (widget.field.isRequired && _selectedFiles.isEmpty)
          Text(
            'Este campo é obrigatório',
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
      ],
    );
  }
}
