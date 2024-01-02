import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebeasiswa/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/local/static/home_user_slider_menu_static.dart';
import '../../data/model/home_submenu/home_submenu_model.dart';
import '../../data/model/home_user_menu/home_user_slider_menu_model.dart';
import '../../data/model/home_user_slider_menu/home_user_slider_menu_model.dart';
import '../../gen/colors.gen.dart';
import '../fund_rekening/fund_rekening.dart';
import '../izin_seminar/izin_seminar.dart';
import '../letter_of_guarantee/letter_of_guarantee.dart';
import '../letter_of_pk/letter_of_pk.dart';
import '../letter_of_sk/letter_of_sk.dart';
import '../letter_of_sp/letter_of_sp.dart';
import '../report/penyelesaian_studi/penyelesaian_studi.dart';
import '../report/perkembangan_studi/perkembangan_studi.dart';

class ProfileHomeUserSliderMenuView extends StatefulWidget {
  const ProfileHomeUserSliderMenuView({super.key});

  @override
  State<ProfileHomeUserSliderMenuView> createState() =>
      _ProfileHomeUserSliderMenuViewState();
}

class _ProfileHomeUserSliderMenuViewState
    extends State<ProfileHomeUserSliderMenuView> {

    late  String title = '';
  final List menu = const [
    'Administrasi Beasiswa',
    'Pencairan Dana Beasiswa',
    'Laporan-Laporan',
  ];

 
  
  @override
  void initState() {
    homesubMenu = homesubMenuAB;
    title = '';
    super.initState();
  }

  final List<HomeUserSliderMenuModels> menus = [
    HomeUserSliderMenuModels(title: 'Administrasi Beasiswa', status: false),
    HomeUserSliderMenuModels(title: 'Pencairan Dana Beasiswa', status: false),
    HomeUserSliderMenuModels(title: 'Laporan-Laporan', status: false),
  ];


  final List<HomeSubMenuModel> homesubMenuPDB = const [
    HomeSubMenuModel(colors: ColorName.purplesubmenuHome, label: 'Rekening', menu: 'Rekening', screen: FundRekening(title: 'Pencairan',)),
    HomeSubMenuModel(colors: ColorName.purplesubmenuHome, label: 'Pengajuan Pencairan Beasiswa', menu: 'Pengajuan Pencairan Beasiswa', screen: FundRekening(title: 'Pencairan Beasiswa',)),
    HomeSubMenuModel(colors: ColorName.purplesubmenuHome, label: 'Pengajuan Pencairan Terjadwal', menu: 'Pengajuan Pencairan Terjadwal', screen: FundRekening(title: 'Pencairan Terjadwal',)),
    HomeSubMenuModel(colors: ColorName.purplesubmenuHome, label: 'Pengajuan LA/BA non scheduled fund', menu: 'Pengajuan LA/BA non scheduled fund', screen: FundRekening(title: 'Pencairan Terjadwal',))
  ];
  final List<HomeSubMenuModel> homesubMenuLP = const [
    HomeSubMenuModel(colors: ColorName.purplesubmenuHome, label: 'Perkembangan Studi', menu: 'Perkembangan Studi', screen: PerkembanganStudi(title: '')),
    HomeSubMenuModel(colors: ColorName.purplesubmenuHome, label: 'Penyelesaian Studi', menu: 'Penyelesaian Studi', screen: PenyelesaianStudi(title: '')),
  ];

   final List<HomeSubMenuModel> homesubMenuAB =  [
   const HomeSubMenuModel(colors: ColorName.purplesubmenuHome, label: 'LoS', menu: 'LoS', screen: LetterOfGuarantee(title: 'LoS',)),
   const HomeSubMenuModel(colors: ColorName.purplesubmenuHome, label: 'Persiapan Keberangkatan', menu: 'Persiapan Keberangkatan', screen: LetterOfPK(title: '',)),
   const HomeSubMenuModel(colors: ColorName.purplesubmenuHome, label: 'SP', menu: 'SP', screen: LetterOfSP(title: 'Surat Pernyataan',)),
   const HomeSubMenuModel(colors: ColorName.purplesubmenuHome, label: 'SK', menu: 'SK', screen: LetterOfSK(title: 'Surat Keputusan',)),
   const HomeSubMenuModel(colors: ColorName.purplesubmenuHome, label: 'LoG', menu: 'LoG', screen: LetterOfGuarantee(title: 'LoG',)),
  ];

  List<HomeSubMenuModel> homesubMenu = [];
  bool ismenuActive = false;
  int currentIndex = 0;
  int length = 0;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 45,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: menus.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if(index == 1){
                        homesubMenu = homesubMenuPDB;
                      } else if(index == 2){
                         homesubMenu = homesubMenuLP;
                      } else{
                         homesubMenu = homesubMenuAB;
                      }

                      if (currentIndex != index) {
                        menus[currentIndex].status = false;
                      }
                      if (menus[index].status == false) {
                        menus[index].status = true;
                        currentIndex = index;
                      } else {
                        menus[index].status = false;
                      }
                    });
                    print(
                        'menu : $currentIndex - $index -> ${menus[index].status}');
                      
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: 20,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: menus[index].status == true
                                ? ColorName.orangeGlow
                                : ColorName.blackgrey,
                            width: 2.0,
                            style: BorderStyle.solid),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          menu[index],
                          style: TextStyle(
                            color: menus[index].status == true
                                ? ColorName.orangeGlow
                                : ColorName.blackgrey,
                          ),
                        ),
                      )),
                    ),
                  ),
                );
              }),
        ),
        SizedBox(
          //height: homesubMenu.length,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: homesubMenu.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap:(){
                    Get.to(() => homesubMenu[index].screen);
                  
                   // Get.to(homesubMenu[index].screen);
                  } ,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200,
                      height: 100,
                     // color: ColorName.purplelow,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(20),
                        color:  homesubMenu[index].colors,
                      ),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(homesubMenu[index].label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)),
                          Image.asset(Assets.icon.submenuHome.path)
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
        const SizedBox.shrink()
      ],
    );
  }
}
