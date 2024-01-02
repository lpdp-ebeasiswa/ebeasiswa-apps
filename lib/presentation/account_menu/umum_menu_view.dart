import 'package:ebeasiswa/gen/assets.gen.dart';
import 'package:ebeasiswa/presentation/faq/faq_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../data/model/account_menu/account_menu_model.dart';
import '../../data/model/userProfil/user_profile_model.dart';
import '../../gen/colors.gen.dart';
import '../profile_informasi_beasiswa/profile_informasi_beasiswa_view.dart';
import '../profile_informasi_studi/profile_informasi_studi_view.dart';
import '../profile_informasi_umum/profile_informasi_umum_view.dart';

class UmumMenuView extends StatefulWidget {
  const UmumMenuView({super.key, required this.userprofile});
final UserProfile userprofile;
  @override
  State<UmumMenuView> createState() => _UmumMenuViewState();
}

class _UmumMenuViewState extends State<UmumMenuView> {
  List<dynamic> icondata = [
    Assets.image.profileInformasiUmum.image(height: 40, width: 40),
    Assets.image.profileInformasiStudi.image(height: 40, width: 40),
    Assets.image.profileInformasiBeasiswa.image(height: 40, width: 40),
  ];

  List<AccountMenuModel> ctx = const [
    AccountMenuModel(
      id: 1,
      menu: 'Informasi Umum',
      label: 'Identitas Data Diri',
      colors: ColorName.blackgrey,
    ),
    // AccountMenuModel(
    //   id: 2,
    //   menu: 'Informasi Studi',
    //   label: 'Riwayat Studi',
    //   colors: ColorName.blackgrey,
    // ),
    // AccountMenuModel(
    //     id: 3,
    //     menu: 'Informasi Beasiswa',
    //     label: 'Status Beasiswa',
    //     colors: ColorName.blackgrey),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 18.0, top: 20, bottom: 10.0),
              child: Text(
                'INFO AKUN',
                style: TextStyle(
                    color: ColorName.blackprimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ctx.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return SizedBox(
                    width: Get.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0.0),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                            ),
                            onPressed: () {
                              if (ctx[index].id == 1) {
                                
                                Get.to( ProfileInformasiUmumView(userdata : widget.userprofile));
                              } 
                              // else if (ctx[index].id == 2) {
                              //   Get.to(const ProfileInformasiStudiView());
                              // } else if (ctx[index].id == 3) {
                              //   Get.to(const ProfileInformasiBeasiswaView());
                              // }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 60,
                                      child: ElevatedButton(
                                          child: icondata[index],
                                          style: ButtonStyle(
                                            elevation:
                                                MaterialStateProperty.all(0.0),
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.transparent),
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.transparent),
                                          ),
                                          onPressed: () => {}),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(ctx[index].menu,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: ColorName.blackprimary,
                                                fontWeight: FontWeight.bold)),
                                        Text(ctx[index].label,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: ColorName.raven)),
                                      ],
                                    )
                                  ],
                                ),
                                const FaIcon(
                                  FontAwesomeIcons.angleRight,
                                  color: ColorName.raven,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
