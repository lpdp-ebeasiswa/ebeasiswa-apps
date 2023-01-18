import 'package:ebeasiswa/data/model/users/users_model.dart';
import 'package:ebeasiswa/presentation/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListUserTOkenFcm extends StatefulWidget {
  const ListUserTOkenFcm({super.key});

  @override
  State<ListUserTOkenFcm> createState() => _ListUserTOkenFcmState();
}

class _ListUserTOkenFcmState extends State<ListUserTOkenFcm> {
  // final c = Get.find<OnboaringController>();

  OnboaringController c = Get.put(OnboaringController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF6C06),
        title: const Text("List User Token FCM"),
      ),
      body: StreamBuilder<List<UsersModel>>(
        stream: c.readUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasError) {
              return const Center(child: Text("Tidak dapat menampilkan data"));
            } else if (snapshot.hasData) {
              var notif = snapshot.data!;
              if (notif.isNotEmpty) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(notif[i].username),
                      subtitle: Text(notif[i].fcmtoken),
                      onTap: () => c.deleteUsers(notif[i].fcmtoken),
                    );
                  },
                );
              }
            }
          }
          return const Center(child: Text("Tidak ada notifikasi"));
        },
      ),
    );
  }
}
