import 'package:ebeasiswa/gen/assets.gen.dart';
import 'package:ebeasiswa/presentation/profile/profile.dart';
import 'package:ebeasiswa/presentation/profile/profile_controller.dart';
import 'package:ebeasiswa/presentation/profile/profile_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  var controller = Get.put(ProfileController());

  ServicesProfile servicesProfile = ServicesProfile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Profile Detail"),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder<Profile>(
        future: servicesProfile.getDetailProfile(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text('Loading....');
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final data = snapshot.data;
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
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 25),
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
                                            child: Assets.image.lpdpLogo.image(
                                                height: 70.0, width: 70.0)),
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
                              child: ListView(
                            padding: const EdgeInsets.all(20),
                            children: [
                              const Text(
                                "Nama Lengkap",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${data?.name}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                height: 1.5,
                                color: Colors.grey[300],
                              ),
                              const SizedBox(height: 15),
                              const Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${data?.email}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                height: 1.5,
                                color: Colors.grey[300],
                              ),
                              const SizedBox(height: 15),
                              const Text(
                                "Alamat",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${data?.alamat}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                height: 1.5,
                                color: Colors.grey[300],
                              ),
                              const SizedBox(height: 15),
                              const Text(
                                "expenditure",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${data?.expenditure}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                height: 1.5,
                                color: Colors.grey[300],
                              ),
                              const SizedBox(height: 15),
                              const Text(
                                "Date Expenditure",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                height: 1.5,
                              ),
                              Text(
                                "${data?.expenditure_date} - ${data?.expenditure_time}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                height: 2,
                                color: Colors.grey[300],
                              ),
                              const SizedBox(height: 15),
                            ],
                          ))
                        ],
                      ),
                    )
                  ],
                );
              }
          }
        },
      ),
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
