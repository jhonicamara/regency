import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:regency/src/screens/regras.dart';
import 'package:regency/src/screens/sobre.dart';
import 'package:regency/src/screens/tela_inicial.dart';
import 'package:regency/src/storage/perguntas.dart';
import 'package:regency/src/style/hourTimes.dart';
import '../transitions/transicoes.dart';
import 'package:quiver/async.dart';
import '../screens/widgets/widgets.dart';

Style top = Style();
Widgets t = Widgets();
var pergunta = ['correta', 'alternativaA', 'alternativaB', 'alternativaC'];
int id = Perguntas().perguntas.length;

class TelaJogo extends StatefulWidget {
  final int numero;
  TelaJogo(this.numero);

  @override
  State<StatefulWidget> createState() {
    return TelaJogoState(this.numero);
  }
}

class TelaJogoState extends State<TelaJogo> {
  int numero;
  TelaJogoState(this.numero);

  bool showCerta = false;
  bool timerOn = false;

  var index = 0;

  var cartas = 0;

  int _start = 121;
  int _current = 121;

  CountdownTimer countDownTimer;

  @override
  void dispose() {
    super.dispose();
    cartas = 0;
    index = 0;
    numero = 0;
  }

  void startTimer() {
    countDownTimer = new CountdownTimer(
      new Duration(seconds: _start),
      new Duration(seconds: 1),
    );
    var sub = countDownTimer.listen(null);

    sub.onData((duration) {
      setState(() {
        _current = _start - duration.elapsed.inSeconds;
      });
    });

    sub.onDone(
      () {
        sub.cancel();
        return {
          setState(() => showCerta = !showCerta),
          Timer(
            const Duration(seconds: 25),
            () => {
              setState(() => showCerta = !showCerta),
              setState(() => cartas++),
              setState(
                () => index = Random().nextInt(id),
              ),
              startTimer(),
            },
          ),
        };
      },
    );
  }

  void resstartTimer() {
    countDownTimer.cancel();
    countDownTimer = new CountdownTimer(
      new Duration(seconds: _start),
      new Duration(seconds: 1),
    );
  }

  Color certa(String key, Color color) {
    if (key == 'correta') {
      return color;
    } else
      return Colors.grey;
  }

  Icon certaIcon(String key) {
    if (key == 'correta') {
      return Icon(Icons.check);
    } else
      return Icon(Icons.clear);
  }

  Widget botao() {
    return Container(
      child: RaisedButton(
        onPressed: () => {
          Timer(
            const Duration(seconds: 25),
            () => {
              setState(() => showCerta = !showCerta),
              setState(() => cartas++),
              setState(
                  () => {index = Random().nextInt(id), pergunta.shuffle()}),
              setState(() => showCerta = !showCerta),
            },
          ),
          resstartTimer(),
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Proximo',
            style: TextStyle(fontSize: 25.0),
          ),
        ),
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (cartas == 0 && timerOn == false) {
      setState(() => index = Random().nextInt(id));
      startTimer();
      timerOn = !timerOn;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(routeJogo(TelaInicial()));
          },
        ),
      ),
      body: cartas < numero
          ? SingleChildScrollView(
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  t.card(
                    t.botaoPlay(
                        'btnprinc', Colors.red, Icon(Icons.play_arrow), false),
                    Perguntas().perguntas[index]['titulo'],
                    context,
                  ),
                  t.cardResto(
                    'btn1',
                    Colors.green[600],
                    Perguntas().perguntas[index][pergunta[0]],
                    certa(pergunta[0], Colors.green[300]),
                    showCerta,
                    certa(pergunta[0], Colors.green[600]),
                    certaIcon(pergunta[0]),
                    context,
                  ),
                  t.cardResto(
                    'btn2',
                    Colors.blue[300],
                    Perguntas().perguntas[index][pergunta[1]],
                    certa(pergunta[1], Colors.blue),
                    showCerta,
                    certa(pergunta[1], Colors.blue[800]),
                    certaIcon(pergunta[1]),
                    context,
                  ),
                  t.cardResto(
                    'btn3',
                    Colors.yellow[600],
                    Perguntas().perguntas[index][pergunta[2]],
                    certa(pergunta[2], Colors.yellow[300]),
                    showCerta,
                    certa(pergunta[2], Colors.yellow[600]),
                    certaIcon(pergunta[2]),
                    context,
                  ),
                  t.cardResto(
                    'btn4',
                    Colors.red,
                    Perguntas().perguntas[index][pergunta[3]],
                    certa(pergunta[3], Colors.red[300]),
                    showCerta,
                    certa(pergunta[3], Colors.red[600]),
                    certaIcon(pergunta[3]),
                    context,
                  ),
                  t.footer(
                    botao(),
                    timer(),
                  ),
                ],
              ))
          : Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Image.asset("images/icon/imagem_port.png"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Fim de jogo',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Obrigado por jogar o jogo Regency!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        child: Builder(
                          builder: (context) => Container(
                            child: RaisedButton(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Text(
                                  'Inicio',
                                  style: TextStyle(fontSize: 30.0),
                                ),
                              ),
                              color: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(
                                  routeJogo(
                                    TelaInicial(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                    ),
                    botoes(),
                  ],
                ),
              ),
            ),
    );
  }

  Widget botoes() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
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
                  padding: EdgeInsets.all(20),
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

  timer() {
    return top.formatHHMMSS(_current);
  }
}
