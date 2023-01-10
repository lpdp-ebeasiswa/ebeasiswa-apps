import 'package:flutter/material.dart';

class HeaderSteps extends StatelessWidget {
  const HeaderSteps({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Text(
            text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 25),
          child: const Divider(height: 1),
        ),
      ],
    );
  }
}
