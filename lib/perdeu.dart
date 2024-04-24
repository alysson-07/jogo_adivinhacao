import 'package:app_adivinhacao/main.dart';
import 'package:flutter/material.dart';

class TelaPerdeu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Você Perdeu',
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
              'Você perdeu, tente novamente',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context,NivelJogo());
              },
              child: Text('Voltar',style: TextStyle(color: Colors.orange,),), 
            ),
          ],
        ),
      ),
    );
  }
}
