import 'package:flutter/material.dart';

class ProfileInformasiBeasiswaView extends StatefulWidget {
  const ProfileInformasiBeasiswaView({super.key});

  @override
  State<ProfileInformasiBeasiswaView> createState() => _ProfileInformasiBeasiswaViewState();
}

class _ProfileInformasiBeasiswaViewState extends State<ProfileInformasiBeasiswaView> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Informasi beasiswa',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const Center(
        child: Text(
          'Informasi beasiswa',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
