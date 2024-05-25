import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/presentation/controllers/form_controller.dart';
import 'package:formularios_front/app/presentation/controllers/form_section_controller.dart';
import 'package:formularios_front/app/presentation/widgets/fields/check_box_field.dart';
import 'package:formularios_front/app/presentation/widgets/fields/check_box_group_field.dart';
import 'package:formularios_front/app/presentation/widgets/fields/custom_dropdown_field.dart';
import 'package:formularios_front/app/presentation/widgets/fields/custom_number_field.dart';
import 'package:formularios_front/app/presentation/widgets/fields/custom_text_field.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:gates_microapp_flutter/helpers/utils/screen_helper.dart';

class SectionForm extends StatefulWidget {
  final SectionEntity section;
  final FormController formController;
  final FormSectionController sectionController;
  final bool lastSection;

  const SectionForm({
    super.key,
    required this.section,
    required this.sectionController,
    required this.lastSection,
    required this.formController,
  });

  @override
  State<SectionForm> createState() => _SectionFormState();
}

class _SectionFormState extends State<SectionForm> {
  @override
  void initState() {
    super.initState();
  }

  Widget buildField(FieldEntity field) {
    switch (field.fieldType) {
      case FieldTypeEnum.TEXT_FIELD:
        return CustomTextFormField(
          field: field as TextFieldEntity,
          controller: widget.sectionController,
          key: Key(field.key),
        );

      case FieldTypeEnum.NUMBER_FIELD:
        return CustomNumberFormField(
          field: field as NumberFieldEntity,
          controller: widget.sectionController,
          key: Key(field.key),
        );

      case FieldTypeEnum.DROPDOWN_FIELD:
        return CustomDropDownFormField(
          field: field as DropDownFieldEntity,
          controller: widget.sectionController,
          key: Key(field.key),
        );

      case FieldTypeEnum.CHECKBOX_GROUP_FIELD:
        return CustomCheckBoxGroupFormField(
          field: field as CheckBoxGroupFieldEntity,
          controller: widget.sectionController,
          key: Key(field.key),
        );

      case FieldTypeEnum.CHECKBOX_FIELD:
        return CustomCheckBoxFormField(
          field: field as CheckBoxFieldEntity,
          controller: widget.sectionController,
          key: Key(field.key),
        );

      case FieldTypeEnum.TYPEAHEAD_FIELD:
      // return CustomTypeAheadFormField(
      //   field: field as TypeAheadFieldEntity,
      //   controller: widget.sectionController,
      //   key: Key(field.key),
      // );

      case FieldTypeEnum.RADIO_GROUP_FIELD:
      // return CustomRadioGroupFormField(
      //   field: field as RadioGroupFieldEntity,
      //   controller: widget.sectionController,
      //   key: Key(field.key),
      // );

      case FieldTypeEnum.DATE_FIELD:
      // return CustomDateFormField(
      //   field: field as DateFieldEntity,
      //   controller: widget.sectionController,
      //   key: Key(field.key),
      // );

      case FieldTypeEnum.SWITCH_BUTTON_FIELD:
        return Container();

      case FieldTypeEnum.FILE_FIELD:
        return Container();

      default:
        throw UnimplementedError();
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final fields = widget.section.fields;
    return Center(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 0,
            bottom: AppDimensions.paddingSmall,
            right: AppDimensions.paddingLarge,
            left: AppDimensions.paddingLarge,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppDimensions.paddingSmall),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: fields.length,
                    itemBuilder: (context, index) => buildField(fields[index]),
                    separatorBuilder: (context, index) => Divider(
                      thickness: 1.5,
                      color: Theme.of(context).colorScheme.primary,
                      indent: 60,
                      endIndent: 60,
                      height: AppDimensions.verticalSpaceExtraLarge * 2,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: ScreenHelper.width(context) * 0.5,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      widget.formController.saveSectionData(
                        widget.section.sectionId,
                        widget.sectionController.fieldValues,
                      );
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
                    widget.lastSection ? 'Enviar' : 'Salvar',
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
}
