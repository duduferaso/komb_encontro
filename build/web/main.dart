import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

List<String> images = [
  'web/carrosel/gol3.jpeg',
  'web/carrosel/branca1.jpeg',
  'web/carrosel/branca2.jpeg',
  'web/carrosel/azul.jpeg',
  'web/carrosel/preta.jpeg',
];

List<String> items = [
  '* Sorteio de Brindes',
  '* Praça de Alimentação',
  '* Mercado de Pulgas',
  '* Troca de Óleo',
  '* Check List Veicular',
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kombismo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final CarouselController _carouselController = CarouselController();

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('web/img/old3.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode
                  .darken), // Ajuste a opacidade aqui (0.5 é 50% de opacidade)
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Center(
              child: Image.asset(
                'web/img/logopreta2.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 100),
            Center(
              child: Column(
                children: [
                  Text(
                    '02 de setembro 2023',
                    style: TextStyle(
                      fontFamily: 'Stencil',
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'São Miguel do Oeste/SC',
                    style: TextStyle(
                      fontFamily: 'Stencil',
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'Venha participar do nosso evento gratuito!',
                    style: TextStyle(
                      fontFamily: 'Stencil',
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'O evento terá as seguintes atrações:',
                    style: TextStyle(
                      fontFamily: 'Stencil',
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
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
                              width: MediaQuery.of(context).size.width *
                                  0.4, // Definindo 70% da largura do dispositivo
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
                                      decoration: InputDecoration(
                                        labelText: 'Nome',
                                      ),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: 'E-mail',
                                      ),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Cidade',
                                      ),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Estado',
                                      ),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Telefone',
                                      ),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: 'WhatsApp',
                                      ),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Instagram',
                                      ),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Facebook',
                                      ),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Modelo da Kombi',
                                      ),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Ano',
                                      ),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Motorização',
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromRGBO(
                                                  247, 174, 71, 0.774)),
                                          child: Text('Cancelar'),
                                        ),
                                        SizedBox(width: 16),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Lógica de envio do formulário
                                            Navigator.of(context).pop();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromRGBO(
                                                  247, 174, 71, 0.774)),
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
                        backgroundColor: Color.fromRGBO(247, 174, 71, 0.774)),
                    child: Text(
                      'Faça Parte',
                      style: TextStyle(
                        fontFamily: 'Stencil',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Participantes',
                  style: TextStyle(
                    fontFamily: 'Stencil',
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
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
                        fit: BoxFit
                            .cover, // Definindo o ajuste da imagem como BoxFit.cover
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Container(
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
          ],
        ),
      ),
    ));
  }
}
