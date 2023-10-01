import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pdfLib; // Importação do pacote pdf
import 'package:pdf/src/pdf/page_format.dart';

class RegisteredUsersDialog extends StatelessWidget {
  final List<Map<String, dynamic>> registeredUsersData;

  RegisteredUsersDialog(this.registeredUsersData);

  Future<pdfLib.Document> generateCertificatePdf(
      BuildContext context, Map<String, dynamic> userData) async {
    final ByteData imageData =
        await rootBundle.load('lib/certificado/Certificado_grande.jpg');

    final Uint8List imageBytes = imageData.buffer.asUint8List();

    final pdf = pdfLib.Document();

    pdf.addPage(
      pdfLib.Page(
        orientation: pdfLib.PageOrientation.landscape,
        margin: pdfLib.EdgeInsets.all(0),
        pageFormat: PdfPageFormat.a4,
        build: (pdfLib.Context context) {
          return pdfLib.Stack(
            children: [
              pdfLib.Center(
                  child: pdfLib.Image(pdfLib.MemoryImage(imageBytes),
                      fit: pdfLib.BoxFit.fill)),
              pdfLib.Container(
                height: 475, // Defina a altura desejada
                child: pdfLib.Center(
                  child: pdfLib.Text(
                    userData["nome"]?.toString() ?? "N/A",
                    style: pdfLib.TextStyle(fontSize: 50),
                  ),
                ),
              ),
              pdfLib.Positioned(
                left: 150,
                top: 400,
                child: pdfLib.Text(
                  userData["ano"]?.toString() ?? "N/A",
                  style: pdfLib.TextStyle(fontSize: 40),
                ),
              ),
              pdfLib.Positioned(
                left: 230,
                top: 340,
                child: pdfLib.Text(
                  userData["modeloKombi"]?.toString() ?? "N/A",
                  style: pdfLib.TextStyle(fontSize: 40),
                ),
              ),
              pdfLib.Positioned(
                left: 325,
                top: 450,
                child: pdfLib.Text(
                  userData["motorizacao"]?.toString() ?? "N/A",
                  style: pdfLib.TextStyle(fontSize: 40),
                ),
              ),
            ],
          );
        },
      ),
    );

    return pdf;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Lista de Cadastrados (${registeredUsersData.length} registros)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 300, // Adjust the height as needed
              child: ListView.builder(
                itemCount: registeredUsersData.length,
                itemBuilder: (context, index) {
                  var userData = registeredUsersData[index];
                  return ListTile(
                    title: Text(userData["nome"]?.toString() ?? "N/A"),
                    trailing: ElevatedButton(
                      onPressed: () async {
                        // Gerar o PDF do certificado
                        pdfLib.Document pdf =
                            await generateCertificatePdf(context, userData);

                        // Exibir o certificado em PDF
                        await Printing.layoutPdf(
                          onLayout: (format) async => pdf.save(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(247, 174, 71, 0.774),
                      ),
                      child: Text(
                        'Certificado',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(247, 174, 71, 0.774),
              ),
              child: Text(
                'Fechar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
