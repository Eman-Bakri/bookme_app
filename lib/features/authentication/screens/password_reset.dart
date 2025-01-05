import 'package:bookme_app/features/authentication/screens/login.dart';
import 'package:bookme_app/utils/constants/image_strings.dart';
import 'package:bookme_app/utils/constants/sizes.dart';
import 'package:bookme_app/utils/constants/texts_strings.dart';
import 'package:bookme_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class PasswordReset extends StatelessWidget {
  const PasswordReset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
          ],
        ),
        body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(BMSizes.defaultSpace),
    child: Column(
      children: [
        /// Image covering 60% of screen width
        Image(
            image: const AssetImage(BMImages.verifyImg2),
            width: BMHelperFunctions.screenWidth() * 0.6),
        const SizedBox(height: BMSizes.spaceBtwSections),

        /// --- Title & subtitle
        Text(BMTextStrings.changeYourPasswordTitle,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center),
        const SizedBox(height: BMSizes.spaceBtwItems),
        Text(BMTextStrings.changeYourPasswordSubTitle,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center),
        const SizedBox(height: BMSizes.spaceBtwSections),

        /// --- Button
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => Get.to(() => const LoginScreen()),
                child: const Text(BMTextStrings.done))),
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