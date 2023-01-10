part of 'registration_view.dart';

class Step03 extends StatefulWidget {
  const Step03({Key? key, required this.fromKey, required this.c})
      : super(key: key);
  final GlobalKey<FormState> fromKey;
  final RegisterController c;
  @override
  State<Step03> createState() => _Step03State();
}

class _Step03State extends State<Step03> {
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
                text: "Form Data Kependudukan",
              ),
              InputTextFormCostum(
                labletext: "Nomor Induk Kependudukan (NIK)",
                hintText: "Nomor Induk Kependudukan (NIK)",
                typeInput: TextInputType.number,
                iconText: const Icon(Icons.contacts),
                border: true,
                validator: ((value) =>
                    widget.c.checkValidator(value, TypeValidator.nik)),
                textInputAction: TextInputAction.next,
                controller: widget.c.nikCtrl.value,
              ),
              InputTextFormCostum(
                labletext: "Nomor Kartu Keluarga (KK)",
                hintText: "Nomor Kartu Keluarga (KK)",
                typeInput: TextInputType.number,
                iconText: const Icon(Icons.call_to_action),
                border: true,
                validator: ((value) =>
                    widget.c.checkValidator(value, TypeValidator.kk)),
                textInputAction: TextInputAction.next,
                controller: widget.c.kkCtrl.value,
              ),
              WarningTextFiled(
                lebar: 100,
                text: const [
                  "Harus isi dengan kartu keluarga setidaknya 16 angka, kartu keluarga biasanya terletak di atas \ncontohnya : 3326160608070197 ",
                  "Harus isi dengan kartu keluarga setidaknya 16 angka, NIK biasanya terletak di KTP \ncontohnya : 3326160902090003",
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
