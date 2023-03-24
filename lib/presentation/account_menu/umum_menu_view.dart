import 'package:ebeasiswa/presentation/faq/faq_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../data/model/account_menu/account_menu_model.dart';
import '../../gen/colors.gen.dart';

class UmumMenuView extends StatefulWidget {
  const UmumMenuView({super.key});

  @override
  State<UmumMenuView> createState() => _UmumMenuViewState();
}

class _UmumMenuViewState extends State<UmumMenuView> {
  List<dynamic> icondata = const [
    FaIcon(
      FontAwesomeIcons.comment,
      color: ColorName.orange,
    ),
    FaIcon(
      FontAwesomeIcons.bookJournalWhills,
      color: ColorName.orange,
    ),
    FaIcon(
      FontAwesomeIcons.scroll,
      color: ColorName.orange,
    ),
    FaIcon(
      FontAwesomeIcons.envelopeOpenText,
      color: ColorName.orange,
    ),
  ];

  List<AccountMenuModel> ctx = const [
    AccountMenuModel(
      id: 1,
      menu: 'FAQ',
      label: 'FAQ',
      colors: ColorName.orange,
    ),
    AccountMenuModel(
      id: 2,
      menu: 'Kebijakan Privasi',
      label: 'Kebijakan Privasi',
      colors: ColorName.sunglow,
    ),
    AccountMenuModel(
        id: 3,
        menu: 'Syarat & Ketentuan',
        label: 'Syarat & Ketentuan',
        colors: ColorName.downy),
    AccountMenuModel(
      id: 4,
      menu: 'Berikan Masukan',
      label: 'Berikan Masukan',
      colors: ColorName.raven,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 18.0, top: 14),
            child: Text(
              'UMUM',
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
                          onPressed: () => {
                            if (ctx[index].id == 1)
                              {Get.to(const FaqView())}
                            else if (ctx[index].id == 2)
                              {
                                
                              }
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
                                      style: const TextStyle(
                                          fontSize: 12, color: ColorName.raven))
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
    );
  }
}
