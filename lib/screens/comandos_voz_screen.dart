import 'package:flutter/material.dart';

import 'medicamentos_screen.dart';
import 'diabetes_screen.dart';
import 'emergencia_screen.dart';
import 'gestantes_screen.dart';
import 'cadastro_hiperdia_screen.dart';
import 'hiperdia_screen.dart';
import 'importancia_screen.dart';
import 'locais_screen.dart';
import 'prevencao_screen.dart';
import 'gravador_consulta_screen.dart';
import 'historico_medicoes_screen.dart';
import 'gov_br_screen.dart';
import 'acessibilidade_voz_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../models/assistente_voz_service.dart';
import 'pos_operatorio_screen.dart';


import 'package:guia_voz/utils/servico_voz.dart';

class ComandosVozScreen extends StatefulWidget {
  const ComandosVozScreen({super.key});

  @override
  State<ComandosVozScreen> createState() => _ComandosVozScreenState();
}

class _ComandosVozScreenState extends State<ComandosVozScreen> {
  String _textoReconhecido =
    "Toque no microfone e diga: Guia Voz + o comando desejado.";

  bool _ouvindo = false;

  final SpeechToText _speech =
    AssistenteVozService.speech;
  
  @override
  void initState() {
    super.initState();
    _inicializarSpeech();
  }

  Future<void> _inicializarSpeech() async {
    await _speech.initialize();
  }    

  Future<void> _abrirMapa(String busca) async {
  final Uri url = Uri.parse(
  "https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(busca)}",
);

  await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  );
}

  void _processarComando(String comando) {
    comando = comando.toLowerCase();

    if (comando.contains("parar leitura") ||
        comando.contains("parar voz") ||
        comando.contains("parar")) {
      ServicoVoz.parar();
      return;
    }

    if (comando.contains("voltar")) {
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
      return;
    }

    if (comando.contains("início") ||
        comando.contains("inicio") ||
        comando.contains("home")) {
      Navigator.popUntil(
        context,
        (route) => route.isFirst,
      );

      return;
    }  

    if (comando.contains("ubs")) {
      ServicoVoz.falar(
        "Abrindo Unidades Básicas de Saúde próximas.",
      );

      _abrirMapa(
        "Unidade Básica de Saúde",
      );

      return;
    }
    
    if (comando.contains("farmácia popular") ||
        comando.contains("farmacia popular")) {

      ServicoVoz.falar(
        "Abrindo Farmácias Populares próximas.",
      );

      _abrirMapa(
        "Farmácia Popular",
      );

      return;
    }              

    if (comando.contains("upa")) {
      ServicoVoz.falar(
        "Abrindo Unidades de Pronto Atendimento próximas.",
      );

      _abrirMapa(
        "UPA",
      );

      return;
    }

    if (comando.contains("hospital")) {
      ServicoVoz.falar(
        "Abrindo hospitais próximos.",
      );

      _abrirMapa(
        "Hospital",
      );

      return;
    }

    if (comando.contains("mapa")) {
      ServicoVoz.falar(
        "Abrindo mapa.",
      );

      _abrirMapa(
        "Serviços de Saúde",
      );

      return;
    }                
                                    

    Widget? destino;

    if (comando.contains("medicamento") ||
        comando.contains("hipertensão") ||
        comando.contains("hipertensao")) {
      destino = const MedicamentosScreen();

    } else if (comando.contains("diabetes")) {
      destino = const DiabetesScreen();

    } else if (comando.contains("emergência") ||
        comando.contains("emergencia") ||
        comando.contains("socorro") ||
        comando.contains("urgência") ||
        comando.contains("urgencia")) {
      destino = const EmergenciaScreen();

    } else if (comando.contains("gestante")) {
      destino = const GestantesScreen();

    } else if (comando.contains("cadastro")) {
      destino = const CadastroHiperdiaScreen();

    } else if (comando.contains("exame")) {
      destino = const HiperdiaScreen();

    } else if (comando.contains("medição") ||
        comando.contains("medicao") ||
        comando.contains("pressão") ||
        comando.contains("pressao") ||
        comando.contains("glicemia")) {
      destino = const HistoricoMedicoesScreen();

    } else if (comando.contains("gravador") ||
        comando.contains("consulta")) {
      destino = const GravadorConsultaScreen();

    } else if (comando.contains("gov") ||
        comando.contains("sus digital") ||
        comando.contains("cartão sus") ||
        comando.contains("cartao sus")) {
      destino = const GovBrScreen();

    } else if (comando.contains("cuidado integral") ||
        comando.contains("bem estar") ||
        comando.contains("bem-estar") ||
        comando.contains("saúde mental") ||
        comando.contains("saude mental") ||
        comando.contains("apoio familiar")) {
      destino = const ImportanciaScreen();

    } else if (comando.contains("pós-operatório") ||
        comando.contains("pos operatorio") ||
        comando.contains("pos-operatorio") ||
        comando.contains("cirurgia") ||
        comando.contains("recuperação") ||
        comando.contains("recuperacao")) {
      destino = const PosOperatorioScreen();

    } else if (comando.contains("posto") ||
        comando.contains("posto de saúde") ||
        comando.contains("posto de saude") ||
        comando.contains("ubs") ||
        comando.contains("unidade básica") ||
        comando.contains("unidade basica") ||
        comando.contains("unidade de saúde") ||
        comando.contains("unidade de saude")) {
      destino = const LocaisScreen();

    } else if (comando.contains("prevenção") ||
        comando.contains("prevencao") ||
        comando.contains("complicações") ||
        comando.contains("complicacoes")) {
      destino = const PrevencaoScreen();    

    } else if (comando.contains("acessibilidade") ||
        comando.contains("voz")) {
      destino = const AcessibilidadeVozScreen();
    
    } else if (comando.contains("farmácia popular") ||
        comando.contains("farmacia popular") ||
        comando.contains("farmácia") ||
        comando.contains("farmacia")) {
      destino = const LocaisScreen();
    }
    
    if (destino != null) {
      ServicoVoz.falar(
        "Abrindo opção solicitada",
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => destino!,
        ),
      );
    } else {
      ServicoVoz.falar(
        "Não consegui entender. Tente falar devagar. Exemplo: Abrir emergência ou abrir prevenção."
      );
    }
  }

  Future<void> _ouvirComando() async {

  if (!_speech.isAvailable) {
    await ServicoVoz.falar(
      "Reconhecimento de voz indisponível.",
    );
    return;
  }

  setState(() {
    _ouvindo = true;
    _textoReconhecido =
        "Estou ouvindo. Diga Guia Voz e o comando desejado.";
  });

  await _speech.listen(
    listenFor: const Duration(seconds: 8),
    pauseFor: const Duration(seconds: 4),
    onResult: (resultado) {

      setState(() {
        _textoReconhecido =
            resultado.recognizedWords;
      });

      if (resultado.finalResult) {

        setState(() {
          _ouvindo = false;
        });

        _processarComando(
          resultado.recognizedWords,
        );
      }
    },
    localeId: "pt_BR",
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Comandos por Voz",
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Icon(
              _ouvindo
                  ? Icons.mic
                  : Icons.mic_none,
              size: 80,
              color: _ouvindo
                  ? Colors.red
                  : Colors.blueGrey,
            ),
            const SizedBox(height: 20),
            Text(
              _textoReconhecido,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () async {
                if (_ouvindo) {
                  await _speech.stop();
                  setState(() {
                    _ouvindo = false;
                  });

                  return;
                }

                await _ouvirComando();
              },      
              icon: Icon(
                _ouvindo
                    ? Icons.stop
                    : Icons.mic,
              ),
              label: Text(
                _ouvindo
                    ? "Ouvindo..."
                    : "Falar Comando",
              ),
            ),
          ],
        ),
      ),
    );
  }
}