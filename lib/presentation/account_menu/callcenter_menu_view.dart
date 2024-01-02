import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../data/model/account_menu/account_menu_model.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../faq/faq_view.dart';
import 'account_menu_controller.dart';

class CallcenterMenuView extends StatefulWidget {
  const CallcenterMenuView({super.key});

  @override
  State<CallcenterMenuView> createState() => _CallcenterMenuViewState();
}

class _CallcenterMenuViewState extends State<CallcenterMenuView> {


  List<dynamic> icondata = [
    Assets.image.profileFaq.image(height: 40, width: 40),
    Assets.image.profileTc.image(height: 40, width: 40),
  ];

  List<AccountMenuModel> ctx = const [
    AccountMenuModel(
      id: 1,
      menu: 'FAQ',
      label: 'faq',
      colors: ColorName.orange,
    ),
    AccountMenuModel(
      id: 2,
      menu: 'Syarat & Ketentuan',
      label: 't&c',
      colors: ColorName.sunglow,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final accountMenuController = Get.put(AccountMenuController());
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
                'Bantuan',
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
                          height: 60,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0.0),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                            ),
                            onPressed: () => Get.to(const FaqView()),
                            // onPressed: () => accountMenuController
                            //     .navCallCenterMenu(ctx[index].id),
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
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(ctx[index].menu,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: ColorName.blackprimary,
                                            fontWeight: FontWeight.bold)),
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
