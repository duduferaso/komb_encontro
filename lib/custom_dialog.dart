import 'package:flutter/material.dart';

class RegisteredUsersDialog extends StatelessWidget {
  final List<Map<String, dynamic>> registeredUsersData;

  RegisteredUsersDialog(this.registeredUsersData);

  @override
  Widget build(BuildContext context) {
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
                      onPressed: () {
                        // Implementar Certificado
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
