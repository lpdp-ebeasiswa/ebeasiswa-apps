part of 'registration_view.dart';

class Step07 extends StatefulWidget {
  const Step07({super.key, required this.fromKey, this.image, required this.c});
  final GlobalKey<FormState> fromKey;
  final RegisterController c;
  final File? image;
  @override
  State<Step07> createState() => _Step07State();
}

class _Step07State extends State<Step07> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.fromKey,
      child: Column(
        children: [
          UploadPhotoPotret(
            image: widget.image,
            disabledTextInput: true,
            width: 150,
            height: 150,
            borderRadius: 80,
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Informasi Akun",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1,
                  ),
                  TextFiledValueCostum(
                    labelText: "Email",
                    controller: widget.c.emailCtrl.value,
                  ),
                  TextFiledValueCostum(
                    labelText: "Password",
                    controller: widget.c.passwordCtrl.value,
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Informasi Pribadi",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1,
                  ),
                  TextFiledValueCostum(
                    labelText: "Nama Lengkap",
                    controller: widget.c.fullnameCtrl.value,
                  ),
                  TextFiledValueCostum(
                    labelText: "Nama Panggilan",
                    controller: widget.c.nicknameCtrl.value,
                  ),
                  TextFiledValueCostum(
                    labelText: "NIK",
                    controller: widget.c.nikCtrl.value,
                  ),
                  TextFiledValueCostum(
                    labelText: "KK",
                    controller: widget.c.kkCtrl.value,
                  ),
                  TextFiledValueCostum(
                    labelText: "Tempat Lagir",
                    controller: widget.c.tempatLahirCtrl.value,
                  ),
                  TextFiledValueCostum(
                    labelText: "Tanggal Lahir",
                    controller: widget.c.dateOfBirthCtrl.value,
                  ),
                  TextFiledValueCostum(
                    labelText: "Nomor Handphone",
                    controller: widget.c.phoneCtrl.value,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
