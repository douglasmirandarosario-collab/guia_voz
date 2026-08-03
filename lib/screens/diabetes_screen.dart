import 'package:flutter/material.dart';
import 'package:guia_voz/utils/servico_voz.dart';

class DiabetesScreen extends StatelessWidget {
  const DiabetesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bulas - Antidiabéticos & Insulinas"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.blue.shade300,
                width: 1.5,
              ),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.bloodtype,
                  color: Colors.blue,
                  size: 40,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bulas Completas do SUS",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Informações técnicas, dosagens e orientações de uso para comprimidos e insulinas.",
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

          _buildBulaCompletaCard(
            nome: "Cloridrato de Metformina",
            apresentacao: "500mg e 850mg",
            indicacao:
                "Tratamento do diabetes mellitus tipo 2.",
            posologia:
                "Tomar junto às refeições conforme orientação médica.",
            contraindicacao:
                "Insuficiência renal grave e acidose metabólica.",
            reacoes:
                "Náuseas, diarreia, vômitos e desconforto abdominal.",
            corCard: Colors.blue,
          ),

          const SizedBox(height: 16),

          _buildBulaCompletaCard(
            nome: "Glibenclamida",
            apresentacao: "5mg",
            indicacao:
                "Controle glicêmico no diabetes tipo 2.",
            posologia:
                "Conforme orientação médica, normalmente antes das refeições.",
            contraindicacao:
                "Diabetes tipo 1 e insuficiência grave.",
            reacoes:
                "Hipoglicemia e distúrbios gastrointestinais.",
            corCard: Colors.blue,
          ),

          const SizedBox(height: 16),

          _buildBulaCompletaCard(
            nome: "Gliclazida",
            apresentacao: "30mg e 60mg",
            indicacao:
                "Controle do diabetes tipo 2.",
            posologia:
                "Tomar conforme prescrição médica.",
            contraindicacao:
                "Diabetes tipo 1 e insuficiência grave.",
            reacoes:
                "Hipoglicemia e desconforto gastrointestinal.",
            corCard: Colors.blue,
          ),

          const SizedBox(height: 16),

          _buildBulaCompletaCard(
            nome: "Insulina Humana NPH",
            apresentacao: "100 UI/mL",
            indicacao:
                "Controle glicêmico de ação intermediária.",
            posologia:
                "Aplicação subcutânea conforme orientação médica.",
            contraindicacao:
                "Hipoglicemia ou alergia à fórmula.",
            reacoes:
                "Hipoglicemia e reações locais.",
            corCard: Colors.indigo,
          ),

          const SizedBox(height: 16),

          _buildBulaCompletaCard(
            nome: "Insulina Humana Regular",
            apresentacao: "100 UI/mL",
            indicacao:
                "Controle rápido dos níveis de glicose.",
            posologia:
                "Aplicar normalmente trinta minutos antes das refeições.",
            contraindicacao:
                "Hipoglicemia e alergia à insulina.",
            reacoes:
                "Hipoglicemia e reações locais.",
            corCard: Colors.indigo,
          ),
        ],
      ),
    );
  }

  static Widget _buildBulaCompletaCard({
    required String nome,
    required String apresentacao,
    required String indicacao,
    required String posologia,
    required String contraindicacao,
    required String reacoes,
    required Color corCard,
  }) {
    return InkWell(
  borderRadius: BorderRadius.circular(12),
  onTap: () async {
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
  child: Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
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
                  Icons.medication_liquid,
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
                        nome,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight:
                              FontWeight.bold,
                          color: corCard,
                        ),
                      ),
                      Text(
                        apresentacao,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.volume_up,
                    color: Colors.blueGrey,
                  ),
                  onPressed: () async {
                    await ServicoVoz.inicializar();

                    await ServicoVoz.falar(
                  """
                  $nome

                  Apresentação:
                  $apresentacao

                  Indicação:
                  $indicacao

                  Posologia:
                  $posologia

                  contraindicações:
                  $contraindicacao

                  Reações adversas:
                  $reacoes
                  """
                    );
                  },
                ),
              ],
            ),
            const Divider(),

            _blocoTexto(
              "Indicação",
              indicacao,
            ),
            const SizedBox(height: 8),

            _blocoTexto(
              "Posologia",
              posologia,
            ),
            const SizedBox(height: 8),

            _blocoTexto(
              "Contraindicações",
              contraindicacao,
            ),
            const SizedBox(height: 8),

            _blocoTexto(
              "Reações Adversas",
              reacoes,
            ),
          ],
        ),
      ),
    ),
  );
}

  static Widget _blocoTexto(
    String titulo,
    String texto,
  ) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 13,
        ),
        children: [
          TextSpan(
            text: "$titulo:\n",
            style: const TextStyle(
              fontWeight:
                  FontWeight.bold,
            ),
          ),
          TextSpan(
            text: texto,
          ),
        ],
      ),
    );
  }
}