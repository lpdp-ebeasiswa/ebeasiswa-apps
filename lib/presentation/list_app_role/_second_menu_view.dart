part of 'menu_view.dart';

class SecondMenuView extends StatefulWidget {
  const SecondMenuView({super.key});

  @override
  State<SecondMenuView> createState() => _SecondMenuViewState();
}

class _SecondMenuViewState extends State<SecondMenuView> {
  List<dynamic> icondata = const [
    //FaIcon(FontAwesomeIcons.graduationCap),
    //FaIcon(FontAwesomeIcons.noteSticky),
    //FaIcon(FontAwesomeIcons.envelopesBulk),
    FaIcon(FontAwesomeIcons.arrowUpRightFromSquare),
    FaIcon(FontAwesomeIcons.buildingColumns),
  ];

  List<HomeMenuModel> ctx = const [
    // HomeMenuModel(
    //   id: 1,
    //   menu: 'Persiapan Kepergian',
    //   label: 'Persiapan Keberangkatan',
    //   colors: Colors.blue,
    // ),
    // HomeMenuModel(
    //   id: 2,
    //   menu: 'LOS / LOG',
    //   label: 'LOS / LOG',
    //   colors: Colors.blue,
    // ),
    // HomeMenuModel(
    //     id: 3,
    //     menu: 'Penerima Beasiswa',
    //     label: 'Surat Pernyataan Penerima Beasiswa',
    //     colors: Colors.blue),
    HomeMenuModel(
      id: 5,
      menu: 'Resign',
      label: 'Pengunduran Diri',
      colors: Colors.blue,
    ),
    HomeMenuModel(
      id: 6,
      menu: 'PT / Prodi',
      label: 'Perubahan PT / Prodi',
      colors: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
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
                                MaterialStateProperty.all<Color>(Colors.red),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    side: BorderSide(color: Colors.red)))),
                        onPressed: () => {}),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(ctx[index].menu,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12)),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
