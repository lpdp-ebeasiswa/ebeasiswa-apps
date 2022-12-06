import 'package:ebeasiswa/app/widgets/input_text_form_costum.dart';
import 'package:ebeasiswa/presentation/faq/faq_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddFaqView extends GetView<FaqController> {
  const AddFaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Add FAQ"),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Obx(
            () => Column(
              children: [
                InputTextFormCostum(
                  iconText: const Icon(Icons.category),
                  hintText: "Faq Category",
                  labletext: "Faq Category",
                  textInputAction: TextInputAction.done,
                  controller: controller.categoryIdC.value,
                ),
                InputTextFormCostum(
                  iconText: const Icon(Icons.title),
                  hintText: "Faq title",
                  labletext: "Faq title",
                  textInputAction: TextInputAction.next,
                  controller: controller.titleC.value,
                ),
                InputTextFormCostum(
                  iconText: const Icon(Icons.description),
                  hintText: "Faq Description",
                  labletext: "Faq Description",
                  textInputAction: TextInputAction.next,
                  controller: controller.descC.value,
                ),
                SizedBox(
                  width: Get.width * 0.4,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD45820),
                    ),
                    onPressed: () {
                      controller.addFaq(
                          controller.titleC.value.text,
                          controller.descC.value.text,
                          controller.categoryIdC.value.text);
                    },
                    child: const Text(
                      "Add FAQ",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
