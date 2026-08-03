import 'package:flutter/material.dart';
import 'package:guia_voz/utils/servico_voz.dart';

class CadastroHiperdiaScreen extends StatelessWidget {
  const CadastroHiperdiaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro Hiperdia - SUS"),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.green.shade300,
                width: 1.5,
              ),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.description,
                  color: Colors.green,
                  size: 40,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Guia de Inscrição no Programa",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Confira os documentos necessários e saiba como realizar o cadastro e acompanhamento pelo programa Hiperdia no SUS.",
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
            titulo: "1. Documentos Necessários",
            corBorda: Colors.green,
            icone: Icons.badge,
            conteudo:
                "• Cartão do SUS atualizado.\n"
                "• Documento oficial com foto.\n"
                "• CPF.\n"
                "• Comprovante de residência.\n"
                "• Caderneta de vacinação, se disponível.",
          ),

          const SizedBox(height: 16),

          _buildSecaoCard(
            titulo: "2. Exames Solicitação Médica",
            corBorda: Colors.teal,
            icone: Icons.science,
            conteudo:
                "Os exames utilizados no acompanhamento do Hiperdia estão disponíveis no módulo Exames Hiperdia deste aplicativo.\n\n"
                "Consulte esse módulo para conhecer os exames solicitados, suas finalidades e a importância de cada avaliação para o controle da hipertensão e do diabetes.\n\n"
                "Siga sempre as orientações fornecidas pela equipe de saúde.",
          ),

          const SizedBox(height: 16),

          _buildSecaoCard(
            titulo: "3. Como Fazer o Cadastro",
            corBorda: Colors.blue,
            icone: Icons.local_hospital,
            conteudo:
                "1. Procure sua UBS de referência.\n"
                "2. Apresente a documentação necessária.\n"
                "3. Solicite o cadastro ou atualização no Hiperdia.\n"
                "4. Agende consulta com a equipe de saúde.\n"
                "5. Realize os exames solicitados.\n"
                "6. Retorne para acompanhamento periódico.",
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
    onTap: () async {
      await ServicoVoz.inicializar();

      await ServicoVoz.falar(
        "$titulo. $conteudo",
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
                  ),
                  tooltip: "Ouvir informações",
                  onPressed: () async {
                    await ServicoVoz.inicializar();

                    await ServicoVoz.falar(
                      "$titulo. $conteudo",
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