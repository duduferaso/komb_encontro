import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:komb_encontro/firebase_options.dart';
import 'package:komb_encontro/provider/formulario_provider.dart';
import 'custom_dialog.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

List<String> images = [
  'lib/carrosel/branca1.jpeg',
  'lib/carrosel/branca2.jpeg',
  'lib/carrosel/branca3.jpeg',
  'lib/carrosel/azul.jpeg',
  'lib/carrosel/preta.jpeg',
  'lib/carrosel/preta2.jpeg',
  'lib/carrosel/juntas.jpeg',
];

List<String> images2 = [
  'lib/patrocinadores/IORA.jpeg',
  'lib/patrocinadores/tarab.jpg',
  'lib/patrocinadores/laserdj.jpg',
  'lib/patrocinadores/ambioeste.jpg',
  'lib/patrocinadores/dalla.jpeg',
  'lib/patrocinadores/delivery.jpeg',
  'lib/patrocinadores/santochopp.jpeg',
  'lib/patrocinadores/armazem.jpg',
  'lib/patrocinadores/sabedot.jpg',
];

List<String> items = ['* Sorteio de Brindes', '* Praça de Alimentação'];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FormularioProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kombismo',
        home: HomeScreen(),
      ),
    );
  }
}

void _showRegisteredUsers(BuildContext context) async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  QuerySnapshot snapshot = await db.collection("formulario").get();

  List<Map<String, dynamic>> registeredUsersData =
      snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return RegisteredUsersDialog(
          registeredUsersData); // Use the custom dialog
    },
  );
}

class HomeScreen extends StatelessWidget {
  final CarouselController _carouselController = CarouselController();

  String formatPhoneNumber(String phoneNumber) {
    String formattedNumber = phoneNumber;
    if (phoneNumber.length == 10) {
      formattedNumber =
          '(${phoneNumber.substring(0, 2)}) ${phoneNumber.substring(2, 6)}-${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      formattedNumber =
          '(${phoneNumber.substring(0, 2)}) ${phoneNumber.substring(2, 7)}-${phoneNumber.substring(7)}';
    }
    return formattedNumber;
  }

  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    TextEditingController nomeController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController whatsappController = TextEditingController();
    TextEditingController instagramController = TextEditingController();
    TextEditingController motorizacaoController = TextEditingController();
    TextEditingController anoController = TextEditingController();
    TextEditingController modeloKombiController = TextEditingController();
    TextEditingController cidadeController = TextEditingController();
    TextEditingController estadoController = TextEditingController();
    FirebaseFirestore db = FirebaseFirestore.instance;

    void addNewFormulario() {
      final user = <String, dynamic>{
        "nome": nomeController.text,
        "email": emailController.text,
        "whatsapp": whatsappController.text,
        "instagram": instagramController.text,
        "motorizacao": motorizacaoController.text,
        "ano": anoController.text,
        "modeloKombi": modeloKombiController.text,
        "cidade": cidadeController.text,
        "estado": estadoController.text,
      };

      db.collection("formulario").add(user).then((DocumentReference doc) {
        nomeController.clear();
        emailController.clear();
        whatsappController.clear();
        instagramController.clear();
        motorizacaoController.clear();
        anoController.clear();
        modeloKombiController.clear();
        cidadeController.clear();
        estadoController.clear();

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Presença Confirmada!'),
              content: Text(
                  'Obrigado por se cadastrar! Sua presença está confirmada.'),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(247, 174, 71, 0.774),
                    ),
                    child: Text(
                      'Ok',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            );
          },
        );
      });
    }

    bool validateForm() {
      List<TextEditingController> requiredControllers = [
        nomeController,
        emailController,
        cidadeController,
        estadoController,
        whatsappController,
        modeloKombiController,
        anoController,
        motorizacaoController
      ];

      for (var controller in requiredControllers) {
        if (controller.text.isEmpty) {
          return false;
        }
      }

      return true;
    }

    double titleFontSize;
    double subtitleFontSize;
    double descriptionFontSize;

    if (screenWidth < 600 && screenWidth >= 400) {
      titleFontSize = 40.0;
      subtitleFontSize = 20.0;
      descriptionFontSize = 18.0;
    } else if (screenWidth <= 400) {
      titleFontSize = 35.0;
      subtitleFontSize = 25.0;
      descriptionFontSize = 24.0;
    } else {
      titleFontSize = 60.0;
      subtitleFontSize = 30.0;
      descriptionFontSize = 24.0;
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/img/old3.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'lib/img/kombismo_branco2.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 100),
              Center(
                child: Column(
                  children: [
                    Text(
                      '07 de outubro 2023',
                      style: TextStyle(
                        fontFamily: 'Stencil',
                        fontSize: titleFontSize,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black, // Cor da sombra
                            offset: Offset(3, 4),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'São Miguel do Oeste/SC',
                      style: TextStyle(
                        fontFamily: 'Stencil',
                        fontSize: subtitleFontSize,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black, // Cor da sombra
                            offset: Offset(3, 4),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      'Venha participar do nosso evento gratuito!',
                      style: TextStyle(
                        fontFamily: 'Stencil',
                        fontSize: descriptionFontSize,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black, // Cor da sombra
                            offset: Offset(3, 4),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      'Atrações:',
                      style: TextStyle(
                        fontFamily: 'Stencil',
                        fontSize: descriptionFontSize,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black, // Cor da sombra
                            offset: Offset(3, 4),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: items.map((item) {
                          return Text(
                            item,
                            style: TextStyle(
                              fontFamily: 'Stencil',
                              fontSize: descriptionFontSize,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.black, // Cor da sombra
                                  offset: Offset(3, 4),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                padding: EdgeInsets.all(16),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Formulário de Cadastro',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      TextField(
                                        controller: nomeController,
                                        decoration: InputDecoration(
                                          labelText: 'Nome *',
                                        ),
                                      ),
                                      TextField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          labelText: 'E-mail *',
                                        ),
                                      ),
                                      TextField(
                                        controller: cidadeController,
                                        decoration: InputDecoration(
                                          labelText: 'Cidade *',
                                        ),
                                      ),
                                      TextField(
                                        controller: estadoController,
                                        decoration: InputDecoration(
                                          labelText: 'Estado *',
                                        ),
                                      ),
                                      TextField(
                                        controller: whatsappController,
                                        decoration: InputDecoration(
                                          labelText: 'WhatsApp *',
                                        ),
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          String formattedNumber =
                                              formatPhoneNumber(value);
                                          whatsappController.value =
                                              whatsappController.value.copyWith(
                                            text: formattedNumber,
                                            selection:
                                                TextSelection.fromPosition(
                                              TextPosition(
                                                  offset:
                                                      formattedNumber.length),
                                            ),
                                          );
                                        },
                                      ),
                                      TextField(
                                        controller: instagramController,
                                        decoration: InputDecoration(
                                          labelText: 'Instagram',
                                        ),
                                      ),
                                      TextField(
                                        controller: modeloKombiController,
                                        decoration: InputDecoration(
                                          labelText: 'Modelo da Kombi *',
                                        ),
                                      ),
                                      TextField(
                                        controller: anoController,
                                        decoration: InputDecoration(
                                          labelText: 'Ano *',
                                        ),
                                      ),
                                      TextField(
                                        controller: motorizacaoController,
                                        decoration: InputDecoration(
                                          labelText: 'Motorização *',
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              nomeController.clear();
                                              emailController.clear();
                                              whatsappController.clear();
                                              instagramController.clear();
                                              motorizacaoController.clear();
                                              anoController.clear();
                                              modeloKombiController.clear();
                                              cidadeController.clear();
                                              estadoController.clear();
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromRGBO(
                                                  247, 174, 71, 0.774),
                                            ),
                                            child: Text('Cancelar'),
                                          ),
                                          SizedBox(width: 16),
                                          ElevatedButton(
                                            onPressed: () {
                                              if (validateForm()) {
                                                addNewFormulario();
                                                Navigator.of(context).pop();
                                              } else {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Campos não preenchidos'),
                                                      content: Text(
                                                          'Por favor, preencha todos os campos obrigatórios com *.'),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                Color.fromRGBO(
                                                                    247,
                                                                    174,
                                                                    71,
                                                                    0.774),
                                                          ),
                                                          child: Text(
                                                            'Ok',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromRGBO(
                                                  247, 174, 71, 0.774),
                                            ),
                                            child: Text('Enviar'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(247, 174, 71, 0.774),
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                      ),
                      child: Text(
                        'Faça Parte',
                        style: TextStyle(
                          fontFamily: 'Stencil',
                          color: Colors.white,
                          fontSize: 14,
                          shadows: [
                            Shadow(
                              color: Colors.black, // Cor da sombra
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Patrocinadores',
                    style: TextStyle(
                      fontFamily: 'Stencil',
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black, // Cor da sombra
                          offset: Offset(3, 4),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: 150.0,
                  // aspectRatio: 16 / 6,
                  aspectRatio: MediaQuery.of(context).size.width * 0.8 / 400.0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                ),
                items: images2.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          // color: Colors.grey[200],
                          color: Colors.transparent,
                        ),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 60),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Participantes',
                    style: TextStyle(
                      fontFamily: 'Stencil',
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black, // Cor da sombra
                          offset: Offset(3, 4),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: 300.0,
                  aspectRatio: 16 / 6,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: images.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onDoubleTap: () {
                  _showRegisteredUsers(context);
                },
                child: Container(
                  color: Color.fromRGBO(247, 174, 71, 0.774),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Desenvolvido por',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Eduardo Feraso',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
