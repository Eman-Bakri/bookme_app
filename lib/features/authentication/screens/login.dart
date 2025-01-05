import 'package:bookme_app/features/authentication/screens/password_forget.dart';
import 'package:bookme_app/features/authentication/screens/signup.dart';
import 'package:bookme_app/nav_bar.dart';
import 'package:bookme_app/utils/constants/colors.dart';
import 'package:bookme_app/utils/constants/image_strings.dart';
import 'package:bookme_app/utils/constants/sizes.dart';
import 'package:bookme_app/utils/constants/texts_strings.dart';
import 'package:bookme_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BMHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: BMSizes.appBarHeight,
            left: BMSizes.defaultSpace,
            bottom: BMSizes.defaultSpace,
            right: BMSizes.defaultSpace,
          ),
          child: Column(
            children: [
              /// -- logo, title & subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    height: 150,
                    image: AssetImage(
                        dark ? BMImages.lightAppLogo : BMImages.darkAppLogo),
                  ),
                  Text(BMTextStrings.loginTitle,
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: BMSizes.sm),
                  Text(BMTextStrings.loginSubTitle,
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),

              /// -- Create a form
              Form(
                  child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: BMSizes.spaceBtwSections),
                child: Column(
                  children: [
                    /// -- Email
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.direct_right),
                          labelText: BMTextStrings.email),
                    ),
                    const SizedBox(height: BMSizes.spaceBtwInputFields),

                    /// -- Password field
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.password_check),
                        labelText: BMTextStrings.password,
                        suffixIcon: Icon(Iconsax.eye_slash),
                      ),
                    ),
                    const SizedBox(height: BMSizes.spaceBtwInputFields / 2),

                    /// -- Remember me & Forget pass options
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// -- remember me
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            const Text(BMTextStrings.rememberMe),
                          ],
                        ),

                        /// -- forget pass
                        TextButton(
                            onPressed: () => Get.to(() => const PasswordForget()),
                            child: const Text(BMTextStrings.forgetPassword)),
                      ],
                    ),
                    const SizedBox(height: BMSizes.spaceBtwSections),

                    /// --- Sign in - Button
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () => Get.to(() => const NavigationMenu()),
                            child: const Text(BMTextStrings.signIn))),
                    const SizedBox(height: BMSizes.spaceBtwItems),

                    /// --- Create account Button
                    SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                            onPressed: () => Get.to(() => const SignupScreen()),
                            child: const Text(BMTextStrings.createAccount))),
                  ],
                ),
              )),

              /// -- Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: (Divider(color: dark ? BMColors.darkGrey : BMColors.grey, thickness: 0.5, indent: 60, endIndent: 5)),
                  ),
                  Text(BMTextStrings.orSignInWith.capitalize!, style: Theme.of(context).textTheme.labelMedium),
                  Flexible(
                    child: (Divider(color: dark ? BMColors.darkGrey : BMColors.grey, thickness: 0.5, indent: 5, endIndent: 60)),
                  ),
                ],
              ),
              const SizedBox(height: BMSizes.spaceBtwSections),
              /// -- Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: BMColors.grey), borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                          width: BMSizes.iconMd,
                          height: BMSizes.iconMd,
                          image: AssetImage(BMImages.google)),
                    ),
                  ),
                  const SizedBox(width: BMSizes.spaceBtwItems),
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: BMColors.grey), borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                          width: BMSizes.iconMd,
                          height: BMSizes.iconMd,
                          image: AssetImage(BMImages.facebook)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
