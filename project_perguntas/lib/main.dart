import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() {
  runApp(new PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    // {
    //   'texto': 'Qual sua cor favorita?',
    //   'respostas': [
    //     {'texto': 'Preto', 'pontuacao': 10},
    //     {'texto': 'Vermelho', 'pontuacao': 5},
    //     {'texto': 'Verde', 'pontuacao': 4},
    //     {'texto': 'Branco', 'pontuacao': 9},
    //   ],
    // },
    {
      'texto': 'Como devemos chamar o Breno?',
      'respostas': [
        {'texto': 'Uchoâ', 'pontuacao': 5},
        {'texto': 'Breno', 'pontuacao': 2},
        {'texto': 'Grande Uchoâ', 'pontuacao': 20},
        {'texto': 'Mestre Uchoâ', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Fred é frontend developer?',
      'respostas': [
        {'texto': 'Claro', 'pontuacao': 10},
        {'texto': 'Com Certeza', 'pontuacao': 20},
        // {'texto': 'Leo', 'pontuacao': 9},
        // {'texto': 'Pedro', 'pontuacao': 2},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (isPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get isPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: isPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                onResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return new _PerguntaAppState();
  }
}
