import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:guia_voz/utils/servico_voz.dart';

class CameraScreen extends StatefulWidget {
  final CameraDescription camera;

  const CameraScreen({
    super.key,
    required this.camera,
  });

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  final TextRecognizer _textRecognizer =
      TextRecognizer(script: TextRecognitionScript.latin);

  bool _isProcessing = false;

String _limparTextoOCR(String texto) {
  String textoLimpo = texto;

  textoLimpo = textoLimpo.replaceAll('\n', ' ');

  textoLimpo = textoLimpo.replaceAll(
    RegExp(r'\s+'),
    ' ',
  );

   textoLimpo = textoLimpo.replaceAll(
    RegExp(
      r'(registro ms|lote|sac|indústria brasileira)',
      caseSensitive: false,
    ),
    '',
  );        

return textoLimpo.trim();
}  

String _priorizarMedicamento(String texto) {
  final linhas = texto
      .split('\n')
      .where((linha) => linha.trim().isNotEmpty)
      .toList();

  if (linhas.isEmpty) {
    return texto;
  }

  return linhas.take(6).join('. ');
} 

String _melhorarLeitura(String texto) {
  return texto
      .replaceAll('MG', ' miligramas ')
      .replaceAll('mg', ' miligramas ')
      .replaceAll('ML', ' mililitros ')
      .replaceAll('ml', ' mililitros ')
      .replaceAll('/', ' ')
      .replaceAll('-', '. ')
      .replaceAll('UI', ' unidades internacionais ');
}

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    _textRecognizer.close();
    super.dispose();
  }

  Future<void> _processarImagemCamera() async {
    if (_isProcessing) return;

    setState(() {
      _isProcessing = true;
    });

    try {
      await _initializeControllerFuture;

      final image = await _controller.takePicture();

      final inputImage = InputImage.fromFilePath(
        image.path,
      );

      final RecognizedText recognizedText =
          await _textRecognizer.processImage(
        inputImage,
      );

      final textoLido = _melhorarLeitura(
        _priorizarMedicamento(
          _limparTextoOCR(
           recognizedText.text,
          ),
        ),   
      );    

      await ServicoVoz.inicializar();

      if (textoLido.isNotEmpty) {
        await ServicoVoz.falarLento(
        """
        medicamento identificado.

        $textoLido
        """
        );

        if (mounted) {
          final preview =
              textoLido.length > 50
                  ? "${textoLido.substring(0, 50)}..."
                  : textoLido;

          ScaffoldMessenger.of(context)
              .showSnackBar(
            SnackBar(
              content: Text("Lido: $preview"),
            ),
          );
        }
      } else {
        await ServicoVoz.falar(
          "Nenhum texto encontrado. Tente aproximar a câmera da embalagem do medicamento.",
        );
      }
    } catch (e) {
      debugPrint(
        "Erro ao processar imagem: $e",
      );

      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(
          SnackBar(
            content: Text(
              "Erro ao ler o texto: $e",
            ),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Leitor de Medicamentos",
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (
          context,
          snapshot,
        ) {
          if (snapshot.connectionState ==
              ConnectionState.done) {
            return Stack(
              children: [
                Positioned.fill(
                  child: CameraPreview(
                    _controller,
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 30,
                  child: ElevatedButton.icon(
                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.blueAccent,
                      padding:
                          const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                    ),
                    onPressed:
                        _isProcessing
                            ? null
                            : _processarImagemCamera,
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                    label: Text(
                      _isProcessing
                          ? "Lendo texto..."
                          : "Ler Texto da Embalagem",
                      style:
                          const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          return const Center(
            child:
                CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}