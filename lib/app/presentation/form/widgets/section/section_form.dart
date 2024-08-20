import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
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
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:gates_microapp_flutter/shared/helpers/functions/global_snackbar.dart';
import 'package:provider/provider.dart';

class SectionForm extends StatelessWidget {
  final SectionEntity section;
  final bool lastSection;
  final GlobalKey<FormState> formKey;
  final SingleFormProvider singleFormProvider;

  const SectionForm({
    super.key,
    required this.singleFormProvider,
    required this.section,
    required this.lastSection,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingLarge,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                    vertical: AppDimensions.paddingSmall),
                physics: const BouncingScrollPhysics(),
                itemCount: section.fields.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppDimensions.paddingSmall,
                  ),
                  child: buildField(section.fields[index]),
                ),
              ),
            ),
            singleFormProvider.form.status == FormStatusEnum.CONCLUDED
                ? const SizedBox()
                : buildSectionButtons(context)
          ],
        ),
      ),
    );
  }

  Widget buildSectionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.paddingSmall),
      child: Row(
        mainAxisAlignment: lastSection
            ? MainAxisAlignment.spaceAround
            : MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Consumer<SingleFormProvider>(
            builder: (_, provider, child) {
              return provider.isFormStateLoading
                  ? ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll<Color?>(
                          AppColors.gray.withOpacity(0.7),
                        ),
                        elevation: const WidgetStatePropertyAll(4),
                      ),
                      child: Text(
                        'Salvando',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: AppColors.white,
                                  height: 1.2,
                                  fontSize: AppDimensions.fontMedium,
                                ),
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await singleFormProvider.saveForm();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      child: Consumer<SingleFormProvider>(
                          builder: (_, provider, child) {
                        return Text(
                          S.current.saveForm,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColors.white,
                                    height: 1.2,
                                    fontSize: AppDimensions.fontMedium,
                                  ),
                        );
                      }),
                    );
            },
          ),
          lastSection
              ? Consumer<SingleFormProvider>(
                  builder: (_, provider, child) {
                    return provider.isSendingForm
                        ? ElevatedButton(
                            onPressed: null,
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll<Color?>(
                                AppColors.gray.withOpacity(0.7),
                              ),
                              elevation: const WidgetStatePropertyAll(4),
                            ),
                            child: Text(
                              'Enviando',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: AppColors.white,
                                    height: 1.2,
                                    fontSize: AppDimensions.fontMedium,
                                  ),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () async {
                              singleFormProvider.setIsSendingForm(true);
                              if (!formKey.currentState!.validate()) {
                                GlobalSnackBar.error(
                                  S.current.allFieldsShouldBeSaved,
                                );
                              } else {
                                await singleFormProvider.sendForm();
                                Modular.to.navigate('/home/forms');
                              }
                              singleFormProvider.setIsSendingForm(false);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: lastSection
                                  ? Theme.of(context).colorScheme.primary
                                  : AppColors.gray,
                            ),
                            child: Text(
                              S.current.sendForm,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: AppColors.white,
                                    height: 1.2,
                                    fontSize: AppDimensions.fontMedium,
                                  ),
                            ),
                          );
                  },
                )
              : Container(),
        ],
      ),
    );
  }

  Widget buildField(FieldEntity field) {
    FormStatusEnum status = singleFormProvider.form.status;
    Widget fieldWidget;
    switch (field.fieldType) {
      case FieldTypeEnum.TEXT_FIELD:
        fieldWidget = CustomTextFormField(
          field: field as TextFieldEntity,
          singleFormProvider: singleFormProvider,
          onChanged: (value) {
            singleFormProvider.setFieldValue(
                section.sectionId, field.key, value);
          },
          key: Key(field.key),
        );

      case FieldTypeEnum.NUMBER_FIELD:
        fieldWidget = CustomNumberFormField(
          field: field as NumberFieldEntity,
          onChanged: (value) {
            singleFormProvider.setFieldValue(
                section.sectionId, field.key, double.tryParse(value));
          },
          key: Key(field.key),
          singleFormProvider: singleFormProvider,
        );

      case FieldTypeEnum.DROPDOWN_FIELD:
        fieldWidget = CustomDropDownFormField(
          field: field as DropDownFieldEntity,
          onChanged: (value) {
            singleFormProvider.setFieldValue(
                section.sectionId, field.key, value);
          },
          key: Key(field.key),
          singleFormProvider: singleFormProvider,
        );

      case FieldTypeEnum.CHECKBOX_GROUP_FIELD:
        fieldWidget = CustomCheckBoxGroupFormField(
          field: field as CheckBoxGroupFieldEntity,
          onChanged: (value) {
            singleFormProvider.setFieldValue(
                section.sectionId, field.key, value);
          },
          key: Key(field.key),
          sectionEntity: section,
          singleFormProvider: singleFormProvider,
        );

      case FieldTypeEnum.CHECKBOX_FIELD:
        fieldWidget = CustomCheckBoxFormField(
          field: field as CheckBoxFieldEntity,
          onChanged: (value) {
            singleFormProvider.setFieldValue(
                section.sectionId, field.key, value);
          },
          key: Key(field.key),
          sectionEntity: section,
          singleFormProvider: singleFormProvider,
        );

      case FieldTypeEnum.TYPEAHEAD_FIELD:
        fieldWidget = CustomTypeAheadFormField(
          field: field as TypeAheadFieldEntity,
          onChanged: (value) {
            singleFormProvider.setFieldValue(
                section.sectionId, field.key, value);
          },
          key: Key(field.key),
          singleFormProvider: singleFormProvider,
        );

      case FieldTypeEnum.RADIO_GROUP_FIELD:
        fieldWidget = CustomRadioGroupFormField(
          field: field as RadioGroupFieldEntity,
          onChanged: (value) {
            singleFormProvider.setFieldValue(
                section.sectionId, field.key, value);
          },
          key: Key(field.key),
          sectionEntity: section,
          singleFormProvider: singleFormProvider,
        );

      case FieldTypeEnum.DATE_FIELD:
        fieldWidget = CustomDateFormField(
          field: field as DateFieldEntity,
          onChanged: (value) {
            singleFormProvider.setFieldValue(
                section.sectionId, field.key, value);
          },
          key: Key(field.key),
          singleFormProvider: singleFormProvider,
        );

      case FieldTypeEnum.SWITCH_BUTTON_FIELD:
        fieldWidget = CustomSwitchButtonField(
          field: field as SwitchButtonFieldEntity,
          onChanged: (value) {
            singleFormProvider.setFieldValue(
                section.sectionId, field.key, value);
          },
          key: Key(field.key),
          sectionEntity: section,
          singleFormProvider: singleFormProvider,
        );

      case FieldTypeEnum.FILE_FIELD:
        fieldWidget = CustomFilePickerFormField(
          field: field as FileFieldEntity,
          onChanged: (value) {
            singleFormProvider.setFieldValue(
                section.sectionId, field.key, value);
          },
          key: Key(field.key),
          filePicker: FilePicker.platform,
          singleFormProvider: singleFormProvider,
          section: section,
        );

      default:
        throw UnimplementedError();
    }

    if (status == FormStatusEnum.CONCLUDED) {
      fieldWidget = AbsorbPointer(
        absorbing: true,
        child: fieldWidget,
      );
    }

    return fieldWidget;
  }
}
