import 'package:flutter_tts/flutter_tts.dart';

class ServicoVoz {
  static final FlutterTts _tts = FlutterTts();

  static bool _inicializado = false;

  static Future<void> inicializar() async {
    if (_inicializado) return;

    await _tts.setLanguage("pt-BR");

    // Velocidade confortável para idosos e baixa visão
    await _tts.setSpeechRate(0.45);

    // Tom natural
    await _tts.setPitch(1.0);

    // Volume máximo
    await _tts.setVolume(1.0);

    // Aguarda terminar de falar
    await _tts.awaitSpeakCompletion(true);

    // Android
    try {
      await _tts.setQueueMode(0);
    } catch (_) {}

    _inicializado = true;
  }

  static Future<void> parar() async {
    await _tts.stop();
  }

  static Future<void> falar(String texto) async {
    if (texto.trim().isEmpty) return;

    await inicializar();

    await parar();

    await _tts.speak(texto);
  }

  static Future<void> falarLento(String texto) async {
    if (texto.trim().isEmpty) return;

    await inicializar();

    await parar();

    await _tts.setSpeechRate(0.38);

    await _tts.speak(texto);

    await _tts.setSpeechRate(0.45);
  }

  static Future<void> anunciarTela(
    String titulo,
    String descricao,
  ) async {
    await falar(
      """
$titulo.

$descricao.

Deslize o dedo pela tela para ouvir as opções disponíveis.
""",
    );
  }

  static Future<void> anunciarBotao(
    String titulo,
    String descricao,
  ) async {
    await falar(
      """
$titulo.

$descricao.

Toque duas vezes para abrir.
""",
    );
  }
}