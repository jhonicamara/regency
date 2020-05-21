import 'package:flutter/material.dart';
import 'package:regency/src/screens/tela_inicial.dart';
import 'package:regency/src/transitions/transicoes.dart';

class TelaSobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
        backgroundColor: Colors.yellow[600],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(routeJogo(TelaInicial()));
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              cardInfo(
                  "Esse trabalho foi realizado por alunos do Instituto Federal do Paraná - Campus Londrina na intenção de fixar o conteúdo de regência verbal através da gameficação",
                  'images/icon/logo_if.png',
                  'images/pessoas/karen.png'),
              cardIntegrantes(),
              cardPessoas("Caio Felipe", "images/pessoas/caio.jpg"),
              cardPessoas("João Câmara", "images/pessoas/camara.jpeg"),
              cardPessoas("Caio Sato", "images/pessoas/xiru.jpeg"),
              cardPessoas("Gustavo Martins", "images/pessoas/paulista.jpeg"),
              cardPessoas("Ivan", "images/pessoas/ivan.jpeg"),
              cardPessoas("João Vitor", "images/pessoas/kleber.jpeg"),
              cardPessoas("Alvaro", "images/pessoas/alvaro.jpeg"),
              cardPessoas("Vinicius", "images/pessoas/vinicius.jpeg"),
            ],
          ),
        ],
      ),
    );
  }

  Widget cardPessoas(nome, imagem) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: <Widget>[
                imagens(imagem),
                Text(
                  nome,
                  style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: Colors.yellow[600],
              width: 3,
            ),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
        ),
      ),
    );
  }

  Widget imagens(String imagem) {
    return Container(
      width: 180,
      height: 180,
      child: CircleAvatar(
        backgroundImage: AssetImage(imagem),
      ),
    );
  }

  Widget cardInfo(info, imagem, pessoa) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        child: Card(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  child: Text(info,
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.justify),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        width: 150,
                        child: Image.asset(
                          imagem,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 120,
                            width: 120,
                            margin: EdgeInsets.only(bottom: 5),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(pessoa),
                            ),
                          ),
                          Text(
                            'Professora: Karen',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.yellow[600], width: 3),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
        ),
      ),
    );
  }

  Widget cardIntegrantes() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Integrantes',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.yellow[600], width: 3),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
        ),
      ),
    );
  }
}
