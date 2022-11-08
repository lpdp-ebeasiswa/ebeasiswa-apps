import 'package:ebeasiswa/presentation/dana/dana_controller.dart';
import 'package:ebeasiswa/presentation/dana/dana_model_dummy.dart';
import 'package:ebeasiswa/presentation/dana/widgets/list_dana_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DanaView extends StatelessWidget {
  var controller = Get.put(DanaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Dana Beasiswa'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              MainDana(),
            ],
          ),
        ),
      ),
    );
  }
}

class MainDana extends StatefulWidget {
  const MainDana({
    Key? key,
  }) : super(key: key);

  @override
  State<MainDana> createState() => _MainDanaState();
}

class _MainDanaState extends State<MainDana> {
  @override
  void initState() {
    setState(() {
      filter_dana = data_dana_dummy;
    });
    super.initState();
  }

  void updateList(String value) {
    if (value.isEmpty) {
      setState(() {
        filter_dana = data_dana_dummy;
      });
    } else {
      setState(() {
        filter_dana = data_dana_dummy
            .where((element) =>
                element.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // decoration: const BoxDecoration(
          //   color: Color(0xffE1E147),
          // ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Material(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              elevation: 8,
              shadowColor: Colors.grey,
              child: SizedBox(
                child: TextField(
                  onChanged: ((value) => setState(() {
                        updateList(value);
                      })),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Cari Dana, ketik disini ? ...",
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const ListDana()
      ],
    );
  }
}

class ListDana extends StatelessWidget {
  const ListDana({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Dana Beasiswa",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        SizedBox(
          child: ListView.builder(
            itemCount: filter_dana.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListDanaWidget(
                  name: filter_dana[index].name,
                  email: filter_dana[index].email,
                  expenditure: filter_dana[index].expenditure,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
