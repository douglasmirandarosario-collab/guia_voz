import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class DiabetesScreen extends StatefulWidget {
  const DiabetesScreen({super.key});

  @override
  State<DiabetesScreen> createState() => _DiabetesScreenState();
}

class _DiabetesScreenState extends State<DiabetesScreen> {
  final FlutterTts flutterTts = FlutterTts();
  final String bulaTexto =
      "Metformina 850 miligramas. Indicação: Controle da glicemia em pacientes com diabetes tipo 2. Modo de usar: Tomar um comprimido após as refeições. Atenção: Não interrompa o tratamento sem orientação médica.";

  @override
  void initState() {
    super.initState();
    _iniciarLeitura();
  }

  Future<void> _iniciarLeitura() async {
    await flutterTts.setLanguage("pt-BR");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(bulaTexto);
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bula: Metformina")),
      body: Semantics(
        label:
            "Bula da Metformina. O aplicativo está lendo as informações automaticamente.",
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Icon(Icons.medication, size: 100, color: Colors.blue),
              const SizedBox(height: 20),
              Text(bulaTexto, style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => _iniciarLeitura(),
                child: const Text("Repetir Leitura"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
