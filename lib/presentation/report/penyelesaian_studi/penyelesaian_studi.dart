import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PenyelesaianStudi extends StatefulWidget {
  const PenyelesaianStudi({super.key, required this.title});
  final String title;
  @override
  State<PenyelesaianStudi> createState() => _PenyelesaianStudi();
}

class _PenyelesaianStudi extends State<PenyelesaianStudi> {
  List<Map> data = [
    {
      'status': 'Disetujui',
      'body':
          'Hubungan Antara Kinerja Lingkungan dan Luas Pengungkapan Lingkungan dengan Kinerja Keuangan',
      'date': '22/11/2023'
    },
    {
      'status': 'Disetujui',
      'body':
          'Hubungan Antara Kinerja Lingkungan dan Luas Pengungkapan Lingkungan dengan Kinerja Keuangan',
      'date': '22/11/2023'
    },
    {
      'status': 'Disetujui',
      'body':
          'Hubungan Antara Kinerja Lingkungan dan Luas Pengungkapan Lingkungan dengan Kinerja Keuangan',
      'date': '22/11/2023'
    },
  ];

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
          title: const Text(
            'Penyelesaian Studi',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0),
      body: SafeArea(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 150,
                width: 400,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 400,
                          child: SizedBox(
                            width: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox.shrink(),
                                Text(
                                  data[index]['status'],
                                  style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: 400,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data[index]['body']),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 400,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data[index]['date'],
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
