import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/color/color.dart';
import '../../../shared/fonts/font.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://res.cloudinary.com/dkkga3pht/image/upload/v1681324501/Ellipse_133_ufdnuh.png',
              width: 121,
              height: 121,
              alignment: Alignment.topLeft,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120.0),
              child: CachedNetworkImage(
                imageUrl:
                    'https://res.cloudinary.com/dkkga3pht/image/upload/v1681324302/Vector_37_mnn1cg.png',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 200,
              ),
              width: double.infinity,
              child: CachedNetworkImage(
                alignment: Alignment.topRight,
                imageUrl:
                    'https://res.cloudinary.com/dkkga3pht/image/upload/v1681325877/Ellipse_134_mid4s3.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.79),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://res.cloudinary.com/dkkga3pht/image/upload/v1681324995/Group_1453_shka7i.png',
                      width: 122.19,
                      height: 151.58,
                    ),
                  ),
                  CachedNetworkImage(
                    alignment: Alignment.bottomRight,
                    imageUrl:
                        'https://res.cloudinary.com/dkkga3pht/image/upload/v1681325225/Group_1597882873_lck882.png',
                    width: 209.35,
                    height: 129,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            'https://res.cloudinary.com/dkkga3pht/image/upload/v1681324842/Group_1597882871_alh2je.png',
                        width: 235.66,
                      ),
                      Text(
                        'Welcome',
                        style: titleLogin.copyWith(color: Colors.white),
                      ),
                      Text(
                        'Sign in to continue',
                        style: subtitleLogin.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 175,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                      top: 35,
                      left: 30,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('Your Email Address'),
                          const Text('Password'),
                          
                          Center(
                            child: RichText(
                              text: TextSpan(
                                style:
                                    bottomLoginText.copyWith(color: Colors.black),
                                text: 'Don\'t have a account? ',
                                children: [
                                  TextSpan(
                                    text: 'Sign Up',
                                    style :bottomLoginText.copyWith(color: Colors.amber),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
