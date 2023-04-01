import 'package:flutter/material.dart';
import 'package:real_estate/widgets/custom/custom_elevated_button.dart';
import 'package:real_estate/widgets/custom/for_text_custom_widget.dart';

import '../utilities/app_images.dart';
import 'main_screen.dart';

class FrontScreen extends StatelessWidget {
  const FrontScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    height: 450,
                    width: double.infinity,
                    child: Image(
                        image: AssetImage(AppImages.homeBackground),
                        fit: BoxFit.fill),
                  ),
                ),
                Positioned(
                  bottom: -height * 0.5,
                  left: 0,
                  right: 0,
                  child: ClipPath(
                    clipper: ClipPathClass(),
                    child: Container(
                      height: height * 0.6,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(68)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 20),
                            const ForText(
                              name: 'Chose Best ',
                              bold: true,
                              size: 42,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Our properties the masterpiece for \nevery client with lasting value.',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            CustomElevatedButton(
                                title: 'Continue', onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> MainScreen()));
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.lineTo(0, 40);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
