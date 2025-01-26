import 'dart:ui';

import 'package:bookme_app/common/widgets/appbar.dart';
import 'package:bookme_app/common/widgets/book_card.dart';
import 'package:bookme_app/common/widgets/bookmetadata.dart';
import 'package:bookme_app/features/bookplace/screens/home.dart';
import 'package:bookme_app/utils/constants/colors.dart';
import 'package:bookme_app/utils/constants/image_strings.dart';
import 'package:bookme_app/utils/constants/sizes.dart';
import 'package:bookme_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

///------ setup the account settings
class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BMHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Book Image
            BMCircularWidget(
              child: Container(
                color: dark ? BMColors.darkerGrey : BMColors.light,
                child: const Stack(
                  children: [
                    SizedBox(
                        height: 400,
                        child: Padding(
                          padding: EdgeInsets.all(BMSizes.bookImgRadius * 2),
                          child: Center(
                              child:
                                  Image(image: AssetImage(BMImages.bookImg1))),
                        )),

                    /// AppBar Icons
                    BMAppBar(
                      showBackArrow: true,
                      actions: [
                        BMFavoriteIcon(
                          icon: Iconsax.heart5,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            ///--- Book Details
             Padding(
                padding: const EdgeInsets.only(
                    right: BMSizes.defaultSpace,
                    left: BMSizes.defaultSpace,
                    bottom: BMSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Price & Title
                  const BookMetaData(),
                  /// -- place location to receive book
                  const SizedBox(height: BMSizes.spaceBtwItems /2),
                 const Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BMSectionHeading(title: 'Places to Pick up Your Book:', showActionButton: false,),
                     SizedBox(height: BMSizes.spaceBtwItems /2),
                    Wrap(
                      spacing: 8,
                      children:[
                    ChoiceChip(backgroundColor: BMColors.buttonPrimary ,label: Text('King Fahad National Library - Riyadh'), selected: true),
                    ChoiceChip(label: Text('The Culture House - Dammam Public Library'), selected: false),
                    ChoiceChip(label: Text('King Abdulaziz Public Library - Riyadh'), selected: false),
                    ChoiceChip(label: Text('Prophet\'s Mosque Library - Madinah'), selected: false),
                    ChoiceChip(label: Text('Qeraaty Library - Khobar '), selected: false),]),


                  ],
                ),
                  const SizedBox(height: BMSizes.spaceBtwSections),
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: Text('Send a Request'))),
                  const SizedBox(height: BMSizes.spaceBtwSections),

                  /// -- Description
                  const BMSectionHeading(title: 'Description:', showActionButton: false,),
                  const SizedBox(height: BMSizes.spaceBtwItems),
                  const ReadMoreText('Language, Literature and Culture uses an interdisciplinary methodology to connect three separate and vast disciplines. The material combines the examination of the history of ideas with traditional philosophical analysis to show that these three different disciplines are, at heart, linked by common concepts. Students will explore high and low culture, linguistic determinism, cultural and moral relativism, and theories of translation. They will consider The Enlightenment and the modern reaction to it, Post-Modernism.',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Read More ',
                  trimExpandedText: 'Less',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),),

                  const SizedBox(height: BMSizes.spaceBtwSections),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
