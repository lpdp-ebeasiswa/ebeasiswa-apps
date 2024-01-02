

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/fund_request/fund_request_model.dart';

class FundRekeningDetail extends StatefulWidget {
  const FundRekeningDetail({super.key, required this.userfinding, required this.title});
  final UserFunding userfinding;
  final String title;
  @override
  State<FundRekeningDetail> createState() => _FundRekeningDetailState();
}

class _FundRekeningDetailState extends State<FundRekeningDetail> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
        child:  SizedBox(
          width: Get.width,
          child: ListView(children: [
            Text('Atas nama : ${widget.userfinding.atasnama}'),
            Text('alamat bank : ${widget.userfinding.alamatbank}'),
            Text('bank account : ${widget.userfinding.bankaccount}'),
          ],),
        )));
  }
}