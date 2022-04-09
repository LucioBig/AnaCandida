import 'package:anacandida/screen/vote.dart';
import 'package:flutter/material.dart';

class AnaCandidaApp extends StatelessWidget {
  const AnaCandidaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  final title = 'Ana Candida';

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.info),
          tooltip: 'Info',
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text('Informações Gerais:'),
                content: Text('Aqui se encontra informações sobre esse app.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
        ),
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Row(
                children: const [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(image: AssetImage('assets/ana.png')),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '''Esse aplicativo pode lhe auxiliar a '''
                        '''escolher um candidato com base nas suas escolhas.''',
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const VotingScreen()),
                    );
                  },
                  child: const Text('Iniciar Escolhas'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
