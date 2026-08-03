import 'package:flutter/material.dart';
import 'package:guia_voz/utils/servico_voz.dart';
import 'package:guia_voz/widgets/assistente_voz_fab.dart';
import 'package:guia_voz/screens/comandos_voz_screen.dart';

class EmergenciaScreen extends StatelessWidget {
  const EmergenciaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Situações de Emergência (192)"),
        backgroundColor: Colors.red,
      ),

      floatingActionButton: AssistenteVozFab(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const ComandosVozScreen(),
            )
          );
        },
      ),
               
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.red.shade900,
                width: 2,
              ),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.warning_rounded,
                  color: Colors.red,
                  size: 40,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ligue para o SAMU 192",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Identifique sinais de emergência em hipertensão e diabetes.",
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

          _buildSecaoCard(
            titulo:
                "1. Pico Hipertensivo (Pressão Muito Alta)",
            corBorda: Colors.red,
            icone: Icons.electric_bolt,
            conteudo:
                "Sintomas: dor de cabeça intensa, tontura forte, visão embaçada, dor no peito e falta de ar.\n\n"
                "O que fazer: manter repouso, permanecer sentado e procurar atendimento imediato. Em caso de dor no peito, dificuldade para falar ou falta de ar importante, acione o SAMU 192.",
          ),

          const SizedBox(height: 16),

          _buildSecaoCard(
            titulo:
                "2. Hipoglicemia (Açúcar Muito Baixo)",
            corBorda: Colors.orange,
            icone: Icons.trending_down,
            conteudo:
                "Sintomas: suor frio, tremores, tontura, confusão mental, fraqueza intensa e visão turva.\n\n"
                "Se a pessoa estiver consciente, ofereça água com açúcar ou bebida açucarada conforme orientação profissional. Se estiver inconsciente, não ofereça líquidos e acione o SAMU imediatamente.",
          ),

          const SizedBox(height: 16),

          _buildSecaoCard(
            titulo:
                "3. Hiperglicemia Grave ou Cetoacidose",
            corBorda: Colors.blue,
            icone: Icons.trending_up,
            conteudo:
                "Sintomas: muita sede, boca seca, excesso de urina, náuseas, vômitos e sonolência intensa.\n\n"
                "Procure atendimento médico com urgência para avaliação e tratamento adequado.",
          ),

          _buildSecaoCard(
            titulo: 
                "4. SINAIS DE ALERTA PARA AVC E INFARTO",
            corBorda: Colors.deepOrange,
            icone: Icons.warning_amber,
            conteudo:
                "Dor no peito.\n\n"
                "Falta intensa de ar.\n\n"
                "Fraqueza súbita.\n\n"
                "Dificuldade para falar.\n\n"
                "Perda repentina da visão.\n\n"
                "Desmaios ou perda de consciência.\n\n"
                "Convulsões.\n\n"
                "Ao identificar qualquer um desses sinais procure atendimento imediatamente ou acione o SAMU 192.",
          ),

          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.red,
                width: 2,
              ),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.phone_in_talk,
                  color: Colors.red,
                  size: 50,
                ),
                const SizedBox(height: 10),
                const Text(
                  "SAMU - 192",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  icon: const Icon(
                    Icons.volume_up,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "OUVIR ORIENTAÇÃO",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    await ServicoVoz.inicializar();

                    await ServicoVoz.falar(
                    """
                    SAMU 192.

                    Ligue imediatamente para o SAMU em casos de:
                    
                    Dor forte no peito.

                    Falta intensa de ar.

                    Perda de consciência.

                    Convulsões.

                    Suspeita de AVC.

                    Suspeita de infarto.

                    Parada cardiorrespiratória.

                    O número do SAMU é cento e noventa e dois.
                    """
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecaoCard({
  required String titulo,
  required Color corBorda,
  required IconData icone,
  required String conteudo,
}) {
  return InkWell(
    borderRadius: BorderRadius.circular(12),
    onTap: () async {
      await ServicoVoz.inicializar();

      await ServicoVoz.falar(
        """
$titulo

$conteudo
"""
      );
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: corBorda,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icone,
                  color: corBorda,
                  size: 28,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    titulo,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: corBorda,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.volume_up,
                    color: Colors.blueGrey,
                  ),
                  tooltip: "Ouvir informações",
                  onPressed: () async {
                    await ServicoVoz.inicializar();

                    await ServicoVoz.falar(
                      """
$titulo

$conteudo
"""
                    );
                  },
                ),
              ],
            ),
            const Divider(height: 20),
            Text(
              conteudo,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}