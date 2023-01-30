import 'package:ebeasiswa/presentation/notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/routes/route_name.dart';
import '../../app/utilities/date_format_timestamp.dart';
import '../../data/model/notification/notification_model.dart';
import '../login/login_controller.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  NotificationController c = Get.put(NotificationController());
  LoginController loginController = Get.put(LoginController());

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
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: StreamBuilder<List<NotificationModel>>(
          stream: c.readNotification(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasError) {
                return const Center(
                    child: Text("Tidak dapat menampilkan data"));
              } else if (snapshot.hasData) {
                var notif = snapshot.data!;
                if (notif.isNotEmpty) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i) {
                      NotificationModel item = notif[i];

                      String? time = readTimestamp(item.createdAt == null
                          ? 0
                          : item.createdAt!.microsecondsSinceEpoch);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/icon/background_list_app.png'),
                                ),
                              ),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${item.title}"),
                                Text(
                                  time,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            subtitle: Text("${item.body}",
                                maxLines: 3, overflow: TextOverflow.ellipsis),
                            // onTap: () => c.deleteNotification('${item.id}')),
                            onTap: () => Get.toNamed(
                                RoutesName.notificationDetail,
                                arguments: item.id),
                          ),
                          item.images != null
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 65, right: 10, bottom: 5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      "${item.images}",
                                      height: 130,
                                      width: Get.width,
                                      fit: BoxFit.fill,
                                    ),
                                  ))
                              : const Center(),
                          const Divider(
                            indent: 65,
                            height: 10,
                          )
                        ],
                      );
                    },
                  );
                }
              }
            }
            return const Center(child: Text("Tidak ada notifikasi"));
          },
        ),
      ),
    );
  }
}
