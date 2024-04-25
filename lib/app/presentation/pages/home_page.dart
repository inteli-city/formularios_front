import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/presentation/states/form_user_state.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:formularios_front/app/presentation/widgets/form_card.dart';
import 'package:formularios_front/app/presentation/widgets/order_tab_section_chips.dart';
import 'package:formularios_front/app/presentation/widgets/search_filter_tab.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var state = context.watch<FormUserProvider>().state;
    return state is FormUserErrorState
        ? errorBuild(state.error)
        : state is FormUserSuccessState
            ? successBuild(state.forms)
            : const CircularProgressIndicator();
  }

  Widget successBuild(List<FormEntity> forms) {
    return Column(
      key: const Key('success-build'),
      children: [
        const SizedBox(height: AppDimensions.verticalSpaceMedium),
        const OrderTabSectionChips(),
        const SizedBox(height: AppDimensions.verticalSpaceMedium),
        const SearchFilterTab(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              top: AppDimensions.paddingMedium,
              left: AppDimensions.paddingMedium,
              right: AppDimensions.paddingMedium,
            ),
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(scrollbars: false),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: forms.length,
                itemBuilder: (context, index) => FormCard(
                  form: forms[index],
                ),
                separatorBuilder: (context, index) => const Divider(
                  height: 5,
                  thickness: 0,
                ),
              ),
            ),
          ),
        )
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
