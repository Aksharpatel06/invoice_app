
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:invoice_app/Model/model.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;


class Pdfscreen extends StatefulWidget {
  const Pdfscreen({super.key});

  @override
  State<Pdfscreen> createState() => _PdfscreenState();
}

class _PdfscreenState extends State<Pdfscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (format) => genrate(),
      ),
    );
  }
}



Future<Uint8List> genrate()
async {
  final pdf = pw.Document();

  productmodel product1 =productmodel();
  product1.refdata();
  double count=0;
  for(int i=0;i<product1.productlist!.length;i++)
    {
      count+=(product1.productlist![index].name!)*(product1.productlist![index].name!);
    }
  cellbox(int index)
  {
    return pw.TableRow(
        children: [
          pw.Text(product1.productlist![index].name!,textAlign: pw.TextAlign.center),
          pw.Text('${product1.productlist![index].prize!}',textAlign: pw.TextAlign.center),
          pw.Text('${product1.productlist![index].quatity!}',textAlign: pw.TextAlign.center),
          pw.Text({product1.productlist![index].prize!}*{product1.productlist![index].quatity!},textAlign: pw.TextAlign.center)
        ]
    );
  }

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
            children: [
              pw.Table(
                border: pw.TableBorder.all(color: PdfColors.black,width: 1),
                children: [
                  pw.TableRow(
                    children: [
                      pw.Text('Product name',textAlign: pw.TextAlign.center),
                      pw.Text('Prize',textAlign: pw.TextAlign.center),
                      pw.Text('Quatity',textAlign: pw.TextAlign.center),
                      pw.Text('total',textAlign: pw.TextAlign.center)
                    ]
                  ),
                  ...List.generate(product1.productlist!.length, (index) => cellbox(index))
                ]
              )
            ]
        );
      }
    ),
  );

  return await pdf.save();
}
