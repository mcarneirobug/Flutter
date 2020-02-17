import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {

  final int pontuacao;
  final void Function() isReiniciarQuestionario;

  Resultado(this.pontuacao, this.isReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns! Sua pontuação: $pontuacao';
    } else if(pontuacao < 12) {
      return 'Sensacional! Sua pontuação: $pontuacao';
    } else if(pontuacao < 16) {
      return 'Impressionante! Sua pontuação: $pontuacao';
    } else {
      return 'Nível Jedi! Sua pontuação: $pontuacao';
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
              style: TextStyle(fontSize: 28),
            ),
          ),
          FlatButton(
            child: Text(
              'Reiniciar?',
              style: TextStyle(fontSize: 18),
              ),
            textColor: Colors.blue,
            onPressed: isReiniciarQuestionario,
          )
       ],
     );
  }
}
