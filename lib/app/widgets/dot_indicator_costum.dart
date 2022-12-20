import 'package:flutter/material.dart';

class DotIndikator extends StatelessWidget {
  const DotIndikator({
    Key? key,
    this.aktif = false,
  }) : super(key: key);

  final bool aktif;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: aktif ? 25 : 8,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: aktif
                ? [
                    const Color(0xffF9B415),
                    const Color(0xffFFD87E),
                  ]
                : [
                    const Color(0xffFFFFFF),
                    const Color(0xffFFFFFF),
                  ],
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}
