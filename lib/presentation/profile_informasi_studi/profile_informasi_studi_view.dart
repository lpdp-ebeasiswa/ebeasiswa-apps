import 'package:flutter/material.dart';

class ProfileInformasiStudiView extends StatefulWidget {
  const ProfileInformasiStudiView({super.key});

  @override
  State<ProfileInformasiStudiView> createState() => _ProfileInformasiStudiViewState();
}

class _ProfileInformasiStudiViewState extends State<ProfileInformasiStudiView> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Informasi Studi',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const Center(
        child: Text(
          'Informasi Studi',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
