import 'package:ebeasiswa/app/widgets/dot_indicator_costum.dart';
import 'package:ebeasiswa/gen/assets.gen.dart';
import 'package:ebeasiswa/presentation/onboarding/list_onboarding_view.dart';
import 'package:ebeasiswa/presentation/onboarding/list_user_tokenfcm.dart';
import 'package:ebeasiswa/presentation/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login/login_view.dart';

class OnBoardingView extends StatefulWidget {
  @override
  State<OnBoardingView> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoardingView> {
  OnboaringController controller = Get.put(OnboaringController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: Get.width * 100,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffFFAF53),
                Color(0xffFF8226),
                Color(0xffFF6C06),
              ],
            ),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: dataBoarding.length,
                  controller: controller.pageController,
                  onPageChanged: (index) {
                    setState(() {
                      controller.pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => ImageInformation(
                    pageIndex: controller.pageIndex,
                    onboard: Onboard(
                        asset: dataBoarding[index].asset,
                        judul: dataBoarding[index].judul,
                        deskripsi: dataBoarding[index].deskripsi),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: controller.pageIndex == 2
                    ? Column(
                        children: [
                          SizedBox(
                            width: Get.width * 0.8,
                            height: 45,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                    const Size(300, 45)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                overlayColor:
                                    MaterialStateProperty.all(Colors.blueGrey),
                                elevation: MaterialStateProperty.all(15),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                // controller.pushNotif();
                                Get.to(const LoginView());
                              },
                              child: const Text(
                                "MASUK",
                                style: TextStyle(color: Color(0xffFF6C06)),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: const Text(
                              "Panduan Bagi CPB dan PB",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(
                              dataBoarding.length,
                              (index) => Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: DotIndikator(
                                  aktif: index == controller.pageIndex,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageInformation extends StatelessWidget {
  const ImageInformation({
    Key? key,
    required this.onboard,
    this.pageIndex,
  }) : super(key: key);

  final Onboard onboard;
  final int? pageIndex;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(OnboaringController());
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              onboard.asset.image(fit: BoxFit.fitHeight),
              Container(
                margin: const EdgeInsets.only(top: 70),
                padding: const EdgeInsets.all(40),
                child: pageIndex == 2
                    ? null
                    : Assets.image.lpdp_boarding.image(fit: BoxFit.fitWidth),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 30),
                child: Align(
                  alignment: Alignment.topRight,
                  child: SafeArea(
                    child: InkWell(
                      onTap: () {
                        // c.nextPage();
                        Get.to(const ListUserTOkenFcm());
                      },
                      child: const Text(
                        "Lewati",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 70),
          child: Column(
            children: [
              Text(
                onboard.judul,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15),
              Text(
                onboard.deskripsi,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        )
      ],
    );
  }
}
