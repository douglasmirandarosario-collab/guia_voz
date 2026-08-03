import 'package:flutter/material.dart';
import 'package:guia_voz/utils/servico_voz.dart';

class GestantesScreen extends StatelessWidget {
  const GestantesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestantes & Puérperas (SUS)"),
        backgroundColor: Colors.pink[600],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.pink[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.pink[300]!,
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.pregnant_woman,
                  color: Colors.pink,
                  size: 40,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Cuidado Especial na Gestação",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Orientações completas do pré-natal, controle da pressão, diabetes gestacional e amamentação segura no SUS.",
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
            titulo: "1. A Importância do Pré-Natal Precoce",
            corBorda: Colors.pink[700]!,
            icone: Icons.favorite,
            conteudo:
                "O acompanhamento de pré-natal deve iniciar assim que a gravidez for descoberta. Na Unidade Básica de Saúde (UBS), a gestante realiza exames de sangue essenciais, testes rápidos para infecções, ultrassonografias e recebe suplementação gratuita de ácido fólico e sulfato ferroso para prevenir anemias e malformações.",
          ),

          const SizedBox(height: 16),

          _buildSecaoCard(
            titulo: "2. Controle da Pressão e Pré-Eclâmpsia",
            corBorda: Colors.red[700]!,
            icone: Icons.monitor_heart,
            conteudo:
                "A pressão alta na gravidez exige atenção rigorosa. Medicamentos seguros na rede pública, como a Metildopa, são fornecidos para proteger mãe e bebê. Fique atenta a sinais de alerta como dor de cabeça forte persistente, visão turva, inchaço repentino no rosto e mãos, ou dor na boca do estômago, devendo procurar atendimento médico de emergência imediatamente.",
          ),

          const SizedBox(height: 16),

          _buildSecaoCard(
            titulo: "3. Cuidados com o Diabetes Gestacional",
            corBorda: Colors.blue[700]!,
            icone: Icons.bloodtype,
            conteudo:
                "O controle rigoroso da glicemia evita complicações no parto e o crescimento excessivo do bebê. Mude hábitos alimentares reduzindo doces e carboidratos refinados, realize as automonitorizações orientadas pela equipe de enfermagem e utilize os insumos de glicemia distribuídos pelo posto de saúde.",
          ),

          const SizedBox(height: 16),

          _buildSecaoCard(
            titulo: "4. Puerpério e Aleitamento Materno",
            corBorda: Colors.purple[700]!,
            icone: Icons.child_care,
            conteudo:
                "O período pós-parto (puerpério) exige consultas de revisão na UBS para mãe e recém-nascido. O aleitamento materno exclusivo até os 6 meses protege o bebê contra infecções e fortalece o vínculo. Em caso de dificuldades na amamentação, procure a sala de vacina e apoio à amamentação na sua unidade de saúde.",
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
        padding: const EdgeInsets.all(16.0),
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
                    size: 28,
                  ),
                  tooltip: 'Ouvir seção completa',
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