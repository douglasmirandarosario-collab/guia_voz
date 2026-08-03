import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:guia_voz/utils/servico_voz.dart';
import 'package:guia_voz/widgets/assistente_voz_fab.dart';
import 'package:guia_voz/screens/comandos_voz_screen.dart';

class LocaisScreen extends StatelessWidget {
  const LocaisScreen({super.key});

  Future<void> _abrirMapa(String termoBusca) async {
    final Uri url = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$termoBusca',
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    } else {
      debugPrint(
        'Não foi possível abrir o mapa.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Postos e Farmácias - SUS",
        ),
        backgroundColor: Colors.teal[700],
      ),

      floatingActionButton: AssistenteVozFab(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const ComandosVozScreen(),
            ),
          );
        },
      ),
                  
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.teal[50],
              borderRadius:
                  BorderRadius.circular(12),
              border: Border.all(
                color: Colors.teal[300]!,
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.teal,
                  size: 40,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Encontre Atendimento Próximo",
                        style: TextStyle(
                          fontWeight:
                              FontWeight.bold,
                          color: Colors.teal,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Localize Unidades Básicas de Saúde e Farmácias Populares usando sua localização.",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          _buildLocalCard(
            titulo:
                "Unidade Básica de Saúde (UBS)",
            subtitulo:
                "Posto de saúde para consultas e vacinas",
            descricao:
                "Encontre o posto de saúde do SUS mais próximo para consultas, acompanhamento do Hiperdia, vacinação e atendimento multiprofissional.",
            icone: Icons.local_hospital,
            corCard: Colors.teal[700]!,
            textoVoz:
                "Unidade Básica de Saúde. Encontre o posto de saúde do SUS mais próximo para consultas e acompanhamento médico.",
            onPressedMapa: () =>
                _abrirMapa(
              'UBS mais proxima',
            ),
          ),

          const SizedBox(height: 16),

          _buildLocalCard(
            titulo: "Farmácia Popular",
            subtitulo:
                "Retirada gratuita de medicamentos",
            descricao:
                "Localize farmácias credenciadas ou unidades participantes do programa Farmácia Popular para retirada de medicamentos para hipertensão, diabetes e outras condições.",
            icone: Icons.medication,
            corCard: Colors.indigo[700]!,
            textoVoz:
                "Farmácia Popular. Localize farmácias credenciadas para retirada gratuita de medicamentos.",
            onPressedMapa: () =>
                _abrirMapa(
              'Farmacia Popular mais proxima',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocalCard({
    required String titulo,
    required String subtitulo,
    required String descricao,
    required IconData icone,
    required Color corCard,
    required String textoVoz,
    required VoidCallback onPressedMapa,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(12),
        border: Border.all(
          color: corCard,
          width: 2,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icone,
                  color: corCard,
                  size: 28,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        titulo,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                              FontWeight.bold,
                          color: corCard,
                        ),
                      ),
                      Text(
                        subtitulo,
                        style:
                            const TextStyle(
                          fontSize: 12,
                          color:
                              Colors.grey,
                          fontWeight:
                              FontWeight
                                  .w600,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.volume_up,
                    color:
                        Colors.blueGrey,
                    size: 28,
                  ),
                  tooltip:
                      'Ouvir descrição',
                  onPressed: () async {
                    await ServicoVoz
                        .inicializar();

                    await ServicoVoz
                        .falar(
                      textoVoz,
                    );
                  },
                ),
              ],
            ),

            const Divider(height: 20),

            Text(
              descricao,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style:
                    ElevatedButton.styleFrom(
                  backgroundColor:
                      corCard,
                  padding:
                      const EdgeInsets
                          .symmetric(
                    vertical: 12,
                  ),
                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius
                            .circular(
                      8,
                    ),
                  ),
                ),
                icon: const Icon(
                  Icons.map,
                  color: Colors.white,
                ),
                label: const Text(
                  "ABRIR NO GOOGLE MAPS",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
                onPressed:
                    onPressedMapa,
              ),
            ),
          ],
        ),
      ),
    );
  }
}