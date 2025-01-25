import 'package:bookme_app/common/widgets/appbar.dart';
import 'package:bookme_app/features/bookplace/screens/home.dart';
import 'package:bookme_app/utils/constants/image_strings.dart';
import 'package:bookme_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

///------ setup the account settings
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const BMAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      ///-- body
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(BMSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Profile Pic
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage(BMImages.userW),
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    TextButton(onPressed: (){}, child: const Text('Change Profile Picture')),
                  ],
                ),
              ),
              
              ///-- User Details
              const SizedBox(height: BMSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: BMSizes.spaceBtwItems),
              const BMSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: BMSizes.spaceBtwItems),

              ProfileElement(title: 'Name', value: 'Leyla Ali', onPressed: () {}),
              ProfileElement(title: 'Username', value: 'Leyla_Ali', onPressed: () {}),

              const SizedBox(height: BMSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: BMSizes.spaceBtwItems),

              const BMSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: BMSizes.spaceBtwItems),

              ProfileElement(title: 'User ID', value: '53219', icon: Iconsax.copy, onPressed: () {}),
              ProfileElement(title: 'Email', value: 'leylaali223@gmail.com', onPressed: () {}),
              ProfileElement(title: 'Phone no.', value: '+966-422-643001', onPressed: () {}),
              ProfileElement(title: 'Gender', value: 'Female', onPressed: () {}),
              ProfileElement(title: 'Birth Date', value: '13 Oct, 1995', onPressed: () {}),
              const Divider(),
              const SizedBox(height: BMSizes.spaceBtwItems),

              Center(child: TextButton(onPressed: (){}, child: const Text('Delete Account', style: TextStyle(color: Colors.red),)))
            ],
          ),
        ),
        
      ),
    );
  }
}

class ProfileElement extends StatelessWidget {
  const ProfileElement({
    super.key, this.icon = Iconsax.arrow_right_34, required this.title, required this.value, required this.onPressed,
  });

  final IconData icon;
  final String title, value;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: BMSizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(flex: 3, child: Text(title, style: Theme.of(context).textTheme.bodySmall,overflow: TextOverflow.ellipsis,)),
            Expanded(flex: 5, child: Text(value, style: Theme.of(context).textTheme.bodyMedium,overflow: TextOverflow.ellipsis,)),
             Expanded(child: Icon(icon, size: 18)),

          ],
        ),
      ),
    );
  }
}