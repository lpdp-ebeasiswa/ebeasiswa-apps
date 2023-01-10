part of 'registration_view.dart';

class Step01 extends StatefulWidget {
  const Step01({super.key, required this.fromKey, required this.c});
  final GlobalKey<FormState> fromKey;
  final RegisterController c;
  @override
  State<Step01> createState() => _Step01State();
}

class _Step01State extends State<Step01> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Form(
        key: widget.fromKey,
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSteps(
                text: "Form Akun",
              ),
              InputTextFormCostum(
                labletext: "Email",
                hintText: "Email",
                typeInput: TextInputType.emailAddress,
                iconText: const Icon(Icons.email_rounded),
                border: true,
                validator: ((value) =>
                    widget.c.checkValidator(value, TypeValidator.email)),
                textInputAction: TextInputAction.next,
                controller: widget.c.emailCtrl.value,
              ),
              InputTextFormCostum(
                labletext: "Kata Sandi",
                hintText: "Kata Sandi",
                iconText: const Icon(Icons.lock),
                onChanged: (value) {
                  widget.c.passwordCtrl.value;
                  return null;
                },
                obscureText: widget.c.isPasswordVisible.value,
                iconTextRight: Icon(
                  widget.c.isPasswordVisible.value
                      ? Icons.visibility_off_sharp
                      : Icons.visibility,
                  color: Colors.grey,
                ),
                onPresIconRight: () {
                  setState(() {
                    widget.c.hidepassword();
                  });
                },
                border: true,
                validator: ((value) =>
                    widget.c.checkValidator(value, TypeValidator.password)),
                textInputAction: TextInputAction.next,
                controller: widget.c.passwordCtrl.value,
              ),
              InputTextFormCostum(
                labletext: "Konfrimasi Kata Sandi",
                hintText: "Konfrimasi Kata Sandi",
                iconText: const Icon(Icons.lock),
                onChanged: (value) {
                  widget.c.confirmpasswordCtrl.value;
                  return null;
                },
                obscureText: widget.c.isPasswordConfirmVisible.value,
                iconTextRight: Icon(
                  widget.c.isPasswordConfirmVisible.value
                      ? Icons.visibility_off_sharp
                      : Icons.visibility,
                  color: Colors.grey,
                ),
                onPresIconRight: () {
                  setState(() {
                    widget.c.hidepasswordConfirmasi();
                  });
                },
                border: true,
                validator: ((value) =>
                    widget.c.chekValidatorConfirmPassword(value)),
                textInputAction: TextInputAction.done,
                controller: widget.c.confirmpasswordCtrl.value,
              ),
              WarningTextFiled(
                lebar: 110,
                text: const [
                  "Email harus berbentuk email terdapat (@ dan .com atau .id) dan lain sebagainya \ncontohnya : example@gmail.com ",
                  "Password minimal 8 huruf, harus terdapat 1 karakter, 1 huruf besar dan 1 angka \ncontohnya : eXample*1",
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
