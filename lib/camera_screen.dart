import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:math';

class CameraScreen extends StatefulWidget {
  final CameraDescription camera;
  const CameraScreen({super.key, required this.camera});
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  bool _estaProcessando = false;
  final FlutterTts _flutterTts = FlutterTts();
  final List<String> _frasesMotivacionais = [
    "Lembre-se: cuidar da sua saúde é um ato de amor por você.",
    "Cada passo que você dá no tratamento é uma grande vitória!",
    "Respire fundo. Você não está sozinho nessa caminhada.",
    "Um dia de cada vez, mantenha o foco no seu bem-estar.",
  ];

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.camera, ResolutionPreset.medium);
    _controller.initialize().then((_) {
      if (!mounted) return;
      setState(() {});
    });
  }

  Map<String, dynamic> classificarMedicamento(String texto) {
    final t = texto.toLowerCase();

    final listaHipertensao = [
      'captopril',
      'enalapril',
      'losartana',
      'hidroclorotiazida',
      'atenolol',
      'propranolol',
      'anlodipino',
    ];
    for (var med in listaHipertensao) {
      if (t.contains(med)) {
        return {
          'cor': Colors.blue,
          'categoria': 'Medicamento para Hipertensão',
        };
      }
    }

    final listaDiabetes = [
      'metformina',
      'glibenclamida',
      'glicazida',
      'insulina',
      'dapagliflozina',
    ];
    for (var med in listaDiabetes) {
      if (t.contains(med)) {
        return {'cor': Colors.red, 'categoria': 'Medicamento para Diabetes'};
      }
    }

    return {'cor': Colors.grey, 'categoria': 'Medicamento de uso geral'};
  }

  @override
  void dispose() {
    _controller.dispose();
    _flutterTts.stop();
    super.dispose();
  }

  String _obterFraseAleatoria() {
    return _frasesMotivacionais[Random().nextInt(_frasesMotivacionais.length)];
  }

  Future<void> _capturarELer() async {
    if (_estaProcessando) return;
    setState(() => _estaProcessando = true);

    try {
      final file = await _controller.takePicture();
      final inputImage = InputImage.fromFilePath(file.path);
      final textRecognizer = TextRecognizer();
      final recognizedText = await textRecognizer.processImage(inputImage);
      await textRecognizer.close();

      final List<TextBlock> listaBlocos = List.from(recognizedText.blocks);
      listaBlocos.sort(
        (a, b) => a.boundingBox.top.compareTo(b.boundingBox.top),
      );
      String textoOrganizado = listaBlocos.map((bloco) => bloco.text).join(' ');

      // --- LÓGICA DE CLASSIFICAÇÃO ---
      final classificacao = classificarMedicamento(textoOrganizado);

      // Agora atualizamos a tela e a fala com a nova categoria
      setState(() {
        // Se você criou variáveis globais _corCategoria e _textoCategoria, atualize-as aqui
        // Exemplo: _corCategoria = classificacao['cor'];
      });

      if (textoOrganizado.isNotEmpty) {
        // Fala a categoria identificada
        await _flutterTts.speak(
          "Identifiquei que este é um ${classificacao['categoria']}.",
        );
        await Future.delayed(const Duration(seconds: 2));

        // Lê o nome do remédio
        await _flutterTts.speak(textoOrganizado);

        await Future.delayed(const Duration(seconds: 3));
        await _flutterTts.speak(_obterFraseAleatoria());
      }

      if (textoOrganizado.isNotEmpty) {
        // 1. Lê o rótulo
        await _flutterTts.speak(textoOrganizado);

        // 2. Aguarda um tempo extra com base no tamanho do texto
        // (Calculamos 500ms por caractere para garantir que ele fale tudo)
        int tempoEspera = (textoOrganizado.length * 100);
        await Future.delayed(Duration(milliseconds: tempoEspera));

        // 3. Agora sim, entra o acolhimento
        await _flutterTts.speak(_obterFraseAleatoria());
      }
    } finally {
      setState(() => _estaProcessando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) return Container();
    return Scaffold(
      body: CameraPreview(_controller),
      floatingActionButton: FloatingActionButton(
        onPressed: _capturarELer,
        child: _estaProcessando
            ? const CircularProgressIndicator()
            : const Icon(Icons.camera_alt),
      ),
    );
  }
}

// Esta função define a lógica do seu assistente
Map<String, dynamic> classificarMedicamento(String texto) {
  final t = texto.toLowerCase();

  if (t.contains('losartana') ||
      t.contains('enalapril') ||
      t.contains('pressão')) {
    return {'cor': Colors.blue, 'categoria': 'Anti-hipertensivo'};
  } else if (t.contains('metformina') ||
      t.contains('glicose') ||
      t.contains('insulina')) {
    return {'cor': Colors.red, 'categoria': 'Diabetes'};
  }
  return {'cor': Colors.grey, 'categoria': 'Geral'};
}
