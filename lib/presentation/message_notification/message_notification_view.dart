import 'package:flutter/material.dart';

class MessageNotificationView extends StatefulWidget {
  const MessageNotificationView({super.key});

  @override
  State<MessageNotificationView> createState() => _MessageNotificationViewState();
}

class _MessageNotificationViewState extends State<MessageNotificationView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(child: SizedBox(child: Text("Message"))));
  }
}
