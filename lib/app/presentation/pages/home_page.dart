import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/presentation/states/form_user_state.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:formularios_front/app/presentation/widgets/filter_tab_widget.dart';
import 'package:formularios_front/app/presentation/widgets/form_card.dart';
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
    final formUserProvider = context.watch<FormUserProvider>();

    var state = formUserProvider.state;

    return state is FormUserErrorState
        ? errorBuild(state.error)
        : state is FormUserSuccessState
            ? successBuild(state.forms)
            : const CircularProgressIndicator();
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
                        height: 5,
                      ),
                    ),
                  ),
                ),
              )
            : Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Nenhum formulário encontrado!',
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
