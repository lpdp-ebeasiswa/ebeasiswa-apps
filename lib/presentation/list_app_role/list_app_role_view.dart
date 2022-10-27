import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../gen/assets.gen.dart';

class ListAppRoleView extends StatefulWidget {
  const ListAppRoleView({super.key});

  @override
  State<ListAppRoleView> createState() => _ListAppRoleViewState();
}

class _ListAppRoleViewState extends State<ListAppRoleView> {
  List<String> judul = [
    "Pendaftaran",
    "e-Beasiswa",
    "e-Beasiswa",
    "e-Beasiswa"
  ];
  List<String> subjudul = [
    "Calon Penerima Beasiswa",
    "Calon Penerima Beasiswa",
    "Calon Penerima Beasiswa",
    "Calon Penerima Beasiswa"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: judul.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Column(
            children: [
             
              Center(
                child: Stack(
                  children: [
                    SizedBox(
                      width: Get.width * 0.7,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Assets.icon.backgroundListApp.image()),
                    ),
                    Positioned(
                      bottom: 0.0,
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                          ),
                          child: Container(
                              width: Get.width * 0.7,
                              height: 120,
                              color: Colors.black.withOpacity(0.2),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0, top: 25.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      judul[index],
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(subjudul[index],
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 12)),
                                  ],
                                ),
                              ))),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50,),
            ],
          );
        });
  }
}
