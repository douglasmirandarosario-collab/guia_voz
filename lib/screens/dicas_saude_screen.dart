import 'package:flutter/material.dart';
import 'package:guia_voz/utils/servico_voz.dart';

class DicasSaudeScreen extends StatelessWidget {
  const DicasSaudeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dicas de Saúde & Bem-Estar"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.deepPurple.shade300,
                width: 1.5,
              ),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.self_improvement,
                  color: Colors.deepPurple,
                  size: 40,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pequenas Mudanças, Grande Saúde",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Orientações práticas para hipertensão, diabetes e qualidade de vida.",
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

          _buildDicaCard(
            titulo:
                "1. Controle do Sal e dos Industrializados",
            corBorda: Colors.red,
            icone: Icons.restaurant,
            descricao:
                "Evite excesso de sal, embutidos, temperos industrializados, salgadinhos e alimentos ultraprocessados. Prefira temperos naturais como alho, cebola, cheiro-verde e limão.",
          ),

          const SizedBox(height: 16),

          _buildDicaCard(
            titulo:
                "2. Atenção ao Açúcar e às Massas",
            corBorda: Colors.blue,
            icone: Icons.cake,
            descricao:
                "Evite doces, refrigerantes, sucos industrializados e excesso de carboidratos refinados. Dê preferência aos alimentos integrais.",
          ),

          const SizedBox(height: 16),

          _buildDicaCard(
            titulo:
                "3. Caminhe e Movimente-se",
            corBorda: Colors.green,
            icone: Icons.directions_walk,
            descricao:
                "A prática regular de atividade física ajuda no controle da pressão arterial, da glicemia e melhora a qualidade de vida.",
          ),

          const SizedBox(height: 16),

          _buildDicaCard(
            titulo: "4. Hidrate-se Bem",
            corBorda: Colors.cyan,
            icone: Icons.water_drop,
            descricao:
                "Beber água regularmente auxilia no funcionamento do organismo e contribui para a saúde dos rins e do sistema cardiovascular.",
          ),

          const SizedBox(height: 16),

          _buildDicaCard(
            titulo: "5. Não Abandone a Medicação",
            corBorda: Colors.orange,
            icone: Icons.medication,
            descricao:
                "Mesmo quando estiver se sentindo bem, continue utilizando seus medicamentos conforme a orientação médica.",
          ),

          const SizedBox(height: 16),

          _buildDicaCard(
            titulo: "6. Compareça às Consultas",
            corBorda: Colors.teal,
            icone: Icons.local_hospital,
            descricao:
                "Mantenha suas consultas e exames em dia para que a equipe de saúde acompanhe sua evolução.",
          ),
        ],
      ),
    );
  }

  Widget _buildDicaCard({
  required String titulo,
  required Color corBorda,
  required IconData icone,
  required String descricao,
}) {
  return InkWell(
    borderRadius: BorderRadius.circular(12),
    onTap: () async {
      await ServicoVoz.inicializar();

      await ServicoVoz.falar(
        """
$titulo

$descricao
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
                  tooltip: "Ouvir dica",
                  onPressed: () async {
                    await ServicoVoz.inicializar();

                    await ServicoVoz.falar(
                      """
$titulo

$descricao
"""
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
          ],
        ),
      ),
    ),
  );
}
}