import 'package:flutter/material.dart';
import 'package:regency/src/screens/tela_inicial.dart';
import 'package:regency/src/transitions/transicoes.dart';

class TelaRegras extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(routeJogo(TelaInicial()));
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            cardComponentes(),
            SizedBox(
              height: 20,
            ),
            cardObjetivo(),
            SizedBox(
              height: 20,
            ),
            cardSobCartas(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Deslize para direita para visualizar as cartas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 520,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  cardCarta("images/cards/carta_copia.png", "Ela copia"),
                  cardCarta("images/cards/carta_bloqueio.png", "Ela bloqueia"),
                  cardCarta("images/cards/carta_dado.png", "Tenha sorte"),
                  cardCarta("images/cards/carta_diganao.png", "Diga não"),
                  cardCarta("images/cards/carta_dobro.png",
                      "O que esta bom pode melhorar,\n ou não"),
                  cardCarta("images/cards/carta_isencao.png", "Isenção"),
                  cardCarta(
                      "images/cards/carta_mais_2.png", "Compra mais dois"),
                  cardCarta("images/cards/carta_pagamento.png",
                      "Veja o lado bom, pelo menos \n você tem dinheiro!"),
                  cardCarta("images/cards/carta_pagamentodobro.png",
                      "Se está ruim, pode melhorar"),
                  cardCarta("images/cards/carta_roubo5.png",
                      "Quem perdeu ficou relaxado"),
                  cardCarta("images/cards/carta_roubo10.png",
                      "Quem perdeu ficou relaxado, \nem dobro"),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            cardInicial(),
            SizedBox(
              height: 20,
            ),
            cardJogo(),
            SizedBox(
              height: 20,
            ),
            cardMestre(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget cardCarta(String imagem, String descricao) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        child: Card(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 350,
                  height: 400,
                  child: Image.asset(imagem),
                ),
                Text(
                  descricao,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.blue, width: 5),
          ),
        ),
      ),
    );
  }

  Widget cardComponentes() {
    return Container(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text(
                "COMPONENTES DO JOGO",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      '66 cartas de ações',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '68 cartas de apostas',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '26 cédulas de 1R',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '26 cédulas de 2R',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '25 cédulas de 5R',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '30 cédulas de 10R',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '32 cédulas de 20R',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '23 cédulas de 50R',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '18 cédulas de 100R',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '1 dado',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Faixa etária: A partir de 10 anos',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Participantes: 2 a 8 jogador',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.blue, width: 3),
        ),
        elevation: 5,
      ),
    );
  }

  Widget cardObjetivo() {
    return Container(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text(
                "OBJETIVO DO JOGO",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text(
                  "Gerenciar as apostas e ampliar o seu dinheiro, sendo o mais rico de todos. Tornando-se um “craque” na Regência Verbal",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: Colors.blue,
            width: 3,
          ),
        ),
        elevation: 5,
      ),
    );
  }

  Widget cardInicial() {
    return Container(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(
                "ANTES DE INCIAR",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text(
                    "Antes de iniciar o jogo, deve se decidido quem será o mestre e qual será o estilo de jogo desejado. Existem dois tipos de jogo, o modo rápido e o modo normal",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.justify),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    child: DataTable(
                      dataRowHeight: 100.0,
                      columns: [
                        DataColumn(
                          label: Text('Modo de Jogo'),
                        ),
                        DataColumn(
                          label: Text('Quantidade de Partidas'),
                        ),
                        DataColumn(
                          label: Text('Duração Máxima'),
                        ),
                        DataColumn(
                          label: Text('Valor Inicial'),
                        ),
                        DataColumn(
                          label: Text('Cartas Iniciais'),
                        ),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(
                            Text('Rápido'),
                          ),
                          DataCell(
                            Text('5 Partidas'),
                          ),
                          DataCell(
                            Text('8 min'),
                          ),
                          DataCell(
                            Column(
                              children: <Widget>[
                                Text('3 notas 2R'),
                                Text('3 notas 5R'),
                                Text('3 notas 10R'),
                                Text('3 notas 20R'),
                                Text('Total R111,00'),
                              ],
                            ),
                          ),
                          DataCell(
                            Column(
                              children: <Widget>[
                                Text('4 cartas base'),
                                Text('3 cartas de Ações'),
                              ],
                            ),
                          ),
                        ]),
                        DataRow(
                          cells: [
                            DataCell(
                              Text('Normal'),
                            ),
                            DataCell(
                              Text('10 Partidas'),
                            ),
                            DataCell(
                              Text('15 min'),
                            ),
                            DataCell(
                              Column(
                                children: <Widget>[
                                  Text('3 notas 2R'),
                                  Text('3 notas 5R'),
                                  Text('4 notas 10R'),
                                  Text('4 notas 20R'),
                                  Text('2 notas 50R'),
                                  Text('Total R241,00'),
                                ],
                              ),
                            ),
                            DataCell(
                              Column(
                                children: <Widget>[
                                  Text('4 cartas base'),
                                  Text('6 cartas de Ações'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Text(
                    "Após decidido o modo de jogo, o mestre deve distribuir o dinheiro e as cartas iniciais para cada jogador (de acordo com o modo de jogo escolhido",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.justify),
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.blue, width: 3),
        ),
        elevation: 5,
      ),
    );
  }

  Widget cardJogo() {
    return Container(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(
                "DURANTE O JOGO",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text(
                    "Durante o jogo será feita algumas perguntas e cada jogador deverá apostar uma quantia de dinheiro (no mínimo 2R no máximo 20R) na resposta escolhida, no final da partida, quem acertar recebe, do banco, o valor apostado, já quem errar perde o dinheiro.",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.justify),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text(
                    "No início de cada partida, o mestre deve ler em voz alta a questão e as 4 respostas (indicadas) pelas cores verde, azul, amarelo e vermelho). Após isso, os demais jogadores devem colocar sobre a mesa uma de suas Cartas de Aposta (virada para baixo), junto com a quantia a ser apostada. Além disso, é somente nesse momento que os jogadores poderão utilizar suas Cartas de Ação",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.justify),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text(
                    "Cada partida tem duração de 1min e 15 segundos, esse tempo é para ler a questão, apostar e utilizar as Cartas de Ação. Caso todos já tenham feito suas ações, antes do tempo ter chego ao fim, o mestre pode pular para a resposta. Porém, caso algum jogador não aposte até o fim da rodada, e não estiver sobre efeito nem de isenção nem de bloqueio, ele recebe uma penalidade de 30R. Caso você não tenha nenhuma carta de aposta, ou queira aumentar o número de cartas, você pode comprar uma carta do centro por 10R.",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.justify),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text(
                    "Após o fim de cada partida, o mestre deve anunciar a resposta correta, indicada pelo celular, e conferir quem acertou e quem errou, entregando ou recebendo o dinheiro apostado. Além disso, todas as cartas utilizadas nessa rodada devem ser colocadas no monte de descarte.",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.justify),
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.blue, width: 3),
        ),
        elevation: 5,
      ),
    );
  }

  Widget cardMestre() {
    return Container(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(
                "O MESTRE",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 280,
                child: Text(
                    "Um jogador é escolhido para ser o mestre, ele é responsável por:",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.justify),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: point(),
                      title: Text(
                          'Distribuir o dinheiro e as cartas iniciais para cada jogador (de acordo com o modo dejogo escolhido)',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.justify),
                    ),
                    ListTile(
                      leading: point(),
                      title: Text('Manipular o celular com o jogo;',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.justify),
                    ),
                    ListTile(
                      leading: point(),
                      title: Text('Ler em voz alta as questões e as respostas;',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.justify),
                    ),
                    ListTile(
                      leading: point(),
                      title: Text(
                          'Gerenciar o dinheiro do banco, dando para quem acertou e retirando de quem erro;',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.justify),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.blue, width: 3),
        ),
        elevation: 5,
      ),
    );
  }

  Widget cardSobCartas() {
    return Container(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "AS CARTAS",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                  "As cartas nesse jogo são divididas em duas categorias: Carta de Aposta e Carta de Ação. No início do jogo elas são embaralhadas e ficam em um único monte no meio.",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.justify),
              SizedBox(
                height: 20,
              ),
              Text(
                  "As Cartas de Apostas são aquelas que possuem uma ou duas cores* e são utilizadas para determinar em qual alternativa você irá apostar. Em cada partida, os jogadores deverão escolher uma resposta e colocar virado* sobre a mesa a Carta de Aposta contendo a cor desejada. No final da partida as cartas de aposta vão para o lixo.",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.justify),
              SizedBox(
                height: 30,
              ),
              Text(
                  "*A carta COPIA é a única carta de aposta que não possui uma cor definida, além disso, ela sempre deve ser colocada com a face para cima, precedida de um anuncio informando qual jogador será copiado.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.justify),
              SizedBox(
                height: 30,
              ),
              Text(
                  "Já as cartas de Ações são cartas que trazem dinâmica ao jogo, elas interferem diretamente com os outros jogadores. Cada carta tem uma função diferente que está descrita na parte inferior.",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.justify),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.blue, width: 3),
        ),
        elevation: 5,
      ),
    );
  }

  Widget point() {
    return Container(
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
