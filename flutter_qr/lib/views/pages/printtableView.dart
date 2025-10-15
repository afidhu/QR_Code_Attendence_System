import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../model/attendenceModel.dart';
import '../controller/attendanceController.dart';
// import 'package:pdf_google_fonts/pdf_google_fonts.dart'; // Make sure to add this in pubspec.yaml

class PrintTableview extends StatefulWidget {
  const PrintTableview({super.key});

  @override
  State<PrintTableview> createState() => _PrintTableviewState();
}

class _PrintTableviewState extends State<PrintTableview> {
  // AttendancesController attendancesController = Get.put(AttendancesController(),);
  AttendancesController attendanceController = Get.put(AttendancesController());

  // Attendances attendancesObject =Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Print Attendance'), centerTitle: true,),
      body: PdfPreview(build: (format) => _generatePdf(format, 'My Table')),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true,title: 'DS Attendance');
    final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Table(
            border: pw.TableBorder.all(),
            columnWidths: const <int, pw.TableColumnWidth>{
              0: pw.FixedColumnWidth(100.0),
              1: pw.FlexColumnWidth(2),
              2: pw.FixedColumnWidth(80.0),
              3: pw.FixedColumnWidth(80.0),
              4: pw.FixedColumnWidth(80.0),
            },
            children: [
              // Table header
              pw.TableRow(
                children: [
                  _headerCell('S/NAME', font),
                  _headerCell('S/REG', font),
                  _headerCell('S/SIGN', font),
                  _headerCell('FROM', font),
                  _headerCell('TO', font),
                ],
              ),
              // Dynamic rows
              ...attendanceController.attendancePerCourse.map((issue) {
                return pw.TableRow(
                  children: [
                    _cell(issue.studentName.toString(), font),
                    _cell(issue.studentReg.toString(), font),
                    _cell(issue.studentSign.toString(), font),
                    _cell(issue.startTime.toString(), font),
                    _cell(issue.endTime.toString(), font),
                  ],
                );
              }),
              // You can add more TableRow entries here
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  pw.Widget _headerCell(String text, pw.Font font) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(5),
      alignment: pw.Alignment.center,
      child: pw.Text(text, style: pw.TextStyle(fontWeight: pw.FontWeight.bold, font: font)),
    );
  }

  pw.Widget _cell(String text, pw.Font font) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(5),
      child: pw.Text(text, style: pw.TextStyle(font: font)),
    );
  }
}

//////THIS IS TABLE
// Table(
// border: TableBorder.all(),
// columnWidths: const <int, TableColumnWidth>{
// 0: FixedColumnWidth(100.0),
// 1: FlexColumnWidth(),
// 2: FixedColumnWidth(150.0),
// },
// children: const <TableRow>[
// TableRow(
// children: <Widget>[
// Text('Header 1'),
// Text('Header 2'),
// Text('Header 3'),
// ],
// ),
// TableRow(
// children: <Widget>[
// Text('Row 1, Cell 1'),
// Text('Row 1, Cell 2'),
// Text('Row 1, Cell 3'),
// ],
// ),
// // Add more TableRows as needed
// ],
// )
