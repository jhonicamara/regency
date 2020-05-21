import 'package:flutter/material.dart';
import 'package:regency/src/style/hourTimes.dart';

Style top = Style();

class Widgets {
  Widget botaoPlay(String tag, Color colorido, Icon press, bool pressi) {
    return Container(
      width: 40,
      height: 40,
      child: ButtonTheme(
        child: FloatingActionButton(
          heroTag: tag,
          child: pressi ? press : Icon(Icons.play_arrow),
          backgroundColor: colorido,
          onPressed: null,
        ),
      ),
    );
  }

  Widget card(Widget botao, String pergunta, BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Text(
                  pergunta,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
              ),
              botao,
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.red, width: 2),
        ),
        elevation: 5,
      ),
    );
  }

  Widget cardResto(String tag, Color color, String resposta, Color key,
      bool pressi, Color button, Icon certo, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Card(
        color: pressi ? key : null,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Text(
                  resposta,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              botaoPlay(tag, pressi ? button : color, certo, pressi),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: pressi ? button : color, width: 2),
        ),
        elevation: 5,
      ),
    );
  }

  Widget footer(Widget botao, String texto) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              texto,
              style: TextStyle(fontSize: 50),
            ),
            botao,
          ],
        ),
      ),
    );
  }
}
