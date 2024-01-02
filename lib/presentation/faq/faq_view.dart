import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebeasiswa/app/widgets/input_text_form_costum.dart';
import 'package:ebeasiswa/presentation/faq/faq_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaqView extends StatelessWidget {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
   // FaqController faqController = Get.put(FaqController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text("FAQ"),
          centerTitle: true,
          // untuk add data faq
          // actions: <Widget>[
          //   IconButton(
          //       onPressed: () {
          //         Get.to(const AddFaqView());
          //       },
          //       icon: const Icon(Icons.add))
          // ],
        ),
        body: const MainFaqView());
  }
}

class MainFaqView extends StatefulWidget {
  const MainFaqView({
    Key? key,
  }) : super(key: key);

  @override
  State<MainFaqView> createState() => _MainFaqViewState();
}

class _MainFaqViewState extends State<MainFaqView> {
  final c = Get.put(FaqController());
  List items = [
    {"id": 0, "tab": "Semua"},
    {"id": 1, "tab": "Persiapan Keberangkatan"},
    {"id": 2, "tab": "Letter Of Sponsorship"},
    {"id": 3, "tab": "Letter Of Guarantee"},
    {"id": 4, "tab": "Penerima Beasiswa"},
  ];
  int current = 0;

  String name = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///SEARCH
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: InputTextFormCostum(
            hintText: "Cari FAQ ...",
            iconText: const Icon(Icons.search),
            border: true,
            onChanged: ((val) {
              setState(() {
                name = val!;
              });
              return null;
            }),
          ),
        ),

        /// CUSTOM TABBAR
        Container(
          padding: const EdgeInsets.all(5.0),
          width: double.infinity,
          height: 70,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          current = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.all(5),
                        height: 45,
                        decoration: BoxDecoration(
                          color: current == index
                              ? Colors.white70
                              : Colors.white54,
                          borderRadius: current == index
                              ? BorderRadius.circular(15)
                              : BorderRadius.circular(10),
                          border: current == index
                              ? Border.all(color: Colors.orangeAccent, width: 2)
                              : Border.all(color: Colors.grey, width: 0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              items[index]["tab"],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: current == index
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ),

        /// MAIN BODY
        Expanded(
          child: StreamBuilder<QuerySnapshot<Object?>>(
            stream: c.streamDataFaq(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                var listFaq = snapshot.data!.docs;
                return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: listFaq.length,
                  itemBuilder: (context, index) {
                    var data = listFaq[index].data() as Map<String, dynamic>;
                    var ctgry = int.parse(data["categoryId"]);
                    if (name.isEmpty) {
                      if (items[current]["id"] == 0) {
                        return ListTile(
                          title: Text("${data["title"]}"),
                          subtitle: Text('${data["desc"]}'),
                          //untuk hapus data faq
                          // trailing: IconButton(
                          //     onPressed: () {
                          //       c.deleteFaq(listFaq[index].id);
                          //     },
                          //     icon: const Icon(Icons.delete_outlined)),
                        );
                      } else if (items[current]["id"] == ctgry) {
                        return ListTile(
                          title: Text("${data["title"]}"),
                          subtitle: Text('${data["desc"]}'),
                        );
                      }
                    }
                    if (data["title"]
                        .toString()
                        .toLowerCase()
                        .contains(name.toLowerCase())) {
                      if (items[current]["id"] == 0) {
                        return ListTile(
                          title: Text("${data["title"]}"),
                          subtitle: Text('${data["desc"]}'),
                        );
                      } else if (items[current]["id"] == ctgry) {
                        return ListTile(
                          title: Text("${data["title"]}"),
                          subtitle: Text('${data["desc"]}'),
                        );
                      }
                    }
                    return const Visibility(
                      visible: false,
                      child: Text(""),
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        )
      ],
    );
  }
}
