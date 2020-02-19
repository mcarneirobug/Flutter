import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() isReiniciarQuestionario;

  Resultado(this.pontuacao, this.isReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns! Sua pontuação: $pontuacao';
    } else if (pontuacao < 12) {
      return 'Nível Frontend! Sua pontuação: $pontuacao';
    } else if (pontuacao < 16) {
      return 'Nível Backend! Sua pontuação: $pontuacao';
    } else {
      return 'Nível FullStack! Sua pontuação: $pontuacao';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 20, backgroundColor: Colors.black, color: Colors.white),
          ),
        ),
        FlatButton(
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18),
          ),
          color: Colors.blue,
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(8.0),
          splashColor: Colors.blueAccent,
          onPressed: isReiniciarQuestionario,
        )
      ],
    );
  }
}
