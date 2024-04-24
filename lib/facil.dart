import 'package:flutter/material.dart';
import 'dart:math';
import 'ganhou.dart';
import 'perdeu.dart';

class TelaJogoAdivinhacaoF extends StatefulWidget {
  final String nivel;
  TelaJogoAdivinhacaoF({required this.nivel});

  @override
  _TelaJogoAdivinhacaoFState createState() => _TelaJogoAdivinhacaoFState();
}

class _TelaJogoAdivinhacaoFState extends State<TelaJogoAdivinhacaoF> {
  late int _numeroParaAdivinhar;
  late TextEditingController _controller;
  String _feedback = '';
  int _tentativas = 0;
  final int _maxTentativas = 3;

  @override
  void initState() {
    super.initState();
    _numeroParaAdivinhar = _gerarNumeroAleatorio();
    _controller = TextEditingController();
  }

  int _gerarNumeroAleatorio() {
    final Random random = Random();
    return random.nextInt(10) + 1;
  }

  void _verificarAdivinhacao() {
    final int suposicao = int.tryParse(_controller.text) ?? 0;
    setState(() {
      _tentativas++;
      if (suposicao == _numeroParaAdivinhar) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TelaGanhou(
                tentativas: _tentativas)
          ),
        );
      } else if (suposicao < _numeroParaAdivinhar) {
        _feedback = 'Tente um número maior.';
      } else {
        _feedback = 'Tente um número menor.';
      }
      if (widget.nivel == 'Fácil' && _tentativas >= _maxTentativas) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TelaPerdeu()),
        );
      }
    });
  }

  void _reiniciarJogo() {
    setState(() {
      _numeroParaAdivinhar = _gerarNumeroAleatorio();
      _controller.clear();
      _feedback = '';
      _tentativas = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Jogo de Adivinhação - ${widget.nivel}',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Circular',
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 237, 119, 22),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Adivinhe o número entre 1 e 10:',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Digite um número',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _verificarAdivinhacao,
                child: Text('Verificar'),
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
              SizedBox(height: 20.0),
              Text(
                _feedback,
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _reiniciarJogo,
                child: Text('Reiniciar Jogo'),
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
      ),
    );
  }
}
