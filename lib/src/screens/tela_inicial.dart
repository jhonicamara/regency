import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../screens/tela_jogo.dart';
import '../screens/sobre.dart';
import '../screens/regras.dart';
import '../transitions/transicoes.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green[200],
        body: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                imagemLogo(),
                botaoJogar(context),
                botoes(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget imagemLogo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Image.asset("images/icon/imagem_port.png"),
    );
  }

  Widget botaoJogar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: RoundedAlertBox(),
    );
  }

  Widget botoes() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Builder(
              builder: (context) => RaisedButton(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                  child: Text(
                    'Sobre',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
                color: Colors.yellow[600],
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    routeJogo(
                      TelaSobre(),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Builder(
              builder: (context) => RaisedButton(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Text(
                    'Regras',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                onPressed: () {
                  Navigator.of(context).push(routeJogo(TelaRegras()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedAlertBox extends StatefulWidget {
  @override
  _RoundedAlertBoxState createState() => _RoundedAlertBoxState();
}

class _RoundedAlertBoxState extends State<RoundedAlertBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: RaisedButton(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 95, vertical: 20),
          child: Text(
            'Jogar',
            style: TextStyle(fontSize: 25.0),
          ),
        ),
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0),
        ),
        onPressed: openAlertBox,
      ),
    );
  }

  Widget botao(int numero, String texto) {
    return Builder(
      builder: (context) => Container(
        child: RaisedButton(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Text(
              texto,
              style: TextStyle(fontSize: 20),
            ),
          ),
          color: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
          onPressed: () {
            Navigator.of(context).push(
              routeJogo(
                TelaJogo(numero * 2),
              ),
            );
          },
        ),
      ),
    );
  }

  openAlertBox() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(32.0),
                ),
              ),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Selecione o modo de jogo desejado: ',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          botao(5, 'Rapido'),
                          SizedBox(
                            width: 10,
                          ),
                          botao(10, 'Normal'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
