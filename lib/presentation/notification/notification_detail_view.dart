import 'package:ebeasiswa/presentation/notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/notification/notification_model.dart';

class NotificationDatailView extends StatefulWidget {
  const NotificationDatailView({super.key});

  @override
  State<NotificationDatailView> createState() => _NotificationDatailViewState();
}

class _NotificationDatailViewState extends State<NotificationDatailView> {
  final String id = Get.arguments;
  String? title;
  var c = Get.find<NotificationController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    c.getDataNotification(id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NotificationModel>(
        future: c.getDataNotification(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              extendBodyBehindAppBar: true,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done ||
              snapshot.hasData ||
              snapshot.data == null) {
            NotificationModel data = snapshot.data!;
            return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  centerTitle: true,
                  // backgroundColor: Colors.transparent,
                  backgroundColor: const Color(0x44000000),
                  elevation: 0,
                  title: Text("${data.title}"),
                ),
                body: SafeArea(
                  child: Column(
                    children: [
                      data.images != null
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  "${data.images}",
                                  height: 200,
                                  width: Get.width,
                                  fit: BoxFit.fill,
                                ),
                              ))
                          : const Center(),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text('${data.body}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
          }
          return const Text("No data");
        });
  }
}
