import 'package:flutter/material.dart';

// import 'currency_format.dart';

class ListDanaWidget extends StatelessWidget {
  final String? name, email, alamat, expenditureData, expenditureTime;
  int? id, expenditure;
  // double? fontSizeJudul, marginCard, borderRadiusVtop, borderRadiusVbottom;

  ListDanaWidget({
    Key? key,
    this.id,
    this.name,
    this.email,
    this.alamat,
    this.expenditure,
    this.expenditureData,
    this.expenditureTime,
    // this.fontSizeJudul,
    // this.borderRadiusVtop,
    // this.borderRadiusVbottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            name!,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500),
          ),
          Text(
            email!,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class RatingWisata extends StatelessWidget {
  const RatingWisata({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.star,
      color: Colors.white,
      size: 12,
    );
  }
}
