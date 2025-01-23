import 'dart:ui';

import 'package:bookme_app/common/styles/shadows.dart';
import 'package:bookme_app/utils/constants/colors.dart';
import 'package:bookme_app/utils/constants/image_strings.dart';
import 'package:bookme_app/utils/constants/sizes.dart';
import 'package:bookme_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

///------ setup the vertical cards
class BMBookCard extends StatelessWidget {
  const BMBookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [BMShadowStyling.verticalCardShadow],
          borderRadius: BorderRadius.circular(BMSizes.bookImgRadius),
          color: BMHelperFunctions.isDarkMode(context)
              ? BMColors.darkerGrey
              : BMColors.white,
        ),
        child: Column(
          children: [
            /// -- image thumbnail + favorite button + status
            BMRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(BMSizes.sm),
              backgroundColor: BMHelperFunctions.isDarkMode(context)
                  ? BMColors.dark
                  : BMColors.light,
              child: Stack(
                children: [
                  ///--- Thumbnail
                  const BMRoundedImg(imageUrl: BMImages.bookImg1, applyImgRadius: true),

                  ///--- Status for sharing the book [sold, donated, rented]
                  Positioned(
                    top: 12,
                    child: BMRoundedContainer(
                      radius: BMSizes.sm,
                      backgroundColor: BMColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: BMSizes.sm, vertical: BMSizes.xs),
                      child: Text('Rent', style: Theme.of(context).textTheme.labelLarge!.apply(color: BMColors.black),),
                    ),
                  ),
                  ///-- Favorite icon
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: BMFavoriteIcon(icon: Iconsax.heart5, color: Colors.red,)),
                ],
              ),
            ),
            const SizedBox(height: BMSizes.spaceBtwItems / 2),
            /// --- Details
              Padding(padding: const EdgeInsets.only(left: BMSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BMBookTitleText(title: 'Literature & Culture', smallSize: true),
                  const SizedBox(height: BMSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Text('Tech', overflow: TextOverflow.ellipsis, maxLines: 1, style: Theme.of(context).textTheme.labelMedium,),
                      const SizedBox(width: BMSizes.xs),
                      const Icon(Iconsax.category_25, color: BMColors.primaryColor, size: BMSizes.iconXs,)
                    ],
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// price if applicable
                  Text(
                  '39.9 SR',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: BMColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(BMSizes.cardRadiusMd),
                        bottomRight: Radius.circular(BMSizes.bookImgRadius),
                      )
                    ),
                    child: const SizedBox(
                        width: BMSizes.iconLg * 1.2,
                        height: BMSizes.iconLg * 1.2,
                        child: Center(child: Icon(Iconsax.add, color: BMColors.white,))),
                  ),
                ],
              )
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}

class BMBookTitleText extends StatelessWidget {
  const BMBookTitleText({
    super.key, required this.title, this.smallSize = false, this.maxLines = 2, this.textAlign = TextAlign.left,
  });
  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
    style: smallSize ? Theme.of(context).textTheme.labelLarge : Theme.of(context).textTheme.titleSmall,
    overflow: TextOverflow.ellipsis,
    maxLines: maxLines,
    textAlign: textAlign,);
  }
}

class BMFavoriteIcon extends StatelessWidget {
  const BMFavoriteIcon({
    super.key, this.width, this.height, this.size = BMSizes.lg, this.color, this.backgroundColor, this.onPressed, required this.icon,
  });

  final double? width;
  final double? height;
  final double? size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null ? backgroundColor! : BMHelperFunctions.isDarkMode(context) ? BMColors.black.withOpacity(0.9) : BMColors.white.withOpacity(0.9),
      ),
      child: IconButton(onPressed: (){}, icon: Icon(icon, color: color, size: size,),),
    );
  }
}

class BMRoundedImg extends StatelessWidget {
  const BMRoundedImg(
      {super.key,
      this.width,
      this.height,
      required this.imageUrl,
      this.applyImgRadius = true,
      this.border,
      this.backgroundColor = BMColors.light,
      this.fit = BoxFit.contain,
      this.padding,
      this.isNetworkImg = false,
      this.onPressed,
      this.borderRadius = BMSizes.md});

  final double? width;
  final double? height;
  final String imageUrl;
  final bool applyImgRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImg;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImgRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
          child: Image(fit: fit, image: isNetworkImg ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider),
        ),
      ),
    );
  }
}

class BMRoundedContainer extends StatelessWidget {
  const BMRoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.radius = BMSizes.cardRadiusLg,
      this.child,
      this.showBorder = false,
      this.borderColor = BMColors.borderPrimary,
      this.backgroundColor = BMColors.white,
      this.padding,
      this.margin});

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
