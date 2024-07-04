import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/domain/entities/template_entity.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:formularios_front/app/presentation/create-form/states/template_state.dart';
import 'package:formularios_front/app/presentation/create-form/stores/template_provider.dart';
import 'package:formularios_front/app/presentation/create-form/widgets/text_field_widget.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:provider/provider.dart';

class CreateFormPage extends StatefulWidget {
  const CreateFormPage({super.key});

  @override
  State<CreateFormPage> createState() => _CreateFormPageState();
}

class _CreateFormPageState extends State<CreateFormPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TemplateProvider>(builder: (_, provider, child) {
      var state = provider.state;
      return state is TemplateErrorState
          ? errorBuild(state.error)
          : state is TemplateSuccessState
              ? successBuild(state.templates)
              : const Center(child: CircularProgressIndicator());
    });
  }

  Widget errorBuild(Failure error) {
    return Center(
      key: const Key('error-build'),
      child: Text(error.toString()),
    );
  }

  Widget successBuild(List<TemplateEntity> templates) {
    var provider = Modular.get<TemplateProvider>();
    TemplateEntity? selectedTemplate;
    PriorityEnum? priority;

    var formKey = GlobalKey<FormState>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
              key: const Key('success-build'),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Crie um formulário',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: AppDimensions.paddingLarge),
                DropdownButtonFormField2<TemplateEntity>(
                  isExpanded: true,
                  isDense: true,
                  value: selectedTemplate,
                  validator: (value) {
                    if (value == null) {
                      return 'Selecione um template';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Selecione um template',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryBlue,
                        width: AppDimensions.borderMedium,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMedium,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryBlue,
                        width: AppDimensions.borderMedium,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMedium,
                      ),
                    ),
                  ),
                  items: templates.map(
                    (template) {
                      return DropdownMenuItem(
                        value: template,
                        child: Text(
                          template.formTitle,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (TemplateEntity? template) {
                    selectedTemplate = template;
                  },
                ),
                const SizedBox(height: AppDimensions.paddingMedium),
                const TextFieldWidget(label: 'Area'),
                const SizedBox(height: AppDimensions.paddingMedium),
                const TextFieldWidget(label: 'Cidade'),
                const SizedBox(height: AppDimensions.paddingMedium),
                const TextFieldWidget(label: 'Rua'),
                const SizedBox(height: AppDimensions.paddingMedium),
                const TextFieldWidget(label: 'Número'),
                const SizedBox(height: AppDimensions.paddingMedium),
                const TextFieldWidget(label: 'Latitude'),
                const SizedBox(height: AppDimensions.paddingMedium),
                const TextFieldWidget(label: 'Longitude'),
                const SizedBox(height: AppDimensions.paddingMedium),
                const TextFieldWidget(label: 'Região'),
                const SizedBox(height: AppDimensions.paddingMedium),
                DropdownButtonFormField2<PriorityEnum>(
                  isExpanded: true,
                  isDense: true,
                  value: priority,
                  validator: (value) {
                    if (value == null) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Prioridade',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryBlue,
                        width: AppDimensions.borderMedium,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMedium,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryBlue,
                        width: AppDimensions.borderMedium,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMedium,
                      ),
                    ),
                  ),
                  items: PriorityEnum.values.map(
                    (priority) {
                      return DropdownMenuItem(
                        value: priority,
                        child: Text(
                          priority.enumString,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (PriorityEnum? priority) {
                    priority = priority;
                  },
                ),
                const SizedBox(height: AppDimensions.paddingMedium),
                const TextFieldWidget(label: 'Descrição'),
                const SizedBox(height: AppDimensions.paddingMedium),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: provider.isLoading
                        ? () {}
                        : () async {
                            if (formKey.currentState!.validate()) {
                              // await provider.createForm();
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                    ),
                    child: provider.isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(S.current.createForm,
                            style: Theme.of(context).textTheme.titleLarge),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
