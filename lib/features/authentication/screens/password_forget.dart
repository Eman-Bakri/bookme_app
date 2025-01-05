import 'package:bookme_app/features/authentication/screens/password_reset.dart';
import 'package:bookme_app/utils/constants/sizes.dart';
import 'package:bookme_app/utils/constants/texts_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class PasswordForget extends StatelessWidget {
  const PasswordForget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(BMSizes.defaultSpace),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// The headings details
          Text(BMTextStrings.forgetPassword, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: BMSizes.spaceBtwItems),
          Text(BMTextStrings.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
          const SizedBox(height: BMSizes.spaceBtwSections * 2),

          ///  TextFields details
      TextFormField(
        decoration: const InputDecoration(
          labelText: BMTextStrings.email, prefixIcon: Icon(Iconsax.direct_right),
        ),
      ),
          const SizedBox(height: BMSizes.spaceBtwSections),
          ///  The submit button
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.off(() => const PasswordReset()), child: const Text(BMTextStrings.submit))),
        ],
      ),
      ),
    );
  }
  }