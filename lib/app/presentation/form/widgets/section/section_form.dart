import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/presentation/form/controllers/form_controller.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/check_box_field.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/check_box_group_field.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/custom_date_field.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/custom_dropdown_field.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/custom_file_picker_field.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/custom_number_field.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/custom_switch_button_field.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/custom_text_field.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/radio_group_field.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/type_ahead_field.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:formularios_front/app/shared/helpers/functions/global_snackbar.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:formularios_front/generated/l10n.dart';

class SectionForm extends StatelessWidget {
  final SectionEntity section;
  final bool lastSection;
  final GlobalKey<FormState> formKey;
  final FormController formController;
  final formProvider = Modular.get<FormUserProvider>();

  SectionForm({
    super.key,
    required this.formController,
    required this.section,
    required this.lastSection,
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
            buildSectionButtons(context)
          ],
        ),
      ),
    );
  }

  Widget buildSectionButtons(BuildContext context) {
    void saveOnPressed() {
      if (!formProvider.isLoading && formKey.currentState!.validate()) {
        formProvider.saveForm(form: formController.form);
      }
    }

    void sendOnPressed() async {
      formController.setIsSendingForm(true);
      if (!formKey.currentState!.validate()) {
        GlobalSnackBar.error(
          S.current.allFieldsShouldBeSaved,
        );
        formController.setIsSendingForm(false);
      } else {
        await formProvider.sendForm(
          formId: formController.form.formId,
          sections: formController.form.sections,
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.paddingSmall),
      child: Row(
        mainAxisAlignment: lastSection
            ? MainAxisAlignment.spaceAround
            : MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          ElevatedButton(
            onPressed: saveOnPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
              ),
            ),
            child: formProvider.isLoading
                ? const CircularProgressIndicator()
                : Text(
                    'Salvar',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.white,
                          height: 1.2,
                          fontSize: AppDimensions.fontMedium,
                        ),
                  ),
          ),
          lastSection
              ? ElevatedButton(
                  onPressed: sendOnPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: lastSection
                        ? Theme.of(context).colorScheme.primary
                        : AppColors.gray,
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
                )
              : Container(),
        ],
      ),
    );
  }

  Widget buildField(FieldEntity field) {
    switch (field.fieldType) {
      case FieldTypeEnum.TEXT_FIELD:
        return CustomTextFormField(
          field: field as TextFieldEntity,
          formController: formController,
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
          formController: formController,
        );

      case FieldTypeEnum.DROPDOWN_FIELD:
        return CustomDropDownFormField(
          field: field as DropDownFieldEntity,
          onChanged: (value) {
            formController.setFieldValue(section.sectionId, field.key, value);
          },
          key: Key(field.key),
          formController: formController,
        );

      case FieldTypeEnum.CHECKBOX_GROUP_FIELD:
        return CustomCheckBoxGroupFormField(
          field: field as CheckBoxGroupFieldEntity,
          onChanged: (value) {
            formController.setFieldValue(section.sectionId, field.key, value);
          },
          key: Key(field.key),
          sectionEntity: section,
          formController: formController,
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
          formController: formController,
        );

      case FieldTypeEnum.RADIO_GROUP_FIELD:
        return CustomRadioGroupFormField(
          field: field as RadioGroupFieldEntity,
          onChanged: (value) {
            formController.setFieldValue(section.sectionId, field.key, value);
          },
          key: Key(field.key),
          sectionEntity: section,
          formController: formController,
        );

      case FieldTypeEnum.DATE_FIELD:
        return CustomDateFormField(
          field: field as DateFieldEntity,
          onChanged: (value) {
            formController.setFieldValue(section.sectionId, field.key, value);
          },
          key: Key(field.key),
          formController: formController,
        );

      case FieldTypeEnum.SWITCH_BUTTON_FIELD:
        return CustomSwitchButtonField(
          field: field as SwitchButtonFieldEntity,
          onChanged: (value) {
            formController.setFieldValue(section.sectionId, field.key, value);
          },
          key: Key(field.key),
          sectionEntity: section,
          formController: formController,
        );

      case FieldTypeEnum.FILE_FIELD:
        return CustomFilePickerFormField(
          field: field as FileFieldEntity,
          onChanged: (value) {
            formController.setFieldValue(section.sectionId, field.key, value);
          },
          key: Key(field.key),
          controller: formController,
          section: section,
        );

      default:
        throw UnimplementedError();
    }
  }
}
