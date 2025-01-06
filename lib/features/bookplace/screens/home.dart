import 'package:bookme_app/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookme_app/utils/theme/theme.dart';
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

                      ],
                    ),
                  ],
                ),
              ),
            ),
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