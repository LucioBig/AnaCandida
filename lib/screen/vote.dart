import 'package:anacandida/model/vote.dart';
import 'package:anacandida/screen/result.dart';
import 'package:flutter/material.dart';

class VotingScreen extends StatefulWidget {
  const VotingScreen({Key? key}) : super(key: key);

  @override
  State<VotingScreen> createState() => _VotingScreenState();
}

class _VotingScreenState extends State<VotingScreen> {
  List<Votacao> votacoes = geraListaVotacaoSemVoto(5);
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ana Candida'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(votacoes[index].titulo,
                style: const TextStyle(fontSize: 30)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(votacoes[index].descricao),
          ),
          RadioListTile(
            title: const Text('Favoravel'),
            value: Opcao.favoravel,
            groupValue: votacoes[index].opcaoEscolhida,
            onChanged: (Opcao? value) {
              setState(() {
                votacoes[index].opcaoEscolhida = value!;
              });
            },
          ),
          RadioListTile(
            title: const Text('Desfavoravel'),
            value: Opcao.desfavoravel,
            groupValue: votacoes[index].opcaoEscolhida,
            onChanged: (Opcao? value) {
              setState(() {
                votacoes[index].opcaoEscolhida = value!;
              });
            },
          ),
          RadioListTile(
            title: const Text('Indiferente'),
            value: Opcao.indiferente,
            groupValue: votacoes[index].opcaoEscolhida,
            onChanged: (Opcao? value) {
              setState(() {
                votacoes[index].opcaoEscolhida = value!;
              });
            },
          ),
          Row(
            children: [
              Expanded(
                child: Center(
                  child: ElevatedButton(
                      onPressed: () {
                        if (index == 0) {
                          Navigator.pop(context);
                        } else {
                          index--;
                          setState(() {});
                        }
                      },
                      child: const Text('Voltar')),
                ),
              ),
              Expanded(
                child: Center(
                  child: ElevatedButton(
                      onPressed: () {
                        if (index == votacoes.length - 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultScreen(votacoes: votacoes),
                              ));
                        } else if (votacoes[index].opcaoEscolhida !=
                            Opcao.vazio) {
                          index++;
                          setState(() {});
                        }
                      },
                      child: const Text('Proximo')),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
