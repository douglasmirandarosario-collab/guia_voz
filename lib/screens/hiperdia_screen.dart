import 'package:flutter/material.dart';
import 'package:guia_voz/utils/servico_voz.dart';

class HiperdiaScreen extends StatelessWidget {
  const HiperdiaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exames & Documentos - Hiperdia"),
        backgroundColor: Colors.teal[700],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.teal[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.teal[300]!,
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.folder_shared,
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
                        "Programa Hiperdia no SUS",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Lista completa de exames laboratoriais de rotina e documentações exigidas para o acompanhamento.",
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
            titulo: "1. Exames Laboratoriais e de Rotina",
            corBorda: Colors.teal[700]!,
            icone: Icons.science,
            conteudo:
                "• Glicemia de Jejum: Semestral ou anual para controle do diabetes.\n"
                "• Hemoglobina Glicada (HbA1c): A cada 3 ou 6 meses para avaliar a média glicêmica.\n"
                "• Creatinina Sérica e TFG: Avaliação anual da função renal.\n"
                "• Urina Tipo I (EAS): Rastreio anual de proteinúria e lesão renal.\n"
                "• Perfil Lipídico (Colesterol e Triglicerídeos): Controle anual do risco cardiovascular.\n"
                "• Eletrocardiograma (ECG): Avaliação cardíaca periódica.",
          ),

          const SizedBox(height: 16),

          _buildSecaoCard(
            titulo:
                "2. Documentos e Registros no Prontuário",
            corBorda: Colors.blueGrey[700]!,
            icone: Icons.assignment_turned_in,
            conteudo:
                "• Ficha de Cadastro Hiperdia: Registro inicial com dados sociodemográficos e comorbidades.\n"
                "• Termo de Orientações: Instruções sobre adesão medicamentosa e mudanças de estilo de vida.\n"
                "• Prescrição Médica Atualizada: Receituário renovado periodicamente para dispensação na farmácia da UBS.\n"
                "• Anotações de Enfermagem: Histórico de pressões arteriais, peso, altura e cálculo do IMC.\n"
                "• Encaminhamentos Especializados: Laudos para cardiologista, endocrinologista ou oftalmologista.",
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
    return Container(
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
          crossAxisAlignment:
              CrossAxisAlignment.start,
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
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}