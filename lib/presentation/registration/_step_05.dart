part of 'registration_view.dart';

class Step05 extends StatefulWidget {
  const Step05({super.key, required this.fromKey, required this.c});
  final GlobalKey<FormState> fromKey;
  final RegisterController c;
  @override
  State<Step05> createState() => _Step05State();
}

class _Step05State extends State<Step05> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Form(
        key: widget.fromKey,
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSteps(
                text: "Form Data Kontak",
              ),
              InputTextFormCostum(
                labletext: "Nomor Handphone",
                hintText: "Nomor Handphone",
                typeInput: TextInputType.number,
                border: true,
                iconText: const Icon(Icons.phone_android),
                validator: ((value) =>
                    widget.c.checkValidator(value, TypeValidator.phone)),
                textInputAction: TextInputAction.next,
                controller: widget.c.phoneCtrl.value,
              ),
              WarningTextFiled(
                lebar: 50,
                text: const [
                  "Isikan dengan nomor telepon di awali +62 atau 0 minimal 8 angka dan maximal 14 angka  \ncontohnya : +6289276381628 atau 08937361936",
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
