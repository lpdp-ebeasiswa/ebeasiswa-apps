import 'package:ebeasiswa/data/model/notification_local/notification_model.dart';
import 'package:ebeasiswa/presentation/notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/routes/route_name.dart';
import '../login/login_controller.dart';

class NotificationLocalView extends StatefulWidget {
  const NotificationLocalView({Key? key}) : super(key: key);

  @override
  State<NotificationLocalView> createState() => _NotificationLocalViewState();
}

class _NotificationLocalViewState extends State<NotificationLocalView> {
  // NotificationController c = Get.put(NotificationController());
  var c = Get.find<NotificationController>();
  LoginController loginController = Get.put(LoginController());

  Future _refresh() async {
    setState(() {});
  }

  Future initDatabase() async {
    await c.dbLocalNotif.database();
    setState(() {});
  }

  @override
  void initState() {
    c.username = loginController.username.value.text;
    c.dbLocalNotif;
    initDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[700],
          title: const Text("Notification Local"),
          centerTitle: true,
          elevation: 0,
        ),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: c.dbLocalNotif != null
              ? FutureBuilder<List<NotificationModel>>(
                  future: c.dbLocalNotif.all(),
                  builder: (context, snapshot) {
                    var notif = snapshot.data;
                    print('cekk ini apa View $notif');
                    if (snapshot.hasData) {
                      if (notif!.isEmpty) {
                        return const Center(
                          child: Text("Data masih Kosong"),
                        );
                      }
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          NotificationModel item = notif[index];

                          // String? time = readTimestamp(item.createdAt == null
                          //     ? 0
                          //     : item.createdAt!.microsecondsSinceEpoch);
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${item.title}"),
                                    const Text(
                                      "time",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                subtitle: Text("${item.body}",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis),
                                // onTap: () {
                                //   c.dbLocalNotif.delete(item.id!);
                                //   setState(() {});
                                // },
                                onTap: () {
                                  Get.toNamed(RoutesName.notificationDetail,
                                      arguments: item.firestoreId);
                                },
                              ),
                              item.images != ''
                                  ? InkWell(
                                      onTap: () => Get.toNamed(
                                          RoutesName.notificationDetail,
                                          arguments: item.firestoreId),
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 65, right: 10, bottom: 5),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.network(
                                              "${item.images}",
                                              height: 130,
                                              width: Get.width,
                                              fit: BoxFit.fill,
                                            ),
                                          )),
                                    )
                                  : const Center(),
                              const Divider(
                                indent: 65,
                                height: 10,
                              )
                            ],
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.blue),
                      );
                    }
                  })
              : const CircularProgressIndicator(color: Colors.orange),
        ));
  }
}
