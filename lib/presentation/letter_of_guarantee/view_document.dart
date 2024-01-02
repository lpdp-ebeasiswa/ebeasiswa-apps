
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'letter_of_guarantee_controller.dart';

class ViewDocumentLoG extends StatefulWidget {
  const ViewDocumentLoG({super.key, required this.url});
  final String url;
  @override
  State<ViewDocumentLoG> createState() => _ViewDocumentLoGState();
}

class _ViewDocumentLoGState extends State<ViewDocumentLoG> {
  final LetterOfGuaranteeController controller =
      Get.put(LetterOfGuaranteeController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cached PDF From Url'),
      ),
      body: PdfPreview(
          build: (format) => _generatePdf(format),
        ),
    );
  }

  
    final pdf = pw.Document();

  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: false);
    final font = await PdfGoogleFonts.nunitoExtraLight();
    String pdfdata = await controller.getDoc(url: widget.url);
    final image = pw.MemoryImage(
  File(pdfdata).readAsBytesSync(),
);
    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return  pw.Image(image);
        },
      ),
    );

    return pdf.save();
  }

}