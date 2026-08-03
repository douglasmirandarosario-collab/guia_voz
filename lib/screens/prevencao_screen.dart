import 'package:flutter/material.dart';
import 'package:guia_voz/utils/servico_voz.dart';
import 'package:guia_voz/widgets/assistente_voz_fab.dart';
import 'package:guia_voz/screens/comandos_voz_screen.dart';

class PrevencaoScreen extends StatelessWidget {
  const PrevencaoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prevenção de Complicações"),
        backgroundColor: Colors.indigo,
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
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.indigo,
                width: 2,
              ),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.health_and_safety,
                  color: Colors.indigo,
                  size: 40,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Cuidados preventivos ajudam a reduzir riscos e proteger a saúde a longo prazo.",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          _buildSecaoCard(
            titulo: "CONTROLE DA PRESSÃO ARTERIAL",
            corBorda: Colors.red,
            icone: Icons.monitor_heart,
            conteudo:
                "Manter a pressão arterial controlada reduz os riscos de AVC, infarto, insuficiência cardíaca, doença renal e alterações na visão.\n\n"
                "Verifique a pressão regularmente e utilize os medicamentos conforme orientação profissional.\n\n"
                "Evite interromper o tratamento sem orientação da equipe de saúde.\n\n"
                "O controle adequado da pressão é uma das formas mais eficazes de prevenir complicações futuras.",
          ),

          const SizedBox(height: 16),

          _buildSecaoCard(
            titulo: "CONTROLE DA GLICEMIA",
            corBorda: Colors.blue,
            icone: Icons.bloodtype,
            conteudo:
                "O controle adequado da glicemia ajuda a prevenir danos nos olhos, rins, nervos e vasos sanguíneos.\n\n"
                "Também reduz os riscos de infarto, AVC e problemas de circulação.\n\n"
                "Utilize corretamente os medicamentos e siga as orientações da equipe de saúde.\n\n"
                "Alimentação equilibrada e atividade física auxiliam no controle do diabetes e na prevenção de complicações.",
          ),

          const SizedBox(height: 16),

          _buildSecaoCard(
            titulo: "CUIDADOS COM OS PÉS DIABÉTICOS",
            corBorda: Colors.orange,
            icone: Icons.accessibility_new,
            conteudo:
                "Pessoas com diabetes devem examinar os pés diariamente.\n\n"
                "Observe cortes, bolhas, rachaduras, alterações de cor, feridas ou perda de sensibilidade.\n\n"
                "Utilize calçados confortáveis e adequados.\n\n"
                "Evite andar descalço.\n\n"
                "Procure atendimento ao identificar qualquer alteração.",
          ),    

          const SizedBox(height: 16),

          _buildSecaoCard(
            titulo: "SAÚDE DOS OLHOS",
            corBorda: Colors.purple,
            icone: Icons.visibility,
            conteudo:
                "A hipertensão e o diabetes podem causar alterações na visão sem apresentar sintomas nas fases iniciais.\n\n"
                "Consultas oftalmológicas regulares ajudam na identificação precoce de problemas oculares.\n\n"
                "O diagnóstico precoce aumenta as chances de preservar a visão e evitar complicações futuras.",
          ),

          const SizedBox(height: 16),

          _buildSecaoCard(
            titulo: "SAÚDE DOS RINS",
            corBorda: Colors.green,
            icone: Icons.water_drop,
            conteudo:
                "Os rins podem ser afetados silenciosamente pela hipertensão e pelo diabetes.\n\n"
                "Muitas vezes os danos surgem sem sintomas nas fases iniciais.\n\n"
                "O controle da pressão arterial e da glicemia contribui para proteger a função renal.\n\n"
                "Seguir corretamente o tratamento reduz os riscos de complicações renais.",
          ),

            const SizedBox(height: 16),
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
        await ServicoVoz.falar(
          """
$titulo

$conteudo
""",
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
                    tooltip: "Ouvir conteúdo",
                    onPressed: () async {
                      await ServicoVoz.falar(
                        """
$titulo

$conteudo
""",
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