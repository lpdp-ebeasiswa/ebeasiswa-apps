import 'package:ebeasiswa/gen/assets.gen.dart';
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
                          deskripsi: dataBoarding[index].deskripsi)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 40),
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
                        padding: const EdgeInsets.symmetric(vertical: 32),
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

class DotIndikator extends StatelessWidget {
  const DotIndikator({
    Key? key,
    this.aktif = false,
  }) : super(key: key);

  final bool aktif;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: aktif ? 25 : 8,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: aktif
                ? [
                    const Color(0xffF9B415),
                    const Color(0xffFFD87E),
                  ]
                : [
                    const Color(0xffFFFFFF),
                    const Color(0xffFFFFFF),
                  ],
          ),
          // color: aktif ? Colors.white : Colors.white.withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}

class Onboard {
  final String judul, deskripsi;
  final AssetGenImage asset;

  Onboard({required this.asset, required this.judul, required this.deskripsi});
}

final List<Onboard> dataBoarding = [
  Onboard(
      asset: Assets.image.lpdp_board1,
      judul: "Selamat datang di E-Beasiswa!",
      deskripsi:
          "Aplikasi untuk mempermudah semua urusan Proses Administrasi Awardee."),
  Onboard(
      asset: Assets.image.lpdp_board2,
      judul: "Report",
      deskripsi: "Mempermudah semua proses Laporan Awardee."),
  Onboard(
      asset: Assets.image.lpdp_board3,
      judul: "Realtime status & Monitoring",
      deskripsi: "Bisa cek langsung status dan aktivitas kamu."),
];

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
                        pageIndex != 2
                            ? c.pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease)
                            : Get.to(const LoginView());
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
          padding: const EdgeInsets.only(bottom: 50),
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
              const SizedBox(height: 10),
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
