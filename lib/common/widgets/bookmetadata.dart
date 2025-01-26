import 'package:bookme_app/common/widgets/book_card.dart';
import 'package:bookme_app/utils/constants/colors.dart';
import 'package:bookme_app/utils/constants/sizes.dart';
import 'package:bookme_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

///------ setup the account settings
class BookMetaData extends StatelessWidget {
  const BookMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BMHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// -- Price & Status (Rent vs. Sell)
        Row(
          children: [
            BMRoundedContainer(
                radius: BMSizes.sm,
                backgroundColor: BMColors.secondary.withOpacity(0.8),
                padding: const EdgeInsets.symmetric(horizontal: BMSizes.sm, vertical: BMSizes.xs),
                child: Text('Rent', style: Theme.of(context).textTheme.labelLarge!.apply(color: BMColors.black),),
              ),
            const SizedBox(width: BMSizes.spaceBtwItems),
            /// -- Price
            Text('17 SR', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.none)),
            ///const SizedBox(width: BMSizes.spaceBtwSections * 6),
            Padding(
              padding: const EdgeInsets.only(left: 210),
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.share, size: BMSizes.iconMd,)),
            ),
          ],
        ),
        const SizedBox(height: BMSizes.spaceBtwItems /1.5),
        
        /// -- Title
        const BMBookTitleText(title: 'Language, Literature & Culture'),
        const SizedBox(height: BMSizes.spaceBtwItems /1.5),


      ],
    );
  }
}