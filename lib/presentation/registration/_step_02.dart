part of 'registration_view.dart';

class Step02 extends StatefulWidget {
  const Step02({Key? key, required this.fromKey, required this.c})
      : super(key: key);
  final GlobalKey<FormState> fromKey;
  final RegisterController c;
  @override
  State<Step02> createState() => _Step02State();
}

class _Step02State extends State<Step02> {
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
                text: "Form Pengguna",
              ),
              InputTextFormCostum(
                hintText: "Nama Lengkap",
                labletext: "Nama Lengkap",
                typeInput: TextInputType.text,
                iconText: const Icon(Icons.person),
                border: true,
                validator: ((value) =>
                    widget.c.checkValidator(value, TypeValidator.fullname)),
                textInputAction: TextInputAction.next,
                controller: widget.c.fullnameCtrl.value,
              ),
              InputTextFormCostum(
                hintText: "Nama Panggilan",
                labletext: "Nama Panggilan",
                typeInput: TextInputType.text,
                iconText: const Icon(Icons.person_pin),
                border: true,
                validator: ((value) =>
                    widget.c.checkValidator(value, TypeValidator.nickname)),
                textInputAction: TextInputAction.done,
                controller: widget.c.nicknameCtrl.value,
              ),
              WarningTextFiled(
                lebar: 80,
                text: const [
                  "Nama Lengkap setidaknya minimal 3 karakter \ncontohnya : muhammad oki ",
                  "Nama panggilan setidaknya 3 \ncontohnya : oki",
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
