import 'package:bookme_app/features/authentication/screens/login.dart';
import 'package:bookme_app/features/authentication/screens/success_screen.dart';
import 'package:bookme_app/utils/constants/image_strings.dart';
import 'package:bookme_app/utils/constants/sizes.dart';
import 'package:bookme_app/utils/constants/texts_strings.dart';
import 'package:bookme_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BMHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BMSizes.defaultSpace),
          child: Column(
            children: [
              /// --- Image
              Image(
                  image: const AssetImage(BMImages.verifyImg1),
                  width: BMHelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: BMSizes.spaceBtwItems),

              /// --- Title & subtitle
              Text(BMTextStrings.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: BMSizes.spaceBtwItems),
              Text('support@bookmeapp.com',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: BMSizes.spaceBtwItems),
              Text(BMTextStrings.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: BMSizes.spaceBtwSections),

              /// --- Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => const SuccessScreen()),
                      child: const Text(BMTextStrings.continueBM))),
              const SizedBox(height: BMSizes.spaceBtwItems),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(BMTextStrings.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
