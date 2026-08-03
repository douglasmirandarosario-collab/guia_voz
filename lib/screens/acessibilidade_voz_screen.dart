import 'package:flutter/material.dart';
import 'package:guia_voz/utils/servico_voz.dart';

class AcessibilidadeVozScreen extends StatelessWidget {
  const AcessibilidadeVozScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comandos de Voz & Acessibilidade"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.blueGrey.shade300,
                width: 1.5,
              ),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.mic,
                  color: Colors.blueGrey,
                  size: 40,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Acessibilidade Total no SUS",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "O aplicativo foi desenhado para falar com você. Conheça os recursos disponíveis.",
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

          _buildAcessibilidadeCard(
            titulo: "1. Leitura por Voz",
            corBorda: Colors.blueGrey,
            icone: Icons.volume_up,
            descricao:
                "Todos os conteúdos importantes possuem leitura em voz alta para facilitar o acesso às informações.",
            textoVoz:
                "Todos os conteúdos importantes podem ser ouvidos através do botão de áudio.",
          ),

          const SizedBox(height: 16),

          _buildAcessibilidadeCard(
            titulo: "2. Navegação Assistida",
            corBorda: Colors.teal,
            icone: Icons.record_voice_over,
            descricao:
                "O aplicativo informa por voz a opção selecionada, ajudando na navegação segura.",
            textoVoz:
                "O aplicativo confirma por voz as opções selecionadas.",
          ),

          const SizedBox(height: 16),

          _buildAcessibilidadeCard(
            titulo: "3. Interface Adaptada",
            corBorda: Colors.indigo,
            icone: Icons.visibility,
            descricao:
                "Botões grandes, cores contrastantes e textos legíveis para facilitar o uso por idosos e pessoas com baixa visão.",
            textoVoz:
                "Interface adaptada com botões grandes e cores de fácil visualização.",
          ),
        ],
      ),
    );
  }

  Widget _buildAcessibilidadeCard({
    required String titulo,
    required Color corBorda,
    required IconData icone,
    required String descricao,
    required String textoVoz,
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
                IconButton(
                  icon: const Icon(
                    Icons.volume_up,
                    color: Colors.blueGrey,
                  ),
                  onPressed: () async {
                    await ServicoVoz.inicializar();
                    await ServicoVoz.falar(
                      textoVoz,
                    );
                  },
                ),
              ],
            ),
            const Divider(),
            Text(
              descricao,
              style: const TextStyle(
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}