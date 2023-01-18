// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:ebeasiswa/presentation/notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/notification/notification_model.dart';
import '../login/login_controller.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  NotificationController c = Get.find<NotificationController>();
  LoginController loginController = Get.find<LoginController>();

  @override
  void initState() {
    c.username = loginController.username.value.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        title: const Text("Notification"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                c.pushNotif();
              },
              icon: const Icon(Icons.send))
        ],
      ),
      body: StreamBuilder<List<NotificationModel>>(
        stream: c.readNotification(),
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
                      title: Text("${notif[i].title} - ${notif[i].username}  "),
                      subtitle: Text("${notif[i].body}"),
                      onTap: () => c.deleteNotification('${notif[i].id}'),
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
