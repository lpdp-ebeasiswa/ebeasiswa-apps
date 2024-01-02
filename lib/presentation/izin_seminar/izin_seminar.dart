import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IzinSeminar extends StatefulWidget {
  const IzinSeminar({super.key, required this.title});
  final String title;
  @override
  State<IzinSeminar> createState() => _IzinSeminar();
}

class _IzinSeminar extends State<IzinSeminar> {
  List<Map> data = [
    {
      'id': '0000311/TRP/MTM-Af-2021',
      'tipe': 'The Asian Conference on Education (ACE2023)',
      'status': 'Terima',
      'body':
          'Gender Representation in Pathway to English Textbook for Tenth Grade Senior High School Published by Erlangga',
      'date': '22/11/2023 - 25/11/2023'
    },
    {
      'id': '0000311/TRP/MTM-Af-2021',
      'tipe': 'The Asian Conference on Education (ACE2023)',
      'status': 'Terima',
      'body':
          'Gender Representation in Pathway to English Textbook for Tenth Grade Senior High School Published by Erlangga',
      'date': '22/11/2023 - 25/11/2023'
    },
    {
      'id': '0000311/TRP/MTM-Af-2021',
      'tipe': 'The Asian Conference on Education (ACE2023)',
      'status': 'Terima',
      'body':
          'Gender Representation in Pathway to English Textbook for Tenth Grade Senior High School Published by Erlangga',
      'date': '22/11/2023 - 25/11/2023'
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
            'Izin Seminar',
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
                                Text(
                                  data[index]['id'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
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
                                data[index]['tipe'],
                                style: const TextStyle(color: Colors.grey),
                              ),
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
                              Text(data[index]['date'], style: const TextStyle(color: Colors.grey),),
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
