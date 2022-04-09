import 'package:anacandida/model/vote.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  late List<Candidato> candidatos;
  final List<Votacao> votacoes;

  ResultScreen({Key? key, required this.votacoes}) : super(key: key) {
    int quantidadeCandidatos = 10;
    candidatos = geraCandidatos(quantidadeCandidatos, votacoes.length);
    candidatos.sort((Candidato b, Candidato a) => a
        .quantidadeVotacoesIguais(votacoes)
        .compareTo(b.quantidadeVotacoesIguais(votacoes)));
    for (var i = 0; i < candidatos.length; i++) {
      print(candidatos[i].quantidadeVotacoesIguais(votacoes).toString() +
          '-' +
          candidatos[i].nome);
    }
  }

  void a() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ana Candida'),
      ),
      body: Column(
        children: <Widget>[
          const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Resultado',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
              title: Text(candidatos[0].nome +
                  " - " +
                  candidatos[0].percentual(votacoes))),
          ListTile(
              title: Text(candidatos[1].nome +
                  " - " +
                  candidatos[1].percentual(votacoes))),
          ListTile(
              title: Text(candidatos[2].nome +
                  " - " +
                  candidatos[2].percentual(votacoes))),
          ListTile(
              title: Text(candidatos[3].nome +
                  " - " +
                  candidatos[3].percentual(votacoes))),
          ListTile(
              title: Text(candidatos[4].nome +
                  " - " +
                  candidatos[4].percentual(votacoes))),
          Expanded(
            child: Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Voltar')),
            ),
          ),
        ],
      ),
    );
  }
}
