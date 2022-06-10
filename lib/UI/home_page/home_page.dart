import 'package:aadhar_card_loan_guide/Utils/app_constant/app_images.dart';
import 'package:aadhar_card_loan_guide/Utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/home_provider/home_provider.dart';
import '../../Utils/app_colors.dart';
import '../../Utils/widgets/app_space.dart';
import 'widgets/grid_view_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return SafeArea(
      child: Material(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              const VerticalSpace(40),
              AppImages.threePondIamge.widget(
                height: 200,
              ),
              const VerticalSpace(40),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.themeColor1,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    AppImages.aadharIcon.widget(
                      height: 30,
                      color: AppColors.white,
                    ),
                    const HorizontalSpace(10),
                    Text(
                      'Aadhar Loan Guide',
                      style: AppTextStyle.styleWhite17W500,
                    ),
                  ],
                ),
              ),
              const VerticalSpace(20),
              for (int i = 0; i < provider.gridVuewItems.length; i = i + 2) ...[
                Row(
                  children: [
                    Flexible(
                      child: GriedViewItem(
                        title: provider.gridVuewItems[i].title,
                        icon: provider.gridVuewItems[i].image.widget(),
                        backgroundImage: const Placeholder(),
                        backgroundColor:
                            provider.gridVuewItems[i].backgroundColor,
                      ),
                    ),
                    const HorizontalSpace(15),
                    Flexible(
                      child: GriedViewItem(
                        title: provider.gridVuewItems[i + 1].title,
                        icon: provider.gridVuewItems[i + 1].image.widget(),
                        backgroundImage: const Placeholder(),
                        backgroundColor:
                            provider.gridVuewItems[i + 1].backgroundColor,
                      ),
                    ),
                  ],
                ),
                const VerticalSpace(15),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
