import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../data/model/fund_request/fund_request_model.dart';
import 'fund_rekening_controller.dart';
import 'fund_rekening_detail.dart';

class FundRekening extends StatefulWidget {
  const FundRekening({super.key, required this.title});
  final String title;
  @override
  State<FundRekening> createState() => _FundRekeningState();
}

class _FundRekeningState extends State<FundRekening> {
  final FundRekeningController controller = Get.put(FundRekeningController());

  List<Map> data = [
    {
      'id': 'PD6992023020600024',
      'requestDate': '06/02/2023 14.40.42',
      'approveDate': '06/02/2023 14.40.42',
      'costItem': 'Monthly Living Fund',
      'bank': 'private',
      'requestAmount': '-',
      'requestAmountIdr': 'Rp. 9400000,00',
      'approveAmountDate': '06/02/2023 14.40.42',
      'status': 'Verified'
    },
    {
      'id': 'PD6992023020600024',
      'requestDate': '06/02/2023 14.40.42',
      'approveDate': '06/02/2023 14.40.42',
      'costItem': 'Monthly Living Fund',
      'bank': 'private',
      'requestAmount': '-',
      'requestAmountIdr': 'Rp. 9400000,00',
      'approveAmountDate': '06/02/2023 14.40.42',
      'status': 'Verified'
    },
    {
      'id': 'PD6992023020600024',
      'requestDate': '06/02/2023 14.40.42',
      'approveDate': '06/02/2023 14.40.42',
      'costItem': 'Monthly Living Fund',
      'bank': 'private',
      'requestAmount': '-',
      'requestAmountIdr': 'Rp. 9400000,00',
      'approveAmountDate': '06/02/2023 14.40.42',
      'status': 'Verified'
    },
  ];

  List<UserFunding> funddata = [];

  @override
  void initState() {
    // TODO: implement initState
    load();
    super.initState();
  }

  bool isload = false;

  load() async {
    setState(() {
      isload = true;
    });
    List<UserFunding> databind = await controller.getUserFund();
    setState(() {
      funddata = databind;
      isload = false;
    });
    debugPrint('fund : $funddata');
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
            :  funddata.isNotEmpty
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: funddata.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: ()=> Get.to(FundRekeningDetail(userfinding: funddata[index], title: 'Detail Pencairan',)),
                    child: SizedBox(
                    height: 230,
                    width: 300,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  Text(
                                    funddata[index].billingidspp.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: 400,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Tanggal Req'),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(funddata[index]
                                            .tglpengajuan
                                            .toString()),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 150,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Tanggal Approved'),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          funddata[index]
                                              .tglspkverify
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 400,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Cost Item'),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(funddata[index]
                                            .costitem
                                            .toString()),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 150,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Bank'),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          funddata[index]
                                              .bankaccount
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 400,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Req Amount'),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(funddata[index]
                                            .requestamount
                                            .toString()),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 150,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Req Amount (IDR)'),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          funddata[index]
                                              .requestamountidr
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 400,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Approved Amount'),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(funddata[index]
                                            .approvedamount
                                            .toString()),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 150,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Status'),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          funddata[index].status.toString(),
                                          style: const TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  );
                })
            :const Center(child:  SizedBox(
              height: 100, width: 200,
              child:  Text('Tidak ada data ditemukan')),)
      ),
    );
  }
}
