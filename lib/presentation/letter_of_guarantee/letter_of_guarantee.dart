import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../data/model/loslog/loslog.dart';
import 'detail.dart';
import 'letter_of_guarantee_controller.dart';
import 'letter_of_guarantee_detail.dart';

class LetterOfGuarantee extends StatefulWidget {
  const LetterOfGuarantee({super.key, required this.title});
  final String title;
  @override
  State<LetterOfGuarantee> createState() => _LetterOfGuarantee();
}

class _LetterOfGuarantee extends State<LetterOfGuarantee> {
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

  final LetterOfGuaranteeController controller =
      Get.put(LetterOfGuaranteeController());

  bool isload = false;
  List<Loslog> datalist = [];

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
    datalist = widget.title == 'LoS'? await controller.getUserlos() : await controller.getUserFund();
    if (widget.title == 'LoG') {
      datalist.retainWhere((countryone) {
        return countryone.code!.toLowerCase().contains("log".toLowerCase());
      });
    } else {
      datalist.retainWhere((countryone) {
        return countryone.code!.toLowerCase().contains("los".toLowerCase());
      });
    }
    setState(() {
      datalist = datalist;
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
                        height: 160,
                        width: Get.width,
                        child: GestureDetector(
                          onTap: () => Get.to( ViewDocumentLoGs(data: datalist[index], title: widget.title)),
                        //  onTap: () => Get.to(LetterOfGuaranteeDetail(data: datalist[index], title: widget.title)),
                          child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: Get.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Card(
                                          color: Colors.orangeAccent,
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              datalist[index].idpengajuan.toString(),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
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
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:10.0, right: 8.0),
                                    child: Column(children: [
                                       Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Status Pengajuan'),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                             Card(
                                          color: Colors.blue,
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              datalist[index].keterangan.toString(),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                        ),
                                      
                                    ],
                                  ),
                                       Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('nama'),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(datalist[index]
                                                .namaLengkap
                                                .toString()),
                                          ),
                                      
                                    ],
                                  ),
                                   Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Tipe'),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(datalist[index]
                                                .code
                                                .toString()),
                                          ),
                                      
                                    ],
                                  ),
                                   
                                   
                                    ],),
                                  ),
                                 
                                ],
                              ),
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
