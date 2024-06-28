import 'package:bookme_app/features/authentication/screens/login.dart';
import 'package:bookme_app/utils/constants/image_strings.dart';
import 'package:bookme_app/utils/constants/sizes.dart';
import 'package:bookme_app/utils/constants/texts_strings.dart';
import 'package:bookme_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BMHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: BMSizes.appBarHeight * 2,
            left: BMSizes.defaultSpace * 2,
            bottom: BMSizes.defaultSpace * 2,
            right: BMSizes.defaultSpace * 2,
          ),
          child: Column(
            children: [
              // --- Image
              Image(
                  image: const AssetImage(BMImages.verifyImg2),
                  width: BMHelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: BMSizes.spaceBtwSections),

              /// --- Title & subtitle
              Text(BMTextStrings.yourAccountCreatedTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: BMSizes.spaceBtwItems),
              Text(BMTextStrings.yourAccountCreatedSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: BMSizes.spaceBtwSections),

              /// --- Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => const LoginScreen()),
                      child: const Text(BMTextStrings.continueBM))),
            ],
          ),
        ),
      ),
    );
  }
}
