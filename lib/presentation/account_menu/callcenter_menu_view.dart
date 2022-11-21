import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../data/model/account_menu/account_menu_model.dart';
import '../../gen/colors.gen.dart';
import 'account_menu_controller.dart';

class CallcenterMenuView extends StatefulWidget {
  const CallcenterMenuView({super.key});

  @override
  State<CallcenterMenuView> createState() => _CallcenterMenuViewState();
}

class _CallcenterMenuViewState extends State<CallcenterMenuView> {
  List<dynamic> icondata = const [
    FaIcon(
      FontAwesomeIcons.phone,
      color: ColorName.orange,
    ),
    FaIcon(
      FontAwesomeIcons.envelope,
      color: ColorName.orange,
    ),
    FaIcon(
      FontAwesomeIcons.google,
      color: ColorName.orange,
    ),
    FaIcon(
      FontAwesomeIcons.whatsapp,
      color: ColorName.orange,
    ),
  ];

  List<AccountMenuModel> ctx = const [
    AccountMenuModel(
      id: 1,
      menu: 'Hubungi via telepon',
      label: 'Callphone',
      colors: ColorName.orange,
    ),
    AccountMenuModel(
      id: 2,
      menu: 'Hubungi via SMS',
      label: 'sms',
      colors: ColorName.sunglow,
    ),
    AccountMenuModel(
        id: 3,
        menu: 'Hubungi via E-mail',
        label: 'email',
        colors: ColorName.downy),
    AccountMenuModel(
      id: 4,
      menu: 'Hubungi via whatsapp',
      label: 'whatsapp',
      colors: ColorName.raven,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final accountMenuController = Get.put(AccountMenuController());
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 18.0, top: 14),
            child: Text(
              'Bantuan',
              style: TextStyle(
                  color: ColorName.orange,
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
                          onPressed: () => accountMenuController
                              .navCallCenterMenu(ctx[index].id),
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
                                              MaterialStateProperty.all<Color>(
                                                  Colors.transparent),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.transparent),
                                        ),
                                        onPressed: () => {}),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(ctx[index].menu,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 14, color: ColorName.raven))
                                ],
                              ),
                              const FaIcon(FontAwesomeIcons.angleRight, color: ColorName.raven, size: 16,),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
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
    );
  }
}
