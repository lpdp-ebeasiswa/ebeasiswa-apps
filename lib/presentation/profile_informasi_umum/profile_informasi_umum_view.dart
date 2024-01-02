import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/userProfil/user_profile_model.dart';
import '../../gen/assets.gen.dart';

class ProfileInformasiUmumView extends StatefulWidget {
  const ProfileInformasiUmumView({super.key, required this.userdata});
final UserProfile userdata;
  @override
  State<ProfileInformasiUmumView> createState() =>
      _ProfileInformasiUmumViewState();
}

class _ProfileInformasiUmumViewState extends State<ProfileInformasiUmumView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Informasi Umum',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                  width: 80.0,
                  height: 100.0,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child:  widget.userdata.linkFoto != null ? Image.network(widget.userdata.linkFoto!) : Assets.image.cpbMale.image(),
                  )),
            ),
            const Text(
              'Informasi umum',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Info Pribadi',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                   const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                            const  Text(
                                'Nama Lengkap',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                             const SizedBox(height: 4,),
                              Text(
                                widget.userdata.namaLengkap ?? '',
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                         const Icon(Icons.keyboard_arrow_right)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                            const  Text(
                                'Nama Panggilan',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4,),
                              Text(
                               widget.userdata.namaLengkapLama ?? '',
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                         const Icon(Icons.keyboard_arrow_right)
                        ],
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              const Text(
                                'Tempat Lahir',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4,),
                              Text(
                                 widget.userdata.tempatLahir ?? '',
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                         const Icon(Icons.keyboard_arrow_right)
                        ],
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              const Text(
                                'Tanggal Lahir',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4,),
                              Text(
                               widget.userdata.tanggalLahir ?? '',
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                         const Icon(Icons.keyboard_arrow_right)
                        ],
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              const Text(
                                'Jenis Kelamin',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4,),
                              Text(
                                widget.userdata.jenisKelamin ?? '',
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                         const Icon(Icons.keyboard_arrow_right)
                        ],
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              const Text(
                                'Pekerjaan',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4,),
                              Text(
                                widget.userdata.bidangKeilmuan ?? '',
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                         const Icon(Icons.keyboard_arrow_right)
                        ],
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              const Text(
                                'No. KTP',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4,),
                              Text(
                                widget.userdata.nik ?? '',
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                         const Icon(Icons.keyboard_arrow_right)
                        ],
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'No. Paspor',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4,),
                              Text(
                                '343GHD3',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                         const Icon(Icons.keyboard_arrow_right)
                        ],
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              const Text(
                                'Nama Pada Paspor',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4,),
                              Text(
                                widget.userdata.namaLengkapLama ?? '',
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                         const Icon(Icons.keyboard_arrow_right)
                        ],
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              const Text(
                                'No. HP',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4,),
                              Text(
                                widget.userdata.noHpSaatIni ?? '',
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                         const Icon(Icons.keyboard_arrow_right)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
