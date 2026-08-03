import 'package:flutter/material.dart';
import 'package:guia_voz/utils/servico_voz.dart';
import 'package:guia_voz/widgets/assistente_voz_fab.dart';
import 'package:guia_voz/screens/comandos_voz_screen.dart';


class PosOperatorioScreen extends StatelessWidget {
  const PosOperatorioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cuidados Pós-Operatórios",
        ),
        backgroundColor: Colors.teal,
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
  const Text(
    "Cuidados domiciliares para pacientes hipertensos e diabéticos após cirurgia.",
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),

  const SizedBox(height: 20),

  _buildSecaoCard(
    titulo: "CUIDADOS COM O CURATIVO",
    corBorda: Colors.blue,
    icone: Icons.healing,
    conteudo:
        "Mantenha o curativo limpo e seco.\n\n"
        "Lave as mãos antes de realizar qualquer cuidado.\n\n"
        "Siga corretamente as orientações fornecidas pela equipe de saúde.\n\n"
        "Não utilize pomadas, medicamentos ou produtos sem orientação profissional.\n\n"
        "Observe diariamente o local da cirurgia.",
  ),

  _buildSecaoCard(
    titulo: "CONTROLE DA PRESSÃO ARTERIAL",
    corBorda: Colors.red,
    icone: Icons.favorite,
    conteudo:
        "Mantenha o uso regular dos medicamentos prescritos.\n\n"
        "Verifique a pressão arterial conforme orientação profissional.\n\n"
        "Evite esforços excessivos durante a recuperação.\n\n"
        "Procure atendimento caso observe alterações importantes da pressão arterial.",
  ),

  _buildSecaoCard(
    titulo: "CONTROLE DA GLICEMIA",
    corBorda: Colors.purple,
    icone: Icons.bloodtype,
    conteudo:
        "O período pós-operatório pode alterar os níveis de glicose.\n\n"
        "Realize o monitoramento da glicemia conforme orientação médica.\n\n"
        "Utilize corretamente os medicamentos ou insulina prescritos.\n\n"
        "O controle adequado da glicemia auxilia na recuperação e reduz riscos de complicações.",
  ),

  _buildSecaoCard(
    titulo: "USO DOS MEDICAMENTOS",
    corBorda: Colors.teal,
    icone: Icons.medication,
    conteudo:
        "Respeite os horários e doses prescritos.\n\n"
        "Não interrompa medicamentos por conta própria.\n\n"
        "Mantenha atenção especial aos medicamentos para hipertensão e diabetes.",
  ),

  _buildSecaoCard(
    titulo: "ALIMENTAÇÃO E HIDRATAÇÃO",
    corBorda: Colors.green,
    icone: Icons.restaurant,
    conteudo:
        "Mantenha uma alimentação equilibrada.\n\n"
        "Evite excesso de sal, açúcar e alimentos ultraprocessados.\n\n"
        "Beba água regularmente.\n\n"
        "Uma boa alimentação auxilia na recuperação.",
  ),

  _buildSecaoCard(
    titulo: "RETORNO ÀS ATIVIDADES",
    corBorda: Colors.orange,
    icone: Icons.directions_walk,
    conteudo:
        "Respeite o período de repouso recomendado.\n\n"
        "Retorne às atividades de forma gradual.\n\n"
        "Evite esforços físicos sem autorização profissional.",
  ),

  _buildSecaoCard(
    titulo: "SINAIS DE ALERTA",
    corBorda: Colors.deepOrange,
    icone: Icons.warning_amber_rounded,
    conteudo:
        "Febre persistente.\n\n"
        "Vermelhidão intensa.\n\n"
        "Sangramento persistente.\n\n"
        "Dor intensa.\n\n"
        "Falta de ar.\n\n"
        "Dor no peito.",
  ),

  _buildSecaoCard(
    titulo: "QUANDO PROCURAR AJUDA",
    corBorda: Colors.indigo,
    icone: Icons.local_hospital,
    conteudo:
        "Procure atendimento imediatamente diante de sinais de infecção, sangramento importante, falta de ar, dor no peito ou piora do estado geral.\n\n"
        "Em emergências, ligue para o SAMU 192.",
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
        await ServicoVoz.falar(
          "$titulo.\n\n$conteudo",
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
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
                        fontWeight:
                            FontWeight.bold,
                        color: corBorda,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(height: 20),
              Text(
                conteudo,
                style: const TextStyle(
                  fontSize: 14,
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