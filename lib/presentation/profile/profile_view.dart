import 'package:ebeasiswa/gen/assets.gen.dart';
import 'package:ebeasiswa/presentation/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../verifikasi_email/verfikasi_email_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Profile Detail"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(
        () {
          if (profileController.isLoading.value) {
            return const SizedBox.shrink();
          } else if (profileController.isError.value) {
            return Text("Error: ${profileController.errmsg.value.capitalize}");
          } else {
            var data = profileController.profileModel;
            var status = profileController.statusVerifikasi;
            return Stack(
              children: [
                ClipPath(
                  clipper: ClipPathClass(),
                  child: Container(
                    height: 200,
                    width: Get.width,
                    color: Colors.orange,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.25,
                        child: Column(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                                boxShadow: const [
                                  // to make elevation
                                  BoxShadow(
                                    color: Colors.black45,
                                    offset: Offset(2, 2),
                                    blurRadius: 8,
                                  ),
                                  // to make the coloured border
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: Get.width,
                                    height: 100,
                                    child: CircleAvatar(
                                        child: Assets.image.lpdpLogo
                                            .image(height: 70.0, width: 70.0)),
                                  ),
                                  SizedBox(
                                    child: Column(
                                      children: [
                                        Text(
                                          "${data?.name}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20,
                                              color: Colors.black87),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${data?.email}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                              color: Colors.black87),
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
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabelProfile(
                                label: "Nama Lengkap",
                                data: '${data?.name}',
                              ),
                              LabelProfile(
                                label: "Email",
                                data: '${data?.email}',
                                cek: status,
                                dataKanan: "ada",
                                onTap: () {
                                  Get.to(VerifikasiEmailView(), arguments: [
                                    {"email": data?.email},
                                    {
                                      "verifikasi": "1001",
                                    }
                                  ])?.then(
                                    (reslut) => {
                                      if (reslut[0]["backValue"] == "berhasil")
                                        {status.value = true}
                                    },
                                  );
                                },
                              ),
                              LabelProfile(
                                label: "Alamat",
                                data: '${data?.alamat}',
                              ),
                              LabelProfile(
                                label: "Expenditure",
                                data: '${data?.expenditure}',
                              ),
                              LabelProfile(
                                label: "Date Expenditure",
                                data:
                                    '${data?.expenditureDate} - ${data?.expenditureTime}',
                              ),
                            ],
                          ),
                        ),
                      ))
                    ],
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}

class LabelProfile extends StatelessWidget {
  const LabelProfile({
    Key? key,
    // this.data,
    this.cek,
    this.dataKanan,
    required this.label,
    required this.data,
    this.onTap,
  }) : super(key: key);

  // final ProfileModel? data;
  final RxBool? cek;
  final String? dataKanan;
  final String label;
  final String data;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            dataKanan != null
                ? !cek!.value
                    ? InkWell(
                        onTap: onTap,
                        child: Row(
                          children: const [
                            Text(
                              "Belum Verifikasi",
                              style: TextStyle(color: Colors.redAccent),
                            ),
                            FaIcon(
                              FontAwesomeIcons.angleRight,
                              color: Colors.redAccent,
                              size: 14,
                            ),
                          ],
                        ),
                      )
                    : const Text(
                        "Sudah Verifikasi",
                        style: TextStyle(color: Colors.blue),
                      )
                : const Text(""),
          ],
        ),
        const SizedBox(height: 15),
        Container(
          height: 2,
          color: Colors.grey[300],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 50);

    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
