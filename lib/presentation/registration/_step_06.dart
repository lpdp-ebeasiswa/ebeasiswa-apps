part of 'registration_view.dart';

class Step06 extends StatefulWidget {
  const Step06(
      {Key? key,
      required this.fromKey,
      this.onTap,
      this.image,
      required this.c})
      : super(key: key);
  final GlobalKey<FormState> fromKey;
  final File? image;
  final RegisterController c;
  final Function()? onTap;
  @override
  State<Step06> createState() => _Step06State();
}

class _Step06State extends State<Step06> {
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
                text: "Form Photo",
              ),
              UploadPhotoPotret(
                labletext: "Upload Photo",
                hintText: "Upload Photo (3x4)",
                iconText: const Icon(Icons.upload),
                validator: ((value) =>
                    widget.c.checkValidator(value, TypeValidator.photo)),
                controller: widget.c.photoCtrl.value,
                image: widget.image,
                onTap: widget.onTap,
              ),
              WarningTextFiled(
                lebar: 50,
                text: const [
                  "Pastikan ukuran photo kurang dari 1MB dan jenis photo harus .png atau .mime",
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
