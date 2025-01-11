import 'package:bookme_app/common/widgets/appbar.dart';
import 'package:bookme_app/utils/constants/colors.dart';
import 'package:bookme_app/utils/constants/image_strings.dart';
import 'package:bookme_app/utils/constants/sizes.dart';
import 'package:bookme_app/utils/constants/texts_strings.dart';
import 'package:bookme_app/utils/device/device_utility.dart';
import 'package:bookme_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

///------ Home Screen of the App
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        /// header details
        ClipPath(
          clipper: BMCustomCurvedEdges(),
          child: Container(
            color: BMColors.primaryColor,
            padding: const EdgeInsets.all(0),
            child: SizedBox(
              height: 400,
              child: Stack(
                children: [
                  Positioned(
                      top: -150,
                      right: -250,
                      child: BMCircularWidget(
                          backgroundColor:
                              BMColors.textWhite.withOpacity(0.1))),
                  Positioned(
                      top: 100,
                      right: -300,
                      child: BMCircularWidget(
                          backgroundColor:
                              BMColors.textWhite.withOpacity(0.1))),
                  Column(
                    children: [
                      ///--- The App Bar
                      BMAppBar(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              BMTextStrings.homeAppBarTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .apply(color: BMColors.grey),
                            ),
                            Text(
                              BMTextStrings.homeAppBarSubTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .apply(color: BMColors.white),
                            ),
                          ],
                        ),
                        actions: [
                          Stack(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Iconsax.book,
                                      color: BMColors.white)),
                              Positioned(
                                right: 0,
                                child: Container(
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    color: BMColors.black,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '2',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .apply(
                                              color: BMColors.white,
                                              fontSizeFactor: 0.8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: BMSizes.spaceBtwSections),

                      ///--- Search Bar
                      const BMSearchContainer(text: 'Search for Books'),
                      const SizedBox(height: BMSizes.spaceBtwSections),

                      /// --- Categories
                      Padding(
                        padding:
                            const EdgeInsets.only(left: BMSizes.defaultSpace),
                        child: Column(
                          children: [
                            ///heading string
                            const BMSectionHeading(
                              title: 'Book Categories',
                              showActionButton: false,
                              textColor: Colors.white,
                            ),
                            const SizedBox(height: BMSizes.spaceBtwItems),

                            /// categories
                            SizedBox(
                              height: 80,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 6,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, index) {
                                  return BMCategorySlider(image: BMImages.fic, title: 'Fiction', onTap: (){});
                                  return null;
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        /// -- Body of Home Page
        /// -- Banner Section
        Padding(
          padding: const EdgeInsets.all(BMSizes.defaultSpace),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(BMSizes.md)),
              child: ClipRRect(borderRadius: BorderRadius.circular(BMSizes.md) ,child: const Image(image: AssetImage(BMImages.sectionBanner), fit: BoxFit.contain,)),
            ),
        ),
      ],
    )));
  }
}

class BMCategorySlider extends StatelessWidget {
  const BMCategorySlider({
    super.key,
    required this.image,
    required this.title,
    this.textColor = BMColors.white,
    this.backgroundColor = BMColors.white,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: BMSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(BMSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (BMHelperFunctions.isDarkMode(context) ? BMColors.black : BMColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  color: BMHelperFunctions.isDarkMode(context) ? BMColors.light : BMColors.dark,
                ),
              ),
            ),

            /// the text
            const SizedBox(height: BMSizes.spaceBtwItems / 2),
            SizedBox(
                width: 55,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
          ],
        ),
      ),
    );
  }
}

class BMSectionHeading extends StatelessWidget {
  const BMSectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = 'View all',
    this.onPressed,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonTitle))
      ],
    );
  }
}

class BMSearchContainer extends StatelessWidget {
  const BMSearchContainer(
      {super.key,
      required this.text,
      this.icon = Iconsax.search_normal,
      this.showBackground = true,
      this.showBorder = true});

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = BMHelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: BMSizes.defaultSpace),
      child: Container(
        width: BMDeviceUtility.getScreenWidth(context),
        padding: const EdgeInsets.all(BMSizes.md),
        decoration: BoxDecoration(
          color: showBackground
              ? dark
                  ? BMColors.dark
                  : BMColors.light
              : Colors.transparent,
          borderRadius: BorderRadius.circular(BMSizes.cardRadiusLg),
          border: showBorder ? Border.all(color: BMColors.grey) : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: BMColors.darkerGrey,
            ),
            const SizedBox(width: BMSizes.spaceBtwItems),
            Text(text, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

class BMCircularWidget extends StatelessWidget {
  const BMCircularWidget({
    super.key,
    this.child,
    this.width = 400,
    this.height = 400,
    this.backgroundColor = BMColors.white,
    this.padding = 0,
    this.radius = 400,
  });

  final Widget? child;
  final double padding;
  final double radius;
  final double? width;
  final double? height;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: BMColors.textWhite.withOpacity(0.1),
      ),
      child: child,
    );
  }
}

class BMCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final curveOneStart = Offset(0, size.height - 20);
    final curveOneEnd = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        curveOneStart.dx, curveOneStart.dy, curveOneEnd.dx, curveOneEnd.dy);

    final curveTwoStart = Offset(0, size.height - 20);
    final curveTwoEnd = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(
        curveTwoStart.dx, curveTwoStart.dy, curveTwoEnd.dx, curveTwoEnd.dy);

    final curveThreeStart = Offset(size.width, size.height - 20);
    final curveThreeEnd = Offset(size.width, size.height);
    path.quadraticBezierTo(curveThreeStart.dx, curveThreeStart.dy,
        curveThreeEnd.dx, curveThreeEnd.dy);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
