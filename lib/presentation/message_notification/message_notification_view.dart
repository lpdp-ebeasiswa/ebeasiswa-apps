import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../gen/assets.gen.dart';

class MessageNotificationView extends StatefulWidget {
  const MessageNotificationView({super.key});

  @override
  State<MessageNotificationView> createState() => _MessageNotificationViewState();
}

class _MessageNotificationViewState extends State<MessageNotificationView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
          width: Get.width,
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.image.onboard1Logo.image(height: 300, width: 250),
            const SizedBox(height: 10,),
             const Text('Belum Ada Riwayat', style: TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            const Center(child:  Text('Aplikasi untuk mempermudah semua urusan Proses Administrasi Calon dan Penerima Beasiswa .', textAlign: TextAlign.center,)),
            ],
          )),
        ));
  }
}
