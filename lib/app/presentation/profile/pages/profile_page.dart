import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/presentation/user/stores/user_provider.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:formularios_front/generated/l10n.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = Modular.get<UserProvider>().user!;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.paddingLarge),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimensions.paddingSmall,
                            vertical: AppDimensions.paddingExtraLarge),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: AppColors.primaryBlue,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.person,
                              size: 26,
                              color: AppColors.white,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Icon(
                              Icons.email,
                              size: 26,
                              color: AppColors.white,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Icon(
                              Icons.groups_2,
                              size: 26,
                              color: AppColors.white,
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: AppDimensions.paddingMedium),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(user.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(user.email,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(user.groups.length.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(fontWeight: FontWeight.bold))
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: AppDimensions.paddingSmall),
                        child: SizedBox(
                          height: 250,
                          width: double.infinity,
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: AppDimensions.verticalSpaceSmall,
                            ),
                            itemCount: user.groups.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: AppDimensions.verticalSpaceLarge),
                              child: Card(
                                child: SizedBox(
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      user.groups[index],
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Modular.get<UserProvider>().logout();
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: AppColors.primaryBlue,
                            ),
                            child: Text(
                              S.current.logout,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
