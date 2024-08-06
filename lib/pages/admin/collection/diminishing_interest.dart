import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:typed_data';

class LoanDetailsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> loanData = [
    {"installment": 0, "grossLoan": 100000.00, "principal": 0, "interest": 0, "otherCharges": 6000, "netProceeds": 94000, "outstandingBalance": 100000},
    {"installment": 1, "grossLoan": 0, "principal": 8050.75, "interest": 625, "otherCharges": 0, "netProceeds": -8675.75, "outstandingBalance": 91949.25},
    // Add the rest of the data here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diminishing Interest Loan'),
        actions: [
          IconButton(
            icon: Icon(Icons.picture_as_pdf, color: Colors.red,),
            onPressed: () {
              Printing.layoutPdf(onLayout: (format) => _generatePdf(format));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Republic of the Philippines\nPhilippine National Police\nMetro Cebu Police Multipurpose Cooperative(MCPMC)',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            _buildLoanInfo(),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildLoanTable(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoanInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildInfoRow('Principal Amount (in PhP):', '100,000.00'),
        _buildInfoRow('Loan Term (in years):', '1'),
        _buildInfoRow('No. of installments (in months):', '12'),
        _buildInfoRow('Grace period (in months):', '-'),
        _buildInfoRow('No. of periods (in months):', '12'),
        _buildInfoRow('Other Charges:', '6.000%'),
        _buildInfoRow('Monthly Installment:', 'PhP 8,675.75'),
        _buildInfoRow('Contractual Interest Rate', 'Per Annum: 7.500%\n  Per Month: 0.625%'),
        _buildInfoRow('Nominal Interest Rate:', '4.109%'),
        _buildInfoRow('Effective Interest Rate (EIR)', 'Per Annum: 21.091%\n  Per Month: 1.608%'),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            value,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildLoanTable() {
    return Table(
      border: TableBorder.all(),
      columnWidths: {
        0: FractionColumnWidth(0.15),
        1: FractionColumnWidth(0.15),
        2: FractionColumnWidth(0.15),
        3: FractionColumnWidth(0.15),
        4: FractionColumnWidth(0.15),
        5: FractionColumnWidth(0.15),
        6: FractionColumnWidth(0.15),
      },
      children: [
        TableRow(children: [
          _buildTableCell('Installment Period'),
          _buildTableCell('Gross Loan'),
          _buildTableCell('Principal'),
          _buildTableCell('Interest'),
          _buildTableCell('Other Charges'),
          _buildTableCell('NET PROCEEDS Cash Flows'),
          _buildTableCell('Outstanding Balance'),
        ]),
        ...loanData.map((data) {
          return TableRow(children: [
            _buildTableCell(data['installment'].toString()),
            _buildTableCell(data['grossLoan'].toStringAsFixed(2)),
            _buildTableCell(data['principal'].toStringAsFixed(2)),
            _buildTableCell(data['interest'].toStringAsFixed(2)),
            _buildTableCell(data['otherCharges'].toStringAsFixed(2)),
            _buildTableCell(data['netProceeds'].toStringAsFixed(2)),
            _buildTableCell(data['outstandingBalance'].toStringAsFixed(2)),
          ]);
        }).toList(),
      ],
    );
  }

  Widget _buildTableCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Padding(
                padding: const pw.EdgeInsets.all(16.0),
                child: pw.Text(
                  'Republic of the Philippines\nPhilippine National Police\nMetro Cebu Police Multipurpose Cooperative(MCPMC)',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  textAlign: pw.TextAlign.center,
                ),
              ),
              pw.SizedBox(height: 16.0),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  _buildPdfInfoRow('Principal Amount (in PhP):', '100,000.00'),
                  _buildPdfInfoRow('Loan Term (in years):', '1'),
                  _buildPdfInfoRow('No. of installments (in months):', '12'),
                  _buildPdfInfoRow('Grace period (in months):', '-'),
                  _buildPdfInfoRow('No. of periods (in months):', '12'),
                  _buildPdfInfoRow('Other Charges:', '6.000%'),
                  _buildPdfInfoRow('Monthly Installment:', 'PhP 8,675.75'),
                  _buildPdfInfoRow('Contractual Interest Rate', 'Per Annum: 7.500%\n  Per Month: 0.625%'),
                  _buildPdfInfoRow('Nominal Interest Rate:', '4.109%'),
                  _buildPdfInfoRow('Effective Interest Rate (EIR)', 'Per Annum: 21.091%\n  Per Month: 1.608%'),
                ],
              ),
              pw.SizedBox(height: 16.0),
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(horizontal: 25.0),
                child: pw.Table(
                  border: pw.TableBorder.all(),
                  columnWidths: {
                    0: pw.FractionColumnWidth(0.10),
                    1: pw.FractionColumnWidth(0.10),
                    2: pw.FractionColumnWidth(0.10),
                    3: pw.FractionColumnWidth(0.10),
                    4: pw.FractionColumnWidth(0.10),
                    5: pw.FractionColumnWidth(0.10),
                    6: pw.FractionColumnWidth(0.10),
                  },
                  children: [
                    pw.TableRow(children: [
                      _buildPdfTableCell('Installment Period'),
                      _buildPdfTableCell('Gross Loan'),
                      _buildPdfTableCell('Principal'),
                      _buildPdfTableCell('Interest'),
                      _buildPdfTableCell('Other Charges'),
                      _buildPdfTableCell('NET PROCEEDS Cash Flows'),
                      _buildPdfTableCell('Outstanding Balance'),
                    ]),
                    ...loanData.map((data) {
                      return pw.TableRow(children: [
                        _buildPdfTableCell(data['installment'].toString()),
                        _buildPdfTableCell(data['grossLoan'].toStringAsFixed(2)),
                        _buildPdfTableCell(data['principal'].toStringAsFixed(2)),
                        _buildPdfTableCell(data['interest'].toStringAsFixed(2)),
                        _buildPdfTableCell(data['otherCharges'].toStringAsFixed(2)),
                        _buildPdfTableCell(data['netProceeds'].toStringAsFixed(2)),
                        _buildPdfTableCell(data['outstandingBalance'].toStringAsFixed(2)),
                      ]);
                    }).toList(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  pw.Widget _buildPdfInfoRow(String label, String value) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.center,
      children: [
        pw.Expanded(
          flex: 3,
          child: pw.Text(
            label,
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            textAlign: pw.TextAlign.center,
          ),
        ),
        pw.Expanded(
          flex: 5,
          child: pw.Text(
            value,
            textAlign: pw.TextAlign.center,
          ),
        ),
      ],
    );
  }

  pw.Widget _buildPdfTableCell(String text) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(15.0),
      child: pw.Text(
        text,
        textAlign: pw.TextAlign.center,
      ),
    );
  }
}
