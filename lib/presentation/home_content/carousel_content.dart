import 'package:ebeasiswa/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class CarouselContent extends StatelessWidget {
  CarouselContent({super.key});

  final List<Widget> imageSliders = [
    Assets.image.lpdpAppbar.image(height: Get.height, width: Get.width * 0.8),
    Assets.image.lpdpAppbar.image(height: Get.height, width: Get.width * 0.8),
    Assets.image.lpdpAppbar.image(height: Get.height, width: Get.width * 0.8),
    Assets.image.lpdpAppbar.image(height: Get.height, width: Get.width * 0.8),
    Assets.image.lpdpAppbar.image(height: Get.height, width: Get.width * 0.8),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          initialPage: 2,
          autoPlay: true,
        ),
        items: imageSliders,
      ),
    );
  }
}
