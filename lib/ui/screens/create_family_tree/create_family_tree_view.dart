import 'package:famlaika/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import 'package:famlaika/ui/screens/create_family_tree/create_family_tree_viewmodel.dart';
import 'package:famlaika/constants/app_strings.dart';
import 'package:famlaika/ui/widgets/shared.dart';

import '../../../app/app.locator.dart';
import '../../../constants/assets.gen.dart';
import '../../../services/theme_service.dart';
import '../../tools/screen_size.dart';

class CreateFamilyTreeView extends StatelessWidget {
  const CreateFamilyTreeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = locator<ThemeService>().theme;
    return ViewModelBuilder<CreateFamilyTreeViewmodel>.reactive(
      viewModelBuilder: () {
        return CreateFamilyTreeViewmodel();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: appBar(
            title: AppStrings.createFamilyTree,
            skip: viewModel.skipTo,
          ),
          body: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: ScreenSize.height - ScreenSize.safeAreaVertical - appBarHeight),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.spMax),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.spMax),
                  Text(AppStrings.keepYourFamilyConnected, style: theme.textTheme.bodySmall),
                  SizedBox(height: 14.spMax),
                  Expanded(
                    child: Stack(
                      children: [
                        Positioned(
                          top: 32.spMax,
                          left: 74.spMax,
                          right: 74.spMax,
                          child: SvgPicture.asset(
                            height: 345.spMax,
                            width: 181.spMax,
                            Assets.svg.familyTree,
                            theme: const SvgTheme(
                              currentColor: Palette.primary,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 26.spMax,
                          right: 26.spMax,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  familyTreeNode(label: AppStrings.father),
                                  familyTreeNode(label: AppStrings.mother),
                                ],
                              ),
                              SizedBox(height: 50.spMax),
                              Align(
                                alignment: Alignment.centerRight,
                                child: familyTreeNode(label: AppStrings.sibling),
                              ),
                              SizedBox(height: 18.spMax),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  familyTreeNode(label: AppStrings.me, haveSelected: true),
                                  familyTreeNode(label: AppStrings.spouse),
                                ],
                              ),
                              SizedBox(height: 2.spMax),
                              familyTreeNode(label: AppStrings.child),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
