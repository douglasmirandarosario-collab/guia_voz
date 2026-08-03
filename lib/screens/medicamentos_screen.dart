import 'package:flutter/material.dart';
import 'package:guia_voz/utils/servico_voz.dart';

class MedicamentosScreen extends StatefulWidget {
  const MedicamentosScreen({super.key});

  @override
  State<MedicamentosScreen> createState() =>
      _MedicamentosScreenState();
}

class _MedicamentosScreenState
    extends State<MedicamentosScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bulas - Anti-Hipertensivos (SUS)"),
        backgroundColor: Colors.red[700],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.red[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.red[300]!, width: 1.5),
            ),
            child: Row(
              children: [
                const Icon(Icons.medication, color: Colors.red, size: 40),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Relação Completa de Medicamentos",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 16),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Bulas e orientações técnicas de todos os remédios para pressão alta disponíveis na rede pública e Farmácia Popular.",
                        style: TextStyle(fontSize: 13, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // 1. Losartana potássica
          _buildBulaCompletaCard(
            nome: "Losartana potássica",
            apresentacao: "50 mg",
            indicacao: "Tratamento da hipertensão arterial e proteção renal em pacientes com diabetes tipo 2.",
            posologia: "Uso oral. Geralmente 50 mg uma vez ao dia, conforme orientação médica.",
            contraindicacao: "Hipersensibilidade à losartana e uso durante o segundo e terceiro trimestres de gestação.",
            reacoes: "Tontura, fadiga e hipotensão ortostática.",
            textoVoz: "Losartana potássica de cinquenta miligramas. Indicação: Tratamento da hipertensão e proteção renal. Posologia: Cinquenta miligramas uma vez ao dia.",
            corCard: Colors.red[700]!,
          ),
          const SizedBox(height: 16),

          // 2. Maleato de enalapril
          _buildBulaCompletaCard(
            nome: "Maleato de enalapril",
            apresentacao: "10 mg",
            indicacao: "Hipertensão arterial e insuficiência cardíaca.",
            posologia: "Uso oral. A dose inicial usual é de 10 a 20 mg divididas em uma ou duas tomadas diárias.",
            contraindicacao: "Histórico de angioedema prévio relacionado ao tratamento com inibidores da ECA e gravidez.",
            reacoes: "Tosse seca persistente, tontura e cefaleia.",
            textoVoz: "Maleato de enalapril de dez miligramas. Indicação: Hipertensão e insuficiência cardíaca. Posologia: De dez a vinte miligramas ao dia.",
            corCard: Colors.red[700]!,
          ),
          const SizedBox(height: 16),

          // 3. Captopril
          _buildBulaCompletaCard(
            nome: "Captopril",
            apresentacao: "25 mg",
            indicacao: "Hipertensão arterial, insuficiência cardíaca e pós-infarto do miocárdio.",
            posologia: "Uso oral. Tomar preferencialmente 1 hora antes das refeições.",
            contraindicacao: "Histórico de inchaço na garganta por inibidores da ECA e gravidez.",
            reacoes: "Tosse seca, tontura e alterações temporárias do paladar.",
            textoVoz: "Captopril de vinte e cinco miligramas. Indicação: Hipertensão e insuficiência cardíaca. Posologia: Uma hora antes das refeições.",
            corCard: Colors.red[700]!,
          ),
          const SizedBox(height: 16),

          // 4. Atenolol
          _buildBulaCompletaCard(
            nome: "Atenolol",
            apresentacao: "25 mg",
            indicacao: "Controle da hipertensão arterial, angina do peito e arritmias cardíacas.",
            posologia: "Uso oral. Geralmente uma tomada diária pela manhã.",
            contraindicacao: "Bradicardia grave, choque cardiogênico e bloqueio cardíaco de segundo ou terceiro grau.",
            reacoes: "Extremidades frias, fadiga e bradicardia leve.",
            textoVoz: "Atenolol de vinte e cinco miligramas. Indicação: Hipertensão e angina. Posologia: Uma vez ao dia pela manhã.",
            corCard: Colors.red[700]!,
          ),
          const SizedBox(height: 16),

          // 5. Besilato de anlodipino
          _buildBulaCompletaCard(
            nome: "Besilato de anlodipino",
            apresentacao: "5 mg",
            indicacao: "Hipertensão arterial e doença arterial coronariana (angina).",
            posologia: "Uso oral. Dose inicial habitual de 5 mg uma vez ao dia, podendo ser ajustada pelo médico.",
            contraindicacao: "Hipersensibilidade aos diidropiridínicos e choque cardiogênico grave.",
            reacoes: "Edema (inchaço) nos tornozelos, fadiga, rubor facial e tontura.",
            textoVoz: "Besilato de anlodipino de cinco miligramas. Indicação: Hipertensão e angina. Posologia: Cinco miligramas uma vez ao dia.",
            corCard: Colors.red[700]!,
          ),
          const SizedBox(height: 16),

          // 6. Cloridrato de propranolol
          _buildBulaCompletaCard(
            nome: "Cloridrato de propranolol",
            apresentacao: "40 mg",
            indicacao: "Hipertensão, angina, profilaxia da enxaqueca e controle de taquicardia.",
            posologia: "Uso oral. Dividido em duas a três tomadas diárias conforme prescrição médica.",
            contraindicacao: "Asma brônquica, DPOC grave e bradicardia sinusal.",
            reacoes: "Distúrbios do sono, fadiga, extremidades frias e bradicardia.",
            textoVoz: "Cloridrato de propranolol de quarenta miligramas. Indicação: Hipertensão, enxaqueca e ansiedade. Posologia: Dividido em duas a três tomadas diárias.",
            corCard: Colors.red[700]!,
          ),
          const SizedBox(height: 16),

          // 7. Hidroclorotiazida
          _buildBulaCompletaCard(
            nome: "Hidroclorotiazida",
            apresentacao: "25 mg",
            indicacao: "Hipertensão arterial e controle de edemas (inchaços).",
            posologia: "Uso oral. 25 mg a 50 mg administrados preferencialmente pela manhã.",
            contraindicacao: "Anúria, insuficiência renal grave e alergia a sulfonamidas.",
            reacoes: "Aumento da urina, cãibras musculares e desidratação leve.",
            textoVoz: "Hidroclorotiazida de vinte e cinco miligramas. Indicação: Hipertensão e inchaços. Posologia: Tomar pela manhã.",
            corCard: Colors.red[700]!,
          ),
          const SizedBox(height: 16),

          // 8. Succinato de metoprolol
          _buildBulaCompletaCard(
            nome: "Succinato de metoprolol",
            apresentacao: "25 mg",
            indicacao: "Hipertensão arterial, angina e insuficiência cardíaca crônica.",
            posologia: "Uso oral. Administrado em dose única diária, preferencialmente pela manhã.",
            contraindicacao: "Bloqueio atrioventricular de grau elevado e insuficiência cardíaca descompensada.",
            reacoes: "Fadiga, tontura, bradicardia e mãos ou pés frios.",
            textoVoz: "Succinato de metoprolol de vinte e cinco miligramas. Indicação: Hipertensão e insuficiência cardíaca. Posologia: Dose única diária pela manhã.",
            corCard: Colors.red[700]!,
          ),
          const SizedBox(height: 16),

          // 9. Espironolactona (25 mg)
          _buildBulaCompletaCard(
            nome: "Espironolactona",
            apresentacao: "25 mg",
            indicacao: "Hipertensão essencial, insuficiência cardíaca congestiva e edemas.",
            posologia: "Uso oral. Conforme orientação médica, geralmente associada a outros diuréticos.",
            contraindicacao: "Insuficiência renal aguda, anúria e hipercalemia (potássio alto no sangue).",
            reacoes: "Hipercalemia, ginecomastia reversível e distúrbios gastrintestinais leves.",
            textoVoz: "Espironolactona de vinte e cinco miligramas. Indicação: Hipertensão e insuficiência cardíaca. Posologia: Uso oral conforme prescrição médica.",
            corCard: Colors.red[700]!,
          ),
          const SizedBox(height: 16),

          // 10. Furosemida
          _buildBulaCompletaCard(
            nome: "Furosemida",
            apresentacao: "40 mg",
            indicacao: "Edemas associados a doenças cardíacas, hepáticas ou renais, e hipertensão arterial leve a moderada.",
            posologia: "Uso oral. Dose ajustada individualmente pelo médico conforme a gravidade do inchaço.",
            contraindicacao: "Insuficiência renal com anúria, desidratação grave e hipovolemia.",
            reacoes: "Desidratação, queda de pressão, tontura e desequilíbrio eletrolítico.",
            textoVoz: "Furosemida de quarenta miligramas. Indicação: Redução de edemas graves e hipertensão. Posologia: Uso oral conforme orientação médica.",
            corCard: Colors.red[700]!,
          ),
          const SizedBox(height: 16),

          // 11. Metildopa
          _buildBulaCompletaCard(
            nome: "Metildopa",
            apresentacao: "250 mg e 500 mg (Muito utilizada por gestantes)",
            indicacao: "Tratamento da hipertensão arterial, sendo primeira escolha segura no acompanhamento de gestantes.",
            posologia: "Uso oral. Geralmente iniciada com 250 mg duas a três vezes ao dia.",
            contraindicacao: "Doença hepática ativa (hepatite ou cirrose ativa) e feocromocitoma.",
            reacoes: "Sonolência temporária, boca seca, astenia e tontura leve.",
            textoVoz: "Metildopa de duzentos e cinquenta e quinhentos miligramas. Indicação: Hipertensão, muito segura para gestantes. Posologia: De duas a três vezes ao dia.",
            corCard: Colors.red[700]!,
          ),
          const SizedBox(height: 16),

          // 12. Cloridrato de hidralazina
          _buildBulaCompletaCard(
            nome: "Cloridrato de hidralazina",
            apresentacao: "25 mg e 50 mg",
            indicacao: "Hipertensão arterial essencial, utilizada isoladamente ou em combinação.",
            posologia: "Uso oral. Iniciada em doses baixas e titulada gradualmente pelo médico.",
            contraindicacao: "Doença coronariana evidente, valvulopatia mitral reumática e taquicardia.",
            reacoes: "Taquicardia reflexa, palpitações, cefaleia e rubor.",
            textoVoz: "Cloridrato de hidralazina de vinte e cinco e cinquenta miligramas. Indicação: Hipertensão arterial. Posologia: Conforme ajuste médico gradual.",
            corCard: Colors.red[700]!,
          ),
          const SizedBox(height: 16),

          // 13. Nifedipino
          _buildBulaCompletaCard(
            nome: "Nifedipino",
            apresentacao: "20 mg (Ação prolongada)",
            indicacao: "Tratamento da hipertensão arterial e controle da angina do peito.",
            posologia: "Uso oral. Os comprimidos devem ser engolidos inteiros, sem mastigar.",
            contraindicacao: "Choque cardiogênico e uso nas primeiras semanas de gestação (salvo critério médico estrito).",
            reacoes: "Inchaço nos pés e pernas, tontura, dor de cabeça e rubor facial.",
            textoVoz: "Nifedipino de vinte miligramas. Indicação: Hipertensão e angina. Posologia: Uso oral, engolir inteiro sem mastigar.",
            corCard: Colors.red[700]!,
          ),
          const SizedBox(height: 16),

          // 14. Espironolactona (100 mg)
          _buildBulaCompletaCard(
            nome: "Espironolactona",
            apresentacao: "100 mg",
            indicacao: "Hipertensão resistente, insuficiência cardíaca grave e ascite por cirrose hepática.",
            posologia: "Uso oral. Dose mais alta ajustada rigorosamente com acompanhamento médico laboratorial.",
            contraindicacao: "Hipercalemia grave, insuficiência renal aguda e anúria.",
            reacoes: "Hipercalemia significativa, alterações hormonais e náuseas.",
            textoVoz: "Espironolactona de cem miligramas. Indicação: Hipertensão resistente e insuficiência cardíaca. Posologia: Uso oral sob rigoroso controle médico.",
            corCard: Colors.red[700]!,
          ),
        ],
      ),
    );
  }

  Widget _buildBulaCompletaCard({
    required String nome,
    required String apresentacao,
    required String indicacao,
    required String posologia,
    required String contraindicacao,
    required String reacoes,
    required String textoVoz,
    required Color corCard,
  }) {
    return InkWell(
  borderRadius: BorderRadius.circular(12),
  onTap: () async {
    await ServicoVoz.falarLento(
    """
$nome.

Apresentação:
$apresentacao.

Indicação principal:
$indicacao.

Posologia:
$posologia.

Contraindicações:
$contraindicacao.

Reações adversas:
$reacoes.
"""
  );
},
  child: Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: corCard, width: 2),
      boxShadow: [
        const BoxShadow(
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
                Icon(Icons.medication_liquid, color: corCard, size: 28),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nome,
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: corCard),
                      ),
                      Text(
                        apresentacao,
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.volume_up, color: Colors.blueGrey, size: 28),
                  tooltip: 'Ouvir bula completa',
                  onPressed: () async {
                    await ServicoVoz.falar(
                    """
                    $nome
                    
                    Apresentação:
                    $apresentacao

                    Indicação:
                    $indicacao

                    Posologia:
                    $posologia

                    Contraindicações:
                    $contraindicacao

                    Reações adversas:
                    $reacoes
                    """
                    );  
                  },
                ),
              ],
            ),
            const Divider(height: 20),
            _blocoTexto("Indicação Principal:", indicacao),
            const SizedBox(height: 8),
            _blocoTexto("Posologia / Como Usar:", posologia),
            const SizedBox(height: 8),
            _blocoTexto("Contraindicações:", contraindicacao),
            const SizedBox(height: 8),
            _blocoTexto("Reações Adversas:", reacoes),
          ],
        ),
      ),
    ),
  );
}

  Widget _blocoTexto(String titulo, String texto) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 13, color: Colors.black87),
        children: [
          TextSpan(text: "$titulo\n", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 13)),
          TextSpan(text: texto, style: const TextStyle(color: Colors.black54, fontSize: 12.5)),
        ],
      ),
    );
  }
}