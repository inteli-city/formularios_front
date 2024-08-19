import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/form/widgets/section/section_form.dart';
import 'package:formularios_front/app/presentation/form/widgets/stepper/stepper_progress.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:gates_microapp_flutter/shared/helpers/utils/screen_helper.dart';
import 'package:provider/provider.dart';

class FormSectionsPage extends StatefulWidget {
  const FormSectionsPage({super.key});

  @override
  State<FormSectionsPage> createState() => FormSectionsPageState();
}

class FormSectionsPageState extends State<FormSectionsPage> {
  SingleFormProvider singleFormProvider = Modular.get<SingleFormProvider>();
  final PageController _pageController = PageController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SingleFormProvider>(
          create: (context) => singleFormProvider,
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.primaryBlue,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.white,
                size: AppDimensions.iconLarge,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            title: Column(
              children: [
                Text(
                  singleFormProvider.form.formTitle,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppDimensions.paddingSmall),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    StepperProgress(
                      totalSteps: singleFormProvider.form.sections.length,
                      pageController: _pageController,
                      sections: singleFormProvider.form.sections,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Form(
                  key: formKey,
                  child: ListView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: singleFormProvider.form.sections.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: ScreenHelper.width(context),
                        child: SectionForm(
                          section: singleFormProvider.form.sections[index],
                          singleFormProvider: singleFormProvider,
                          lastSection: index ==
                              singleFormProvider.form.sections.length - 1,
                          formKey: formKey,
                        ),
                      );
                    },
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
