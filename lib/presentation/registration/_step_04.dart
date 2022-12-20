part of 'registration_view.dart';

class Step04 extends StatefulWidget {
  const Step04({super.key, required this.fromKey, required this.c});
  final GlobalKey<FormState> fromKey;
  final RegisterController c;
  @override
  State<Step04> createState() => _Step04State();
}

class _Step04State extends State<Step04> {
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
                text: "Form Data Kelahiran",
              ),
              InputTextFormCostum(
                labletext: "Tempat Lahir",
                hintText: "Tempat lahir",
                typeInput: TextInputType.text,
                iconText: const Icon(Icons.pin_drop),
                border: true,
                validator: ((value) =>
                    widget.c.checkValidator(value, TypeValidator.place)),
                textInputAction: TextInputAction.next,
                controller: widget.c.tempatLahirCtrl.value,
              ),
              SelectDateCostum(
                  labletext: "Tanggal Lahir",
                  hintText: "dd/mm/yyyy",
                  iconText: const Icon(Icons.date_range),
                  validator: ((value) => widget.c
                      .checkValidator(value, TypeValidator.dateOfBirth)),
                  controller: widget.c.dateOfBirthCtrl.value),
              WarningTextFiled(
                lebar: 80,
                text: const [
                  "Tempat lahir harus sesuai dengan KTP \ncontohnya : Jakarta",
                  "Tanggal lahir harus sesuai dengan KTP \ncontohnya : 08-07-1990",
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
