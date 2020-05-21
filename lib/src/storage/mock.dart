import 'package:regency/src/storage/perguntas.dart';

class Mock {
  Perguntas p = Perguntas();

  static Map<String, String> pergunta;

  createMock() {
    p.perguntas.add(pergunta = {
      'titulo': '2',
      'correta': 'correta',
      'alternativaA': 'alternativaA',
      'alternativaB': 'alternativaB',
      'alternativaC': 'alternativaC'
    });
    p.perguntas.add(pergunta = {
      'titulo': '1',
      'correta': 'correta',
      'alternativaA': 'alternativaA',
      'alternativaB': 'alternativaB',
      'alternativaC': 'alternativaC'
    });
  }
}
