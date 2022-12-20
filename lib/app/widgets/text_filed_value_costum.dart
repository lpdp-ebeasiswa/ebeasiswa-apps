import 'package:flutter/material.dart';

class TextFiledValueCostum extends StatelessWidget {
  const TextFiledValueCostum({
    Key? key,
    this.labelText,
    this.controller,
  }) : super(key: key);

  final String? labelText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          TextField(
            textDirection: TextDirection.rtl,
            readOnly: true,
            controller: controller,
            decoration: InputDecoration(
              prefixText: labelText,
              border: InputBorder.none,
            ),
          ),
          const Divider(
            height: 5,
            // thickness: 0.5,
          ),
        ],
      ),
    );
  }
}
