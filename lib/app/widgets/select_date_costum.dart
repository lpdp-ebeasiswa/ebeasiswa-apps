import 'package:ebeasiswa/app/widgets/input_text_form_costum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class SelectDateCostum extends StatefulWidget {
  const SelectDateCostum(
      {super.key,
      this.hintText,
      this.labletext,
      this.controller,
      this.validator,
      this.iconText});

  final String? hintText;
  final String? labletext;
  final Icon? iconText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<SelectDateCostum> createState() => _DatePickerModalState();
}

class _DatePickerModalState extends State<SelectDateCostum> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return InputTextFormCostum(
      hintText: widget.hintText,
      labletext: widget.labletext,
      typeInput: TextInputType.number,
      iconText: widget.iconText,
      textInputAction: TextInputAction.next,
      controller: widget.controller!,
      disabled: true,
      border: true,
      validator: widget.validator,
      onTap: () {
        showModalBottomSheet(
          enableDrag: false,
          context: context,
          builder: (context) {
            return SizedBox(
              height: 300,
              width: Get.width,
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    width: Get.width,
                    child: ScrollDatePicker(
                      options: const DatePickerOptions(itemExtent: 40),
                      scrollViewOptions: const DatePickerScrollViewOptions(
                        day: ScrollViewDetailOptions(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(right: 30)),
                        month: ScrollViewDetailOptions(
                            alignment: Alignment.center),
                        year: ScrollViewDetailOptions(
                            margin: EdgeInsets.only(left: 30)),
                      ),
                      selectedDate: _selectedDate,
                      locale: const Locale('id'),
                      onDateTimeChanged: (DateTime value) {
                        setState(() {
                          _selectedDate = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF8226),
                      ),
                      onPressed: () {
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(_selectedDate);
                        widget.controller?.text = formattedDate;
                        Get.back();
                      },
                      child: const Text("Ok"),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
