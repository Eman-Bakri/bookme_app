import 'package:bookme_app/features/authentication/controllers/onboarding_controllers.dart';
import 'package:bookme_app/utils/constants/colors.dart';
import 'package:bookme_app/utils/constants/sizes.dart';
import 'package:bookme_app/utils/constants/texts_strings.dart';
import 'package:bookme_app/utils/device/device_utility.dart';
import 'package:bookme_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookme_app/utils/constants/image_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BMHelperFunctions.isDarkMode(context);
    final controller = Get.put(OnBoardingController());

    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          /// --- pages to swipe
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              Padding(
                padding: const EdgeInsets.all(BMSizes.defaultSpace),
                child: Column(
                  children: [
                    Image(
                        width: BMHelperFunctions.screenWidth() * 0.8,
                        height: BMHelperFunctions.screenHeight() * 0.6,
                        image: const AssetImage(BMImages.onBoardingImg1)),
                    Text(
                      BMTextStrings.onBoardingTitle1,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: BMSizes.spaceBtwItems),
                    Text(
                      BMTextStrings.onBoardingSubTitle1,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(BMSizes.defaultSpace),
                child: Column(
                  children: [
                    Image(
                        width: BMHelperFunctions.screenWidth() * 0.8,
                        height: BMHelperFunctions.screenHeight() * 0.6,
                        image: const AssetImage(BMImages.onBoardingImg2)),
                    Text(
                      BMTextStrings.onBoardingTitle2,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: BMSizes.spaceBtwItems),
                    Text(
                      BMTextStrings.onBoardingSubTitle2,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(BMSizes.defaultSpace),
                child: Column(
                  children: [
                    Image(
                        width: BMHelperFunctions.screenWidth() * 0.8,
                        height: BMHelperFunctions.screenHeight() * 0.6,
                        image: const AssetImage(BMImages.onBoardingImg3)),
                    Text(
                      BMTextStrings.onBoardingTitle3,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: BMSizes.spaceBtwItems),
                    Text(
                      BMTextStrings.onBoardingSubTitle3,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),

          /// --- Skip button
          Positioned(
              top: BMDeviceUtility.getAppBarHeight(),
              right: BMSizes.defaultSpace,
              child: TextButton(
                onPressed: () => OnBoardingController.instance.skipPage(),
                child: const Text('Skip'),
              )),

          /// --- Smooth Page indicator
          Positioned(
              bottom: BMDeviceUtility.getBottomNavigationBarHeight() + 25,
              left: BMSizes.defaultSpace,
              child: SmoothPageIndicator(
                controller: controller.pageController,
                onDotClicked: controller.dotMoveClick,
                count: 3,
                effect: ExpandingDotsEffect(
                    activeDotColor: dark ? BMColors.light : BMColors.dark,
                    dotHeight: 6),
              )),
          /// --- Circular button
          Positioned(
            right: BMSizes.defaultSpace,
            bottom: BMDeviceUtility.getBottomNavigationBarHeight(),
            child: ElevatedButton(
              onPressed: () => OnBoardingController.instance.nextPage(),
              style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: dark ? BMColors.primaryColor: Colors.black),
              child: const Icon(Iconsax.arrow_right_3),
            ),
          )
        ],
      ),
    );
  }
}
