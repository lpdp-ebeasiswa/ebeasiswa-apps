import 'dart:io';

import 'package:ebeasiswa/app/widgets/upload_photo_potret_costum.dart';
import 'package:ebeasiswa/presentation/registration/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../app/widgets/input_text_form_costum.dart';
import '../../app/widgets/select_date_costum.dart';
import '../../gen/assets.gen.dart';
import '../../app/widgets/header_steps.dart';
import '../../app/widgets/text_filed_value_costum.dart';
import '../../app/widgets/warning_text_filed.dart';

part '_step_01.dart';
part '_step_02.dart';
part '_step_03.dart';
part '_step_04.dart';
part '_step_05.dart';
part '_step_06.dart';
part '_step_07.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controllerRegister = Get.put(RegisterController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF8226),
        title: const Text("Registrasi"),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Assets.image.lpdpRegistration.image(fit: BoxFit.fitWidth),
          Container(
            decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(80)), //here
            ),
          ),
          const StepperRegister()
        ],
      ),
    );
  }
}

class StepperRegister extends StatefulWidget {
  const StepperRegister({
    Key? key,
  }) : super(key: key);

  @override
  State<StepperRegister> createState() => _StepperRegisterState();
}

class _StepperRegisterState extends State<StepperRegister> {
  List<GlobalKey<FormState>> fromKey = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  final c = Get.find<RegisterController>();
  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked =
        await picker.pickImage(source: ImageSource.gallery);
    c.image = File(imagePicked!.path);
    String? fileName = c.image!.path.split('/').last;
    String? fileExtension = fileName.split('.').last;

    final bytes = c.image!.readAsBytesSync().lengthInBytes;
    final kb = bytes / 1024;
    final ukuranPhoto = kb / 1024;

    if (fileExtension == 'png' ||
        fileExtension == 'PNG' ||
        fileExtension == 'MIME' ||
        fileExtension == 'mime') {
      if (ukuranPhoto <= 1.01) {
        setState(() {
          c.image = File(imagePicked.path);
          c.photoCtrl.value.text = fileName;
        });
      } else {
        setState(() {
          c.photoCtrl.value.text = 'Ukuran photo belum sesuai';
          c.image = null;
          Get.snackbar('Gagal Upload', 'Ukuran photo belum sesuai',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.redAccent);
        });
      }
    } else {
      setState(() {
        c.image = null;
        c.photoCtrl.value.text = 'Jenis photo belum sesuai';
        Get.snackbar('Gagal Upload', 'Jenis photo belum sesuai',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent);
      });
    }
  }

  List<Step> steps() => [
        Step(
          state:
              c.currentStep.value > 0 ? StepState.complete : StepState.indexed,
          isActive: c.currentStep.value >= 0,
          title: const Text("Akun"),
          content: Step01(fromKey: fromKey[0], c: c),
        ),
        Step(
            state: c.currentStep.value > 1
                ? StepState.complete
                : StepState.indexed,
            isActive: c.currentStep.value >= 1,
            title: const Text("Pengguna"),
            content: Step02(fromKey: fromKey[1], c: c)),
        Step(
            state: c.currentStep.value > 2
                ? StepState.complete
                : StepState.indexed,
            isActive: c.currentStep.value >= 2,
            title: const Text("Data"),
            content: Step03(fromKey: fromKey[2], c: c)),
        Step(
            state: c.currentStep.value > 3
                ? StepState.complete
                : StepState.indexed,
            isActive: c.currentStep.value >= 3,
            title: const Text("TTL"),
            content: Step04(fromKey: fromKey[3], c: c)),
        Step(
            state: c.currentStep.value > 4
                ? StepState.complete
                : StepState.indexed,
            isActive: c.currentStep.value >= 4,
            title: const Text("Telpon"),
            content: Step05(fromKey: fromKey[4], c: c)),
        Step(
            state: c.currentStep.value > 5
                ? StepState.complete
                : StepState.indexed,
            isActive: c.currentStep.value >= 5,
            title: const Text("Upload"),
            content: Step06(
              fromKey: fromKey[5],
              c: c,
              image: c.image,
              onTap: () {
                setState(() {
                  getImage();
                });
              },
            )),
        Step(
            isActive: c.currentStep.value >= 6,
            title: const Text("Selesai"),
            content: Step07(
              fromKey: fromKey[6],
              c: c,
              image: c.image,
            )),
      ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: Colors.orangeAccent)),
      child: Expanded(
        child: SizedBox(
          height: Get.height * 0.70,
          child: Stepper(
            currentStep: c.currentStep.value,
            type: StepperType.horizontal,
            physics: const AlwaysScrollableScrollPhysics(),
            steps: steps(),
            onStepContinue: () {
              final isLastStep = c.currentStep.value == steps().length - 1;
              if (!fromKey[c.currentStep.value].currentState!.validate()) {
                return;
              }
              if (isLastStep) {
                setState(() {
                  c.isComplete.value = true;
                  Get.snackbar('Berhasil', 'Data berhasil di simpan',
                      snackPosition: SnackPosition.BOTTOM,
                      colorText: Colors.white,
                      margin: const EdgeInsets.all(10),
                      backgroundColor: Colors.green);
                });
              } else {
                setState(() {
                  c.currentStep.value += 1;
                });
              }
            },
            onStepTapped: (step) => setState(() {
              if (!fromKey[c.currentStep.value].currentState!.validate()) {
                return;
              }
              c.currentStep.value = step;
            }),
            onStepCancel: () {
              c.currentStep.value == 0
                  ? null
                  : setState(() {
                      c.currentStep.value -= 1;
                    });
            },
            controlsBuilder: (context, action) {
              final isLastStep = c.currentStep.value == steps().length - 1;
              return Container(
                margin: const EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    if (c.currentStep.value != 0)
                      Expanded(
                          child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                              width: 1.0, color: Colors.orangeAccent),
                        ),
                        onPressed: action.onStepCancel,
                        child: const Text("Back"),
                      )),
                    SizedBox(
                      width: c.currentStep.value == 0 ? 5 : 10,
                    ),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: action.onStepContinue,
                      child: Text(isLastStep ? "Confirm" : "Next"),
                    )),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
