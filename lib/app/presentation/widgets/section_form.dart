import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/presentation/controllers/form_controller.dart';
import 'package:formularios_front/app/presentation/widgets/fields/check_box_field.dart';
import 'package:formularios_front/app/presentation/widgets/fields/check_box_group_field.dart';
import 'package:formularios_front/app/presentation/widgets/fields/custom_date_field.dart';
import 'package:formularios_front/app/presentation/widgets/fields/custom_dropdown_field.dart';
import 'package:formularios_front/app/presentation/widgets/fields/custom_file_picker_field.dart';
import 'package:formularios_front/app/presentation/widgets/fields/custom_number_field.dart';
import 'package:formularios_front/app/presentation/widgets/fields/custom_switch_button_field.dart';
import 'package:formularios_front/app/presentation/widgets/fields/custom_text_field.dart';
import 'package:formularios_front/app/presentation/widgets/fields/radio_group_field.dart';
import 'package:formularios_front/app/presentation/widgets/fields/type_ahead_field.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class SectionForm extends StatelessWidget {
  final SectionEntity section;
  final bool lastSection;
  final FormController formController;

  const SectionForm({
    super.key,
    required this.section,
    required this.lastSection,
    required this.formController,
  });

  @override
  Widget build(BuildContext context) {
    final fields = section.fields;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.paddingSmall,
          horizontal: AppDimensions.paddingLarge,
        ),
        child: Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
                vertical: AppDimensions.paddingExtraLarge),
            physics: const BouncingScrollPhysics(),
            itemCount: fields.length,
            itemBuilder: (context, index) => buildField(fields[index]),
            separatorBuilder: (context, index) => Divider(
              thickness: 1.5,
              color: Theme.of(context).colorScheme.primary,
              indent: 80,
              endIndent: 80,
              height: AppDimensions.verticalSpaceExtraLarge * 2,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildField(FieldEntity field) {
    switch (field.fieldType) {
      case FieldTypeEnum.TEXT_FIELD:
        return CustomTextFormField(
          field: field as TextFieldEntity,
          onChanged: (value) {
            formController.setFieldValue(section.sectionId, field.key, value);
          },
          key: Key(field.key),
        );

      case FieldTypeEnum.NUMBER_FIELD:
        return CustomNumberFormField(
          field: field as NumberFieldEntity,
          onChanged: (value) {
            formController.setFieldValue(section.sectionId, field.key, value);
          },
          key: Key(field.key),
        );

      case FieldTypeEnum.DROPDOWN_FIELD:
        return CustomDropDownFormField(
          field: field as DropDownFieldEntity,
          onChanged: (value) {
            formController.setFieldValue(section.sectionId, field.key, value);
          },
          key: Key(field.key),
        );

      case FieldTypeEnum.CHECKBOX_GROUP_FIELD:
        return CustomCheckBoxGroupFormField(
          field: field as CheckBoxGroupFieldEntity,
          onChanged: (value) {
            formController.setFieldValue(section.sectionId, field.key, value);
          },
          key: Key(field.key),
        );

      case FieldTypeEnum.CHECKBOX_FIELD:
        return CustomCheckBoxFormField(
          field: field as CheckBoxFieldEntity,
          onChanged: (value) {
            formController.setFieldValue(section.sectionId, field.key, value);
          },
          key: Key(field.key),
        );

      case FieldTypeEnum.TYPEAHEAD_FIELD:
        return CustomTypeAheadFormField(
          field: field as TypeAheadFieldEntity,
          onChanged: (value) {
            formController.setFieldValue(section.sectionId, field.key, value);
          },
          key: Key(field.key),
        );

      case FieldTypeEnum.RADIO_GROUP_FIELD:
        return CustomRadioGroupFormField(
          field: field as RadioGroupFieldEntity,
          onChanged: (value) {
            formController.setFieldValue(section.sectionId, field.key, value);
          },
          key: Key(field.key),
        );

      case FieldTypeEnum.DATE_FIELD:
        return CustomDateFormField(
          field: field as DateFieldEntity,
          onChanged: (value) {
            formController.setFieldValue(section.sectionId, field.key, value);
          },
          key: Key(field.key),
        );
      case FieldTypeEnum.SWITCH_BUTTON_FIELD:
        return CustomSwitchButtonField(
          field: field as SwitchButtonFieldEntity,
          onChanged: (value) {
            formController.setFieldValue(section.sectionId, field.key, value);
          },
          key: Key(field.key),
        );
      case FieldTypeEnum.FILE_FIELD:
        return CustomFilePickerFormField(
          field: field as FileFieldEntity,
          onChanged: (value) {
            formController.setFieldValue(section.sectionId, field.key, value);
          },
          key: Key(field.key),
        );

      default:
        throw UnimplementedError();
    }
  }
}
