import 'package:bookme_app/common/widgets/appbar.dart';
import 'package:bookme_app/features/bookplace/screens/home.dart';
import 'package:bookme_app/utils/constants/colors.dart';
import 'package:bookme_app/utils/constants/image_strings.dart';
import 'package:bookme_app/utils/constants/sizes.dart';
import 'package:bookme_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

///------ setup the account settings
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        ///-- Header
        ClipPath(
          clipper: BMCustomCurvedEdges(),
          child: Container(
            color: BMColors.primaryColor,
            padding: const EdgeInsets.all(0),
            child: Stack(
              children: [
                Positioned(
                    top: -150,
                    right: -250,
                    child: BMCircularWidget(
                        backgroundColor: BMColors.textWhite.withOpacity(0.1))),
                Positioned(
                    top: 100,
                    right: -300,
                    child: BMCircularWidget(
                        backgroundColor: BMColors.textWhite.withOpacity(0.1))),
                Column(
                  children: [
                    BMAppBar(
                      title: Text(
                        'Account',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: BMColors.white),
                      ),
                    ),

                    /// -- Profile
                    const BMUserProfile(),
                    const SizedBox(height: BMSizes.spaceBtwSections),
                  ],
                )
              ],
            ),
          ),
        ),

        ///-- List Body
        const Padding(
          padding: EdgeInsets.all(BMSizes.defaultSpace),
          child: Column(
            children: [
              ///-- settings
              BMSectionHeading(title: 'Account Settings', showActionButton: false,),
              SizedBox(height: BMSizes.spaceBtwItems),
              BMSettingsMenuItem(icon: Iconsax.receipt_square, title: 'My Requests', subtitle: 'Previous Books you Requested',),
              BMSettingsMenuItem(icon: Iconsax.bank, title: 'Bank Account', subtitle: 'Registered bank account & financial details'),
              BMSettingsMenuItem(icon: Iconsax.notification, title: 'Notifications', subtitle: 'Manage notifications settings',),
              BMSettingsMenuItem(icon: Iconsax.security_card, title: 'Privacy Settings', subtitle: 'Manage data & account settings',),
            ],
          ),
        ),
        const SizedBox(height: BMSizes.spaceBtwSections),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(onPressed: (){}, child: const Text('Logout'),),
        ),
        const SizedBox(height: BMSizes.spaceBtwSections * 2.5),
      ],
    )));
  }
}

class BMSettingsMenuItem extends StatelessWidget {
  const BMSettingsMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing, this.onTap,
  });

  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: BMColors.primaryColor),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}

class BMUserProfile extends StatelessWidget {
  const BMUserProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Image(
        image: AssetImage(BMImages.userW),
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Text(
        'Leyla Ali',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: BMColors.white),
      ),
      subtitle: Text(
        'leylaali223@gmail.com',
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: BMColors.white),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Iconsax.edit,
          color: BMColors.white,
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
