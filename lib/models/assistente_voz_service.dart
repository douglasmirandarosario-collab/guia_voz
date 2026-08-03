import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:guia_voz/utils/servico_voz.dart';

class AssistenteVozService {
  static final SpeechToText speech =
      SpeechToText();

  static Future<void> inicializar() async {
    await speech.initialize();
  }

  static bool get disponivel =>
      speech.isAvailable;

  static bool get ouvindo =>
      speech.isListening;

  static Future<void> parar() async {
    await speech.stop();
  }

  static Future<void> ouvir({
    required BuildContext context,
    required Function(String texto)
        onResultado,
  }) async {
    if (!speech.isAvailable) {
      await ServicoVoz.falar(
        "Reconhecimento de voz indisponível.",
      );
      return;
    }

    await speech.listen(
      onResult: (resultado) {
        if (resultado.finalResult) {
          onResultado(
            resultado.recognizedWords,
          );
        }
      },
      listenFor: const Duration(seconds: 8),
      pauseFor: const Duration(seconds: 4),
      localeId: "pt_BR",
    );
  }
}