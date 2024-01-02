// ignore_for_file: avoid_unnecessary_containers

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ebeasiswa/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/model/loslog/loslog.dart';
import '../../data/model/pk/pk_model.dart';

class LetterOfPKDetail extends StatefulWidget {
  const LetterOfPKDetail({super.key, required this.data, required this.title});
  final PK data;
  final String title;
  @override
  State<LetterOfPKDetail> createState() => _LetterOfPKDetailState();
}

class _LetterOfPKDetailState extends State<LetterOfPKDetail> {
  String? uri;

  var _openResult = 'Unknown';
  String? filename;
  String tglverified =  '';
  DateTime? dateVerified;

  double progress = 0;

  bool didDownloadPDF = false;

  String progressString = 'File has not been downloaded yet.';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filename = '/${widget.data.univtujuan}';
    if(widget.data.tglverif != null || widget.data.tglverif != '')
    {
    var dateverifed = widget.data.tglverif;
     dateVerified = DateFormat('yyyy').parse(dateverifed!);
     setState(() {
       tglverified = dateVerified.toString();
     });
    }

  }

  Future download(Dio dio, String url, String savePath) async {
    try {
      var response = await dio.get(
        url,
        onReceiveProgress: updateProgress,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      var file = File(savePath).openSync(mode: FileMode.write);
      debugPrint('path : $savePath');
      file.writeFromSync(response.data);
      await file.close();
    } catch (e) {
      print(e);
    }
  }

  // You can update the download progress here so that the user is
  // aware of the long-running task.
  void updateProgress(done, total) {
    progress = done / total;
    setState(() {
      if (progress >= 1) {
        progressString =
            '✅ File has finished downloading. Try opening the file.';
        didDownloadPDF = true;
      } else {
        progressString =
            'Download progress: ${(progress * 100).toStringAsFixed(0)}% done.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final levelIndicator = Container(
      child: Container(
        child: const LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
            value: 1.0,
            valueColor: AlwaysStoppedAnimation(Colors.greenAccent)),
      ),
    );

    final coursePrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: const Text(
        // "\$20",
        "\$" + '1',
        style: TextStyle(color: Colors.white),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 80.0),
        const SizedBox(height: 10.0),
        Text(
          widget.data.koderegistrasi.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        const SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(flex: 1, child: levelIndicator),
            Expanded(
                flex: 6,
                child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      widget.data.intake.toString(),
                      style: const TextStyle(color: Colors.white),
                    ))),
            // Expanded(
            //   flex: 4,
            //   child: TextButton(
            //     onPressed: didDownloadPDF
            //         ? null
            //         : () async {
            //             String docId = widget.data.idpengajuan.toString();
            //             String dnln = widget.data.dnln.toString();
            //             String code = widget.data.code.toString();
            //             setState(() {
            //               uri =
            //                   "https://ebeasiswa-lpdp.kemenkeu.go.id/Request/DownloadLOSLOG?id=$docId&dnln=$dnln&tipe=$code&stamp=1";
            //             });
            //             var tempDir = await getTemporaryDirectory();
            //             download(Dio(), uri!, tempDir.path + filename!);
            //           },
            //     child: const Text("unduh dokumen",
            //         style: TextStyle(color: Colors.white)),
            //   ),
            // )
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          padding: const EdgeInsets.all(30.0),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: ColorName.orange),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Column(
      children: [
        TextFormField(
          readOnly: true,
          initialValue: widget.data.univtujuan.toString(),
          decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5), // adjust as you need
              label: Text(
                'universitas tujuan',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              )),
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 17,
          ),
        ),
        const SizedBox(
          height: 5,
        ),

        TextFormField(
          readOnly: true,
          initialValue: widget.data.koderegistrasi.toString(),
          decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5), // adjust as you need
              label: Text(
                'no registrasi',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              )),
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 17,
          ),
        ),
        
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          readOnly: true,
          initialValue:
              '${widget.data.status.toString()} ($tglverified)',
          decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5), // adjust as you need
              label: Text(
                'Status PK',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              )),
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 17,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          readOnly: true,
          initialValue: widget.data.status,
          decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5), // adjust as you need
              label: Text(
                'Status',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              )),
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 17,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          maxLines : 3,
          readOnly: true,
          initialValue: widget.data.catatanpenolakan.toString(),
          decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5), // adjust as you need
              label: Text(
                'Catatan penolakan',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              )),
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 17,
          ),
        ),
      ],
    );
    final viewPdf = Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: TextButton(
          onPressed: () => {},
          child: const Text("TAKE THIS LESSON",
              style: TextStyle(color: Colors.white)),
        ));
    final bottomContent = Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: <Widget>[
            bottomContentText,
          const SizedBox(height: 10,),
          if(widget.data.lampiran != null)
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal,
              ),
              onPressed: !didDownloadPDF
                  ? () async {
                     
                      setState(() {
                        uri =
                            "https://ebeasiswa-lpdp.kemenkeu.go.id${widget.data.lampiran}";
                      });
                      var tempDir = await getTemporaryDirectory();
                      download(Dio(), uri!, tempDir.path + filename!);
                    }
                  : () async {
                      var tempDir = await getTemporaryDirectory();
                      final result =
                          await OpenFilex.open(tempDir.path + filename!);

                      setState(() {
                        _openResult =
                            "type=${result.type}  message=${result.message}";
                      });
                    },
              child: Text(didDownloadPDF ? 'Buka dokumen' : 'Unduh dokumen'),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}
