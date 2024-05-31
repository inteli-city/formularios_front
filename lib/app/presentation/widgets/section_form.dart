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
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class SectionForm extends StatelessWidget {
  final SectionEntity section;
  final bool lastSection;
  final FormController formController;
  final GlobalKey<FormState> formKey;

  const SectionForm({
    super.key,
    required this.section,
    required this.lastSection,
    required this.formController,
    required this.formKey,
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
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                    vertical: AppDimensions.paddingExtraLarge),
                physics: const BouncingScrollPhysics(),
                itemCount: fields.length,
                itemBuilder: (context, index) => buildField(fields[index]),
                separatorBuilder: (context, index) => const Divider(
                  thickness: 0,
                  color: Colors.transparent,
                  indent: 100,
                  endIndent: 0,
                  height: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppDimensions.paddingSmall),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      formController.setIsSendingForm(false);
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radiusMedium),
                      ),
                    ),
                    child: Text(
                      'Salvar',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.white,
                            height: 1.2,
                            fontSize: AppDimensions.fontMedium,
                          ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (lastSection) {
                        formController.setIsSendingForm(true);
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          formController.sendForm();
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lastSection ? Theme.of(context).colorScheme.primary : AppColors.gray,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radiusMedium),
                      ),
                    ),
                    child: Text(
                      'Enviar',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.white,
                            height: 1.2,
                            fontSize: AppDimensions.fontMedium,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
          formController: formController,
          key: Key(field.key),
        );

      case FieldTypeEnum.NUMBER_FIELD:
        return CustomNumberFormField(
          field: field as NumberFieldEntity,
          onChanged: (value) {
            formController.setFieldValue(section.sectionId, field.key, value);
          },
          formController: formController,
          key: Key(field.key),
        );

      case FieldTypeEnum.DROPDOWN_FIELD:
        return CustomDropDownFormField(
          field: field as DropDownFieldEntity,
          onChanged: (value) {
            formController.setFieldValue(section.sectionId, field.key, value);
          },
          formController: formController,
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
          formController: formController,
          key: Key(field.key),
        );

      case FieldTypeEnum.RADIO_GROUP_FIELD:
        return CustomRadioGroupFormField(
          field: field as RadioGroupFieldEntity,
          onChanged: (value) {
            formController.setFieldValue(section.sectionId, field.key, value);
          },
          formController: formController,
          key: Key(field.key),
        );

      case FieldTypeEnum.DATE_FIELD:
        return CustomDateFormField(
          field: field as DateFieldEntity,
          onChanged: (value) {
            formController.setFieldValue(section.sectionId, field.key, value);
          },
          formController: formController,
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
