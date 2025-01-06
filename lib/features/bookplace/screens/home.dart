import 'package:bookme_app/common/widgets/appbar.dart';
import 'package:bookme_app/utils/constants/colors.dart';
import 'package:bookme_app/utils/constants/texts_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                child: Stack(
                  children: [
                    Positioned(top: -150, right: -250, child: BMCircularWidget(backgroundColor: BMColors.textWhite.withOpacity(0.1))),
                    Positioned(top: 100, right: -300, child: BMCircularWidget(backgroundColor: BMColors.textWhite.withOpacity(0.1))),
                    Column(
                      children: [
                        BMAppBar(title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(BMTextStrings.homeAppBarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: BMColors.grey),),
                            Text(BMTextStrings.homeAppBarSubTitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: BMColors.white),),
                          ],
                        ),
                          actions: [
                            Stack(children: [
                              IconButton(onPressed: (){}, icon: const Icon(Iconsax.book, color: BMColors.white)),
                              Positioned(
                                right: 0,
                                child: Container(
                                  width:18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    color: BMColors.black,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Center(
                                    child: Text('2', style: Theme.of(context).textTheme.labelLarge!.apply(color: BMColors.white, fontSizeFactor: 0.8),),
                                  ),
                                ),
                              ),
                            ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
              ),
        ),
  ],
    )));
  }
}

class BMCircularWidget extends StatelessWidget {
  const BMCircularWidget({
    super.key,
    this.child,
    this.width = 200,
    this.height = 200,
    this.backgroundColor = BMColors.white,
    this.padding = 0,
    this.radius = 200,
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

class BMCustomCurvedEdges extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final curveOneStart = Offset(0, size.height - 20);
    final curveOneEnd = Offset(30, size.height - 20);
    path.quadraticBezierTo(curveOneStart.dx, curveOneStart.dy, curveOneEnd.dx, curveOneEnd.dy);

    final curveTwoStart = Offset(0, size.height - 20);
    final curveTwoEnd = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(curveTwoStart.dx, curveTwoStart.dy, curveTwoEnd.dx, curveTwoEnd.dy);

    final curveThreeStart = Offset(size.width, size.height - 20);
    final curveThreeEnd = Offset(size.width, size.height);
    path.quadraticBezierTo(curveThreeStart.dx, curveThreeStart.dy, curveThreeEnd.dx, curveThreeEnd.dy);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}