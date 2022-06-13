import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/app_constant/app_images.dart';
import '../../Utils/app_text_style.dart';
import '../../Utils/navigation/navigation_service.dart';
import '../../Utils/navigation/routes.dart';
import '../../Utils/widgets/app_space.dart';
import '../../Utils/widgets/custom_button.dart';
import 'titel_widget.dart';
import 'welcome_page_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const VerticalSpace(20),
            const TitleWidget(),
            const VerticalSpace(20),
            const Spacer(),
            AppImages.welcomeImage.widget(
              height: MediaQuery.of(context).size.width / 1.8,
            ),
            const VerticalSpace(20),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: WelcomePageButton(
                    icon: AppImages.happyIcon,
                    backgroundColor: AppColors.themeColor3,
                    onPressed: () {},
                  ),
                ),
                const HorizontalSpace(20),
                Expanded(
                  child: WelcomePageButton(
                    icon: AppImages.shareIcon,
                    backgroundColor: AppColors.orange.withOpacity(0.8),
                    onPressed: () {},
                  ),
                ),
                const HorizontalSpace(20),
                Expanded(
                  child: WelcomePageButton(
                    backgroundColor: AppColors.green2,
                    icon: AppImages.keyIcon,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const VerticalSpace(20),
            CustomButton(
              text: "Let's Start",
              expansed: true,
              color: AppColors.themeColor1,
              borderColor: AppColors.themeColor1,
              borderRedius: 7,
              height: 50,
              textStyle: AppTextStyle.styleWhite22W500,
              onPressed: () {
                NavigationService.push(Routes.home);
              },
            ),
            const VerticalSpace(20),
          ],
        ),
      ),
    );
  }
}
