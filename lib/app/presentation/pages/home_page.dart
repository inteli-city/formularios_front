import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/presentation/states/form_user_state.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:formularios_front/app/presentation/widgets/bottom_navigation_widget.dart';
import 'package:formularios_front/app/presentation/widgets/form_card.dart';
import 'package:formularios_front/app/presentation/widgets/order_tab_section_chips.dart';
import 'package:formularios_front/app/shared/themes/app_responsive_dimensions.dart';
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
    double responsiveIconSize =
        ResponsiveDimensions.getResponsiveIconSize(context);
    double responsiveFabSize =
        ResponsiveDimensions.getResponsiveFabSize(context);
    return Scaffold(
      body: state is FormUserErrorState
          ? errorBuild(state.error)
          : state is FormUserSuccessState
              ? successBuild(state.forms)
              : const CircularProgressIndicator(),
      bottomNavigationBar: const BottomNavigationWidget(),
      floatingActionButton: SizedBox(
        width: responsiveFabSize,
        height: responsiveFabSize,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            hoverColor: Theme.of(context).colorScheme.secondary,
            shape: const CircleBorder(),
            onPressed: () {},
            child: Icon(
              Icons.rotate_right,
              size: responsiveIconSize,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget successBuild(List<FormEntity> forms) {
    double responsivePadding =
        ResponsiveDimensions.getResponsivePadding(context);
    double responsiveVerticalSpace =
        ResponsiveDimensions.getResponsiveVerticalSpace(context);
    return Column(
      children: [
        const OrderTabSectionChips(),
        SizedBox(height: responsiveVerticalSpace),
        Expanded(
            child: Padding(
                padding: EdgeInsets.all(responsivePadding),
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(scrollbars: false),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: forms.length,
                    itemBuilder: (context, index) => FormCard(
                      form: forms[index],
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      thickness: 0,
                    ),
                  ),
                )))
      ],
    );
  }

  Widget errorBuild(Failure error) {
    return Center(
      child: Text(error.toString()),
    );
  }
}
