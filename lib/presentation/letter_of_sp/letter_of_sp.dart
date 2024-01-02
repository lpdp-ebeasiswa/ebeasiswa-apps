import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../data/model/SP/sp_model.dart';

import 'letter_of_sp_detail.dart';
import 'letter_of_sp_controller.dart';

class LetterOfSP extends StatefulWidget {
  const LetterOfSP({super.key, required this.title});
  final String title;
  @override
  State<LetterOfSP> createState() => _LetterOfSP();
}

class _LetterOfSP extends State<LetterOfSP> {
  List<Map> data = [
    {
      'id': 'LOG2042202141628411',
      'tipe': 'LoG',
      'status': 'Pengajuan Disetujui'
    },
    {
      'id': 'LOG2042202141628412',
      'tipe': 'LoG',
      'status': 'Pengajuan Disetujui'
    },
    {
      'id': 'LOG2042202141628413',
      'tipe': 'LoG',
      'status': 'Pengajuan Disetujui'
    },
    {
      'id': 'LOG2042202141628413',
      'tipe': 'LoG',
      'status': 'Pengajuan Disetujui'
    },
  ];

  final LetterOfSPController controller =
      Get.put(LetterOfSPController());

  bool isload = false;
  List<SP> datalist = [];

  @override
  void initState() {
    // TODO: implement initState
    load();
    super.initState();
  }

  load() async {
    setState(() {
      isload = true;
    });
    List<SP> databind = await controller.getUserFund();
   
    setState(() {
      datalist = databind;
      isload = false;
    });
    debugPrint('fund : $datalist');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0),
      body: SafeArea(
        child: isload == true
            ? Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: LoadingAnimationWidget.inkDrop(
                    color: Colors.orangeAccent,
                    size: 30,
                  ),
                ),
              )
            : datalist.isEmpty
                ? const Center(
                    child: SizedBox(
                        height: 100,
                        width: 200,
                        child: Text('Tidak ada data ditemukan')),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: datalist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 100,
                        width: Get.width,
                        child: GestureDetector(
                       //   onTap: () => Get.to( ViewDocumentLoGs(data: datalist[index], title: widget.title)),
                         onTap: () => Get.to(LetterOfSPDetail(data: datalist[index], title: widget.title)),
                          child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        datalist[index].batchSeleksi.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      if(datalist[index].tanggalPenerbitanSp != null)
                                      Text(
                                        DateFormat("dd-MM-yyyy").format(
                                            DateTime.parse(datalist[index]
                                                .tglpengajuan
                                                .toString())),
                                        style: const TextStyle(
                                          color: Colors.blueAccent,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Jenis Beasiswa'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(datalist[index]
                                            .jenisBeasiswa
                                            .toString()),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Status Akademik'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          datalist[index]
                                              .statusAkademik
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        )
                      );
                    }),
      ),
    );
  }
}
