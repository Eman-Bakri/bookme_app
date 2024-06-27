import 'package:bookme_app/utils/constants/colors.dart';
import 'package:bookme_app/utils/constants/image_strings.dart';
import 'package:bookme_app/utils/constants/sizes.dart';
import 'package:bookme_app/utils/constants/texts_strings.dart';
import 'package:bookme_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BMHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BMSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -- Title
              Text(BMTextStrings.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: BMSizes.spaceBtwSections),

              /// -- Sign up Form
              Form(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          expands: false,
                          decoration: const InputDecoration(
                              labelText: BMTextStrings.firstName,
                              prefixIcon: Icon(Iconsax.user)),
                        ),
                      ),
                      const SizedBox(width: BMSizes.spaceBtwInputFields),
                      Expanded(
                        child: TextFormField(
                          expands: false,
                          decoration: const InputDecoration(
                              labelText: BMTextStrings.lastName,
                              prefixIcon: Icon(Iconsax.user)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: BMSizes.spaceBtwInputFields),

                  /// -- UserName
                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: BMTextStrings.username,
                        prefixIcon: Icon(Iconsax.user_edit)),
                  ),

                  /// -- Email
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: BMTextStrings.email,
                        prefixIcon: Icon(Iconsax.direct)),
                  ),
                  const SizedBox(height: BMSizes.spaceBtwInputFields),

                  /// -- Phone no.
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: BMTextStrings.phoneNo,
                      prefixIcon: Icon(Iconsax.call),
                    ),
                  ),
                  const SizedBox(height: BMSizes.spaceBtwInputFields),

                  /// -- password
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: BMTextStrings.password,
                      prefixIcon: Icon(Iconsax.password_check),
                      suffixIcon: Icon(Iconsax.eye_slash),
                    ),
                  ),
                  const SizedBox(height: BMSizes.spaceBtwInputFields),

                  /// -- Terms & Conditions
                  Row(
                    children: [
                      SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(value: true, onChanged: (value) {})),
                      const SizedBox(width: BMSizes.spaceBtwItems),
                      Text.rich(TextSpan(
                        children: [
                          TextSpan(
                              text: '${BMTextStrings.iAgreeTo} ',
                              style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(text: BMTextStrings.privacyPolicy, style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark ? BMColors.white : BMColors.primaryColor,
                          )),
                          TextSpan(text: '${BMTextStrings.and} ', style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(text: BMTextStrings.termsOfUse, style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark ? BMColors.white : BMColors.primaryColor,
                          )),
                        ],
                      ))
                    ],
                  ),
                  const SizedBox(height: BMSizes.spaceBtwSections),

                  /// -- Sign up Button
                   SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text(BMTextStrings.createAccount),),),
                ],
              )),
              const SizedBox(height: BMSizes.spaceBtwSections),
              /// -- Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: (Divider(color: dark ? BMColors.darkGrey : BMColors.grey, thickness: 0.5, indent: 60, endIndent: 5)),
                  ),
                  Text(BMTextStrings.orSignUpWith.capitalize!, style: Theme.of(context).textTheme.labelMedium),
                  Flexible(
                    child: (Divider(color: dark ? BMColors.darkGrey : BMColors.grey, thickness: 0.5, indent: 5, endIndent: 60)),
                  ),
                ],
              ),
              const SizedBox(height: BMSizes.spaceBtwSections),
              /// -- Social media footer
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
              const SizedBox(height: BMSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
