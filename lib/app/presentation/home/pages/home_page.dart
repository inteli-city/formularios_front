import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:formularios_front/app/presentation/home/states/form_user_state.dart';
import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart';
import 'package:formularios_front/app/presentation/home/widgets/filter_tab_widget.dart';
import 'package:formularios_front/app/presentation/home/widgets/form_card.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:formularios_front/app/shared/themes/app_text_styles.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FormsProvider>(builder: (_, provider, child) {
      var state = provider.state;
      return state is FormUserErrorState
          ? errorBuild(state.error)
          : state is FormUserSuccessState
              ? successBuild(state.forms)
              : const Center(child: CircularProgressIndicator());
    });
  }

  Widget successBuild(List<FormEntity> filteredForms) {
    return Column(
      key: const Key('success-build'),
      children: [
        const SizedBox(height: AppDimensions.paddingMedium),
        const FilterTabWidget(),
        Divider(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          thickness: 2,
        ),
        filteredForms.isNotEmpty
            ? Expanded(
                key: const Key('success-build-not-empty'),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ScrollConfiguration(
                    behavior:
                        const ScrollBehavior().copyWith(scrollbars: false),
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: filteredForms.length,
                      itemBuilder: (context, index) => FormCard(
                        form: filteredForms[index],
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 4,
                      ),
                    ),
                  ),
                ),
              )
            : Expanded(
                key: const Key('success-build-empty'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      S.current.notFoundForm,
                      style: AppTextStyles.display,
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: AppDimensions.verticalSpaceMedium,
                    ),
                    const Icon(Icons.assignment_late,
                        size: AppDimensions.iconExtraLarge * 1.5),
                  ],
                ),
              ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget errorBuild(Failure error) {
    return Center(
      key: const Key('error-build'),
      child: Text(error.toString()),
    );
  }
}
