import 'package:flutter/material.dart';
import 'package:guia_voz/utils/servico_voz.dart';
import 'package:guia_voz/widgets/assistente_voz_fab.dart';
import 'package:guia_voz/screens/comandos_voz_screen.dart';

class ImportanciaScreen extends StatelessWidget {
  const ImportanciaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuidado Integral'),
        backgroundColor: Colors.blue[800],
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
                 
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildCard(
              titulo: "Acompanhamento Regular",
              icone: Icons.monitor_heart,
              cor: Colors.red,
              conteudo:
                  "Consultas regulares ajudam no controle da pressão arterial e da glicemia.\n\n"
                  "O acompanhamento contínuo permite identificar alterações precocemente, ajustar medicamentos quando necessário e prevenir complicações.\n\n"
                  "Leve sempre receitas, exames e a lista dos medicamentos utilizados durante as consultas.\n\n"
                  "Nunca interrompa tratamentos sem orientação da equipe de saúde.",
            ),

            _buildCard(
              titulo: "Vacinação",
              icone: Icons.vaccines,
              cor: Colors.blue,
              conteudo:
                  "A vacinação protege contra doenças que podem agravar problemas de saúde já existentes.\n\n"
                  "Pessoas com hipertensão, diabetes, gestantes e idosos devem manter as vacinas atualizadas conforme orientação profissional.\n\n"
                  "Vacinas como Influenza, COVID-19 e Hepatite B ajudam a reduzir complicações e internações.\n\n"
                  "Mantenha sua caderneta de vacinação sempre atualizada.",
            ),

            _buildCard(
              titulo: "Saúde Mental",
              icone: Icons.psychology,
              cor: Colors.purple,
              conteudo:
                 "Ansiedade, estresse e depressão podem dificultar o controle da pressão arterial e da glicemia.\n\n"
                  "Cuidar da saúde emocional é parte fundamental do tratamento.\n\n"
                  "Procure ajuda profissional caso perceba tristeza persistente, desânimo frequente, problemas de sono, excesso de preocupação ou sofrimento emocional.\n\n"
                  "A Unidade Básica de Saúde pode orientar sobre atendimento psicológico e serviços especializados da rede pública.",
            ),      

            _buildCard(
              titulo: "Apoio Familiar",
              icone: Icons.family_restroom,
              cor: Colors.green,
              conteudo:
                   "O apoio da família melhora a adesão ao tratamento e fortalece o cuidado diário.\n\n"
                   "Familiares podem apoiar na organização dos medicamentos, comparecimento às consultas e adoção de hábitos saudáveis.\n\n"
                   "O cuidado compartilhado contribui para maior segurança, autonomia e qualidade de vida.",
            ),

            _buildCard(
              titulo: "Estilo de Vida & Bem-Estar",
              icone: Icons.favorite,
              cor: Colors.orange,
              conteudo:
                  "Uma alimentação equilibrada auxilia no controle da pressão arterial, glicemia e peso corporal.\n\n"
                  "Pratique atividade física regularmente conforme orientação profissional.\n\n"
                  "Mantenha uma boa hidratação e procure dormir adequadamente.\n\n"
                  "Reduza o consumo de sal, açúcar, bebidas alcoólicas e alimentos ultraprocessados.\n\n"
                  "Evite fumar.\n\n"
                  "Pequenas mudanças realizadas diariamente podem produzir grandes benefícios para a saúde.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String titulo,
    required String conteudo,
    required IconData icone,
    required Color cor,
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
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: cor,
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
                    color: cor,
                    size: 28,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      titulo,
                      style: TextStyle(
                        color: cor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
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