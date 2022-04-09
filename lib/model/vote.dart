import 'dart:core';
import 'dart:math';

class Votacao {
  late String titulo;
  late String descricao;
  late Opcao opcaoEscolhida;

  @override
  String toString() {
    return 'Votacao{titulo: $titulo, opcaoEscolhida: $opcaoEscolhida}';
  }
}

enum Opcao { favoravel, desfavoravel, indiferente, outro, vazio }

List<Votacao> geraListaVotacaoComVoto(int tamanho) {
  List<Votacao> votacoes = [];
  for (var i = 0; i < tamanho; i++) {
    var votacao = Votacao();
    votacao.titulo = 'Votação ' + i.toString();
    var index = i.toString();
    votacao.descricao =
        'Descricao da Votacao ' + index + ' trata do assunto ' + index + '.';
    var rand = Random().nextInt(Opcao.values.length);
    votacao.opcaoEscolhida = Opcao.values[rand];

    votacoes.add(votacao);
  }
  return votacoes;
}

List<Votacao> geraListaVotacaoSemVoto(int tamanho) {
  List<Votacao> votacoes = [];
  for (var i = 0; i < tamanho; i++) {
    var votacao = Votacao();
    var index = (i + 1).toString();
    votacao.titulo = 'Votação ' + index;
    votacao.descricao =
        'Descricao da Votacao ' + index + ' trata do assunto ' + index + '.';
    votacao.opcaoEscolhida = Opcao.vazio;

    votacoes.add(votacao);
  }
  return votacoes;
}

class Candidato {
  late String nome;
  late String partido;
  late List<Votacao> votacoes;

  String percentual(List<Votacao> votacoes) {
    return (100 * (quantidadeVotacoesIguais(votacoes) / votacoes.length))
            //.round()
            .toString() +
        "%";
  }

  int quantidadeVotacoesIguais(List<Votacao> votacoes) {
    int iguais = 0;
    for (var i = 0; i < votacoes.length; i++) {
      if (this.votacoes[i].opcaoEscolhida == votacoes[i].opcaoEscolhida) {
        iguais++;
      }
    }
    return iguais;
  }

  @override
  String toString() {
    return 'Candidato{nome: $nome, votacoes: $votacoes} \n\n';
  }
}

List<Candidato> geraCandidatos(quantidadeCandidato, quantidadeVotacoes) {
  List<Candidato> candidatos = [];
  for (var i = 0; i < quantidadeCandidato; i++) {
    Candidato candidato = Candidato();
    String index = i.toString();
    candidato.nome = "Candidato " + index;
    candidato.partido = "Partido " + index;
    candidato.votacoes = geraListaVotacaoComVoto(quantidadeVotacoes);
    candidatos.add(candidato);
  }
  return candidatos;
}

void main() {
  int quantidadeVotacoes = 10;
  int quantidadeCandidatos = 1000;
  List<Candidato> candidatos =
      geraCandidatos(quantidadeCandidatos, quantidadeVotacoes);
  List<Votacao> votacao = geraListaVotacaoComVoto(quantidadeVotacoes);
  for (var i = 0; i < candidatos.length; i++) {
    print(candidatos[i].quantidadeVotacoesIguais(votacao));
  }
  print("\n\n");
  candidatos.sort((Candidato b, Candidato a) => a
      .quantidadeVotacoesIguais(votacao)
      .compareTo(b.quantidadeVotacoesIguais(votacao)));
  //var melhores = candidatos.sublist(0, 3);
  print(candidatos[0].quantidadeVotacoesIguais(votacao));
  print(candidatos[1].quantidadeVotacoesIguais(votacao));
  print(candidatos[2].quantidadeVotacoesIguais(votacao));
}
