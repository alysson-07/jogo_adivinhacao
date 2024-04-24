import 'package:app_adivinhacao/main.dart';
import 'package:flutter/material.dart';

class TelaGanhou extends StatelessWidget {
  final int tentativas;

  TelaGanhou({required this.tentativas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Parabéns!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Circular',
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 237, 119, 22),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Parabéns, você ganhou!',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Tentativas: $tentativas',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context,NivelJogo()); 
              },
              child: Text('Voltar'),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Circular',
                  ),
                ),
                foregroundColor: MaterialStateProperty.all<Color>(
                  Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
