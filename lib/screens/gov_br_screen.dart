import 'package:flutter/material.dart';
import 'medicamentos_screen.dart';
import 'package:guia_voz/utils/servico_voz.dart';

class GovBrScreen extends StatelessWidget {
  const GovBrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu SUS Digital / Gov.br"),
        backgroundColor: Colors.blue[900],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.blue.shade200,
                ),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.verified_user,
                        color: Colors.blue,
                        size: 28,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Integração Oficial SUS",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:
                              FontWeight.bold,
                          color: Colors.blue[900],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Conecte sua conta do Gov.br para sincronizar histórico de vacinação, exames laboratoriais, cartões e prescrições médicas de forma centralizada.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Serviços Disponíveis",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            _buildServicoItem(
              context,
              titulo:
                  "Certificado de Vacinação COVID-19 e Outras",
              descricao:
                  "Visualize e emita seu comprovante nacional de vacinação.",
              icone: Icons.vaccines,
            ),

            _buildServicoItem(
              context,
              titulo: "Resultados de Exames",
              descricao:
                  "Acesse laudos de exames realizados na rede pública.",
              icone: Icons.science,
            ),

            _buildServicoItem(
              context,
              titulo:
                  "Histórico de Atendimentos",
              descricao:
                  "Consulte consultas e internações registradas no SUS.",
              icone: Icons.history_edu,
            ),

            const SizedBox(height: 24),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(
                Icons.login,
                color: Colors.white,
              ),
              label: const Text(
                "Entrar com Conta Gov.br",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () async {
                await ServicoVoz.inicializar();

                await ServicoVoz.falar(
                  "Redirecionando para autenticação segura do Gov ponto BR",
                );
              },
            ),

            const SizedBox(height: 12),

            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const MedicamentosScreen(),
                  ),
                );
              },
              child: const Text(
                "Ir para Medicamentos",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServicoItem(
    BuildContext context, {
    required String titulo,
    required String descricao,
    required IconData icone,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              Colors.blue[100],
          child: Icon(
            icone,
            color: Colors.blue[900],
          ),
        ),
        title: Text(
          titulo,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        subtitle: Text(
          descricao,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
        onTap: () async {
          await ServicoVoz.inicializar();
          await ServicoVoz.falar(
            titulo,
          );
        },
      ),
    );
  }
}