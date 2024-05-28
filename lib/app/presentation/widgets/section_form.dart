import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/presentation/controllers/form_section_controller.dart';
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
import 'package:gates_microapp_flutter/helpers/utils/screen_helper.dart';

class SectionForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final SectionEntity section;
  final FormSectionController sectionController;
  final bool lastSection;
  final FormController formController;
  final VoidCallback onSaveSubmit;

  const SectionForm({
    super.key,
    required this.formKey,
    required this.section,
    required this.sectionController,
    required this.lastSection,
    required this.formController,
    required this.onSaveSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final fields = section.fields;

    return Center(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.paddingSmall,
            horizontal: AppDimensions.paddingLarge,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
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
              SizedBox(
                width: ScreenHelper.width(context) * 0.5,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      formController.saveSectionData(
                        sectionData: sectionController.fieldValues,
                        sectionId: section.sectionId,
                      );
                      onSaveSubmit();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMedium,
                      ),
                    ),
                  ),
                  child: Text(
                    lastSection ? 'Enviar' : 'Salvar',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.white,
                        height: 1.2,
                        fontSize: AppDimensions.fontMedium),
                  ),
                ),
              ),
            ],
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
          controller: sectionController,
          key: Key(field.key),
        );

      case FieldTypeEnum.NUMBER_FIELD:
        return CustomNumberFormField(
          field: field as NumberFieldEntity,
          controller: sectionController,
          key: Key(field.key),
        );

      case FieldTypeEnum.DROPDOWN_FIELD:
        return CustomDropDownFormField(
          field: field as DropDownFieldEntity,
          controller: sectionController,
          key: Key(field.key),
        );

      case FieldTypeEnum.CHECKBOX_GROUP_FIELD:
        return CustomCheckBoxGroupFormField(
          field: field as CheckBoxGroupFieldEntity,
          controller: sectionController,
          key: Key(field.key),
        );

      case FieldTypeEnum.CHECKBOX_FIELD:
        return CustomCheckBoxFormField(
          field: field as CheckBoxFieldEntity,
          controller: sectionController,
          key: Key(field.key),
        );

      case FieldTypeEnum.TYPEAHEAD_FIELD:
        return CustomTypeAheadFormField(
          field: field as TypeAheadFieldEntity,
          controller: sectionController,
          key: Key(field.key),
        );

      case FieldTypeEnum.RADIO_GROUP_FIELD:
        return CustomRadioGroupFormField(
          field: field as RadioGroupFieldEntity,
          controller: sectionController,
          key: Key(field.key),
        );

      case FieldTypeEnum.DATE_FIELD:
        return CustomDateFormField(
          field: field as DateFieldEntity,
          controller: sectionController,
          key: Key(field.key),
        );
      case FieldTypeEnum.SWITCH_BUTTON_FIELD:
        return CustomSwitchButtonField(
          field: field as SwitchButtonFieldEntity,
          controller: sectionController,
          key: Key(field.key),
        );
      case FieldTypeEnum.FILE_FIELD:
        return CustomFilePickerFormField(
          field: field as FileFieldEntity,
          controller: sectionController,
          key: Key(field.key),
        );

      default:
        throw UnimplementedError();
    }
  }
}
