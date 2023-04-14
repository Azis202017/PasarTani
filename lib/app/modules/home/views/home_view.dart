import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pasartani/app/widgets/headers/headers_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(initState: (_) {
      controller.checkTime();
    }, builder: (context) {
      return SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Headers(
                title: 'Selamat ${controller.title}',
                username: 'Abdul Azis Al Ayubbi',
              ),
            ],
          ),
        ),
      );
    });
  }
}
