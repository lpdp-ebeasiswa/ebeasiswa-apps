import 'package:ebeasiswa/data/model/home_menu/home_menu_model.dart';
import 'package:ebeasiswa/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
part '_second_menu_view.dart';

class FirstMenuView extends StatefulWidget {
  const FirstMenuView({super.key});

  @override
  State<FirstMenuView> createState() => _FirstMenuViewState();
}

class _FirstMenuViewState extends State<FirstMenuView> {
  List<dynamic> icondata = const [
    FaIcon(FontAwesomeIcons.graduationCap),
    FaIcon(FontAwesomeIcons.noteSticky),
    FaIcon(FontAwesomeIcons.solidNoteSticky),
    FaIcon(FontAwesomeIcons.envelopesBulk),
  ];

  List<HomeMenuModel> ctx = const [
    HomeMenuModel(
      id: 1,
      menu: 'Persiapan Kepergian',
      label: 'Persiapan Keberangkatan',
      colors: ColorName.orange,
    ),
    HomeMenuModel(
      id: 2,
      menu: 'LOS',
      label: 'Letter Of Sponsorship',
      colors: ColorName.sunglow,
    ),
    HomeMenuModel(
        id: 3,
        menu: 'LOG',
        label: 'Letter Of Guarantee',
        colors: ColorName.downy),
    HomeMenuModel(
      id: 4,
      menu: 'Penerima Beasiswa',
      label: 'Penerima Beasiswa',
      colors: ColorName.raven,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: Get.width * 0.9,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: ctx.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return SizedBox(
              width: Get.width * 0.22,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    child: ElevatedButton(
                        child: icondata[index],
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(ctx[index].colors),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                 RoundedRectangleBorder(
                                    borderRadius:
                                       const BorderRadius.all(Radius.circular(50)),
                                    side: BorderSide(color: ctx[index].colors)))),
                        onPressed: () => {}),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(ctx[index].menu,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12))
                ],
              ),
            );
          }),
    );
  }
}
