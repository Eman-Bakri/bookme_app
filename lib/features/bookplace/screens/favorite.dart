import 'package:bookme_app/common/widgets/appbar.dart';
import 'package:bookme_app/common/widgets/bmgridLayout.dart';
import 'package:bookme_app/common/widgets/book_card.dart';
import 'package:bookme_app/features/bookplace/screens/home.dart';
import 'package:bookme_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

///------ setup the favorite screen
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BMAppBar(
        title: Text('Favorites', style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const HomeScreen()),
              icon: const Icon(Iconsax.add)),
        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BMSizes.defaultSpace),
          child: Column(
            children: [
              BMGridLayout(itemCount: 5, itemBuilder: (_, index) => const BMBookCard()),
            ],
          ),
        ),
      ),
    );
  }
}