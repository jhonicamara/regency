import 'package:flutter/material.dart';
import 'package:regency/src/storage/perguntas.dart';
import 'mixins/validation_mixin.dart';

class Formulario extends StatefulWidget {
  createState() {
    return FormularioState();
  }
}

class FormularioState extends State<Formulario> with ValidationMixin {
  //Isto é uma global key. Ele verifica atraves do FormState o validator
  //de cada metodo, caso todos os validators forem true, o validate do FormState
  //e true.
  final formKey = GlobalKey<FormState>();

  Perguntas p = Perguntas();
  static Map<String, String> pergunta;

  String titulo = "";
  String correta = "";
  String alternativaA = "";
  String alternativaB = "";
  String alternativaC = "";

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(null);
          },
        ),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Card(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        input('Titulo'),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                        ),
                        inputA('Correta'),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                        ),
                        inputB('alternativa A'),
                        Container(
                          margin: EdgeInsets.only(top: 30),
                        ),
                        inputC('alternativa B'),
                        Container(
                          margin: EdgeInsets.only(top: 30),
                        ),
                        inputD('alternativa C'),
                        Container(
                          margin: EdgeInsets.only(top: 30),
                        ),
                        botaoLogar(),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    //side: BorderSide(color: Colors.red, width: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget input(String name) {
    return TextFormField(
        cursorColor: Colors.yellow[800],
        autofocus: false,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow[700], width: 3.0),
            borderRadius: BorderRadius.circular(32.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.circular(32.0),
          ),
          hintText: name,
        ),
        validator: validarString,
        onSaved: (String valor) {
          titulo = valor;
        });
  }

  Widget inputA(String name) {
    return TextFormField(
        cursorColor: Colors.yellow[800],
        autofocus: false,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow[700], width: 3.0),
            borderRadius: BorderRadius.circular(32.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.circular(32.0),
          ),
          hintText: name,
        ),
        validator: validarString,
        onSaved: (String valor) {
          correta = valor;
        });
  }

  Widget inputB(String name) {
    return TextFormField(
        cursorColor: Colors.yellow[800],
        autofocus: false,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow[700], width: 3.0),
            borderRadius: BorderRadius.circular(32.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.circular(32.0),
          ),
          hintText: name,
        ),
        validator: validarString,
        onSaved: (String valor) {
          alternativaA = valor;
        });
  }

  Widget inputC(String name) {
    return TextFormField(
        cursorColor: Colors.yellow[800],
        autofocus: false,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow[700], width: 3.0),
            borderRadius: BorderRadius.circular(32.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.circular(32.0),
          ),
          hintText: name,
        ),
        validator: validarString,
        onSaved: (String valor) {
          alternativaB = valor;
        });
  }

  Widget inputD(String name) {
    return TextFormField(
        cursorColor: Colors.yellow[800],
        autofocus: false,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow[700], width: 3.0),
            borderRadius: BorderRadius.circular(32.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.circular(32.0),
          ),
          hintText: name,
        ),
        validator: validarString,
        onSaved: (String valor) {
          alternativaC = valor;
        });
  }

  Widget botaoLogar() {
    return Container(
      height: 50,
      child: RaisedButton(
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
          }

          print(titulo);
          print(correta);
          print(alternativaA);
          print(alternativaB);
          print(alternativaC);
        },
        elevation: 4.0,
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.add,
              color: Colors.black,
              size: 30,
            ),
            Text(
              'Adicionar Pergunta',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          //side: BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
