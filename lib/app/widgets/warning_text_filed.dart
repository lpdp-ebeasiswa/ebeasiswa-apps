import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WarningTextFiled extends StatelessWidget {
  WarningTextFiled({
    Key? key,
    required this.text,
    required this.lebar,
  }) : super(key: key);

  List text = [];
  final double lebar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: lebar,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: text.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "* ",
                            style: TextStyle(color: Colors.red),
                          ),
                          Flexible(
                              child: Text(
                            text[index],
                            maxLines: 3,
                            style: const TextStyle(fontSize: 12),
                          ))
                        ]),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
