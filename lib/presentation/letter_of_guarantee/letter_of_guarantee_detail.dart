import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../data/model/loslog/loslog.dart';
import 'letter_of_guarantee_controller.dart';

import 'package:pdf/widgets.dart' as pw;

import 'view_document.dart';

class LetterOfGuaranteeDetail extends StatefulWidget {
  const LetterOfGuaranteeDetail(
      {super.key, required this.data, required this.title});
  final Loslog data;
  final String title;
  @override
  State<LetterOfGuaranteeDetail> createState() =>
      _LetterOfGuaranteeDetailState();
}

class _LetterOfGuaranteeDetailState extends State<LetterOfGuaranteeDetail> {
  final LetterOfGuaranteeController controller =
      Get.put(LetterOfGuaranteeController());
  Image? imagepdf;
  getDocument() {}

  final pdf = pw.Document();
  bool ispdf = false;
  String? uri;

  // Track the progress of a downloaded file here.
  double progress = 0;

  // Track if the PDF was downloaded here.
  bool didDownloadPDF = false;

  // Show the progress status to the user.
  String progressString = 'File has not been downloaded yet.';

  // This method uses Dio to download a file from the given URL
  // and saves the file to the provided `savePath`.
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

      // Here, you're catching an error and printing it. For production
      // apps, you should display the warning to the user and give them a
      // way to restart the download.
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
        progressString = 'Download progress: ${(progress * 100).toStringAsFixed(0)}% done.';
      }
    });
  }

   var _openResult = 'Unknown';
  String filename = "/loslog.pdf";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            title: Row(
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(color: Colors.black),
                ),
                IconButton(
                    onPressed: didDownloadPDF
                        ? null
                        : () async {
                            String docId = widget.data.idpengajuan.toString();
                            String dnln = widget.data.dnln.toString();
                            String code = widget.data.code.toString();
                            setState(() {
                              uri =
                                  "https://ebeasiswa-lpdp.kemenkeu.go.id/Request/DownloadLOSLOG?id=$docId&dnln=$dnln&tipe=$code&stamp=1";
                              ispdf = true;
                            });
                            var tempDir = await getTemporaryDirectory();
                            download(Dio(), uri!, tempDir.path + filename);
                          },
                    icon: const Icon(
                      Icons.download,
                      color: Colors.blue,
                    ))
              ],
            ),
            backgroundColor: Colors.transparent,
            elevation: 0),
        body: SafeArea(
            child: SizedBox(
          width: Get.width,
          child: ListView(
            children: [
              if (didDownloadPDF)
                Text(
                  progressString,
                ),
              Text('Atas nama : ${widget.data.namaLengkap}'),
              Text('bidang karir : ${widget.data.bidangKarir}'),
              Text('jurusan univ : ${widget.data.awardeeJurusanUniversitas}'),
              TextButton(
                // Disable the button if no PDF is downloaded yet. Once the
                // PDF file is downloaded, you can then open it using PSPDFKit.
                onPressed: !didDownloadPDF
                    ? null
                    : () async {
                        var tempDir = await getTemporaryDirectory();
                        final result = await OpenFilex.open(tempDir.path + filename);

                        setState(() {
                          _openResult =
                              "type=${result.type}  message=${result.message}";
                        });
                      },
                child: Text('Open the downloaded file using PSPDFKit'),
              ),
            ],
          ),
        )));
  }
}
