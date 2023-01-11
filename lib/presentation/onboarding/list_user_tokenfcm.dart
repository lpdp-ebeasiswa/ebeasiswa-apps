import 'package:cloud_firestore/cloud_firestore.dart';
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
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: c.streamDataUserTokenFCM(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listTokenFcm = snapshot.data!.docs;
            return ListView.builder(
              itemCount: listTokenFcm.length,
              itemBuilder: (context, index) {
                var data = listTokenFcm[index].data() as Map<String, dynamic>;
                return ListTile(
                    title: Text("${data["fcmtoken"]}"),
                    onTap: () => c.deleteFaq(listTokenFcm[index].id));
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
