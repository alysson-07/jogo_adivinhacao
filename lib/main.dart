import 'package:flutter/material.dart';
import 'facil.dart';
import 'medio.dart';
import 'dificil.dart';

void main() {
  runApp(AdivinhacaoApp());
}

class AdivinhacaoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo de Adivinhação',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NivelJogo(),
    );
  }
}

class NivelJogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 237, 119, 22),
        title: Text('Níveis'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TelaJogoAdivinhacaoF(nivel: 'Fácil')),
                );
              },
              child: Text('Fácil'),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                foregroundColor: MaterialStateProperty.all<Color>(
                  Colors.orange,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TelaJogoAdivinhacaoM(nivel: 'Médio')),
                );
              },
              child: Text('Médio'),
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TelaJogoAdivinhacaoD(nivel: 'Difícil')),
                );
              },
              child: Text('Difícil'),
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
