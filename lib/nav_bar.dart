import 'package:bookme_app/features/bookplace/screens/home.dart';
import 'package:bookme_app/features/personaliization/screens/account.dart';
import 'package:bookme_app/utils/constants/colors.dart';
import 'package:bookme_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

///------ Navigation bar down the screen
class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = BMHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
          () => NavigationBar (
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? BMColors.black : Colors.white,
          indicatorColor: darkMode ? BMColors.white.withOpacity(0.1) : BMColors.black.withOpacity(0.1),

          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'WishList'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
        ]),
      ),
      body: Obx (() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [const HomeScreen() ,Container(color: Colors.purple),const AccountScreen()];

}