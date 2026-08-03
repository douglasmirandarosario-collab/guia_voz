import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'camera_screen.dart';
import 'gov_br_screen.dart';
import 'diabetes_screen.dart';
import 'medicamentos_screen.dart';
import 'emergencia_screen.dart';
import 'gestantes_screen.dart';
import 'cadastro_hiperdia_screen.dart';
import 'hiperdia_screen.dart';
import 'importancia_screen.dart';
import 'locais_screen.dart';
import 'gravador_consulta_screen.dart';
import 'comandos_voz_screen.dart';
import 'historico_medicoes_screen.dart';
import 'cartao_sus_bottom_sheet.dart';
import 'package:guia_voz/screens/prevencao_screen.dart';
import '../widgets/assistente_voz_fab.dart';
import 'package:guia_voz/models/assistente_voz_service.dart';
import 'pos_operatorio_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

    void _abrirCartaoSus(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          const CartaoSusBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  floatingActionButton: AssistenteVozFab(
  onPressed: () async {
    await AssistenteVozService.ouvir(
      context: context,
      onResultado: (texto) {
        debugPrint(
          "Comando: $texto",
        );
      },
    );
  },
),

  backgroundColor: Colors.grey[100],

  appBar: AppBar(
  backgroundColor: Colors.white,
  elevation: 1,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        "Assistente Hiperdia - SUS",
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      Semantics(
        label: "Cartão SUS Digital",
        hint: "Toque duas vezes para abrir",
        button: true,
        child: IconButton(
          icon: const Icon(
            Icons.badge,
            color: Colors.blue,
            size: 26,
          ),
          tooltip: "Cartão SUS Digital",
          onPressed: () => _abrirCartaoSus(context),
        ),
      ),
    ],
  ),
),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.9,
          children: [
            // 1. Meu SUS Digital / Gov.br
            _buildCardTatil(
              context,
              titulo: "MEU SUS DIGITAL",
              sub: "Sincronização gov.br",
              icone: Icons.verified_user,
              corFundo: Colors.blue[900]!,
              onAcao: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GovBrScreen()),
                );
              },
            ),

            // 2. Leitor de Câmera
            _buildCardTatil(
              context,
              titulo: "CÂMERA",
              sub: "Ler embalagem",
              icone: Icons.camera_alt,
              corFundo: Colors.blueGrey[800]!,
              onAcao: () async {
                final cameras = await availableCameras();
                if (context.mounted && cameras.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraScreen(camera: cameras.first),
                    ),
                  );
                }
              },
            ),

            // 3. Anti-Hipertensivos
            _buildCardTatil(
              context,
              titulo: "MEDICAMENTOS ANTI-HIPERTENSIVOS",
              sub: "Anti-hipertensivos & Bulas",
              icone: Icons.medication,
              corFundo: Colors.red[600]!,
              onAcao: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MedicamentosScreen()),
                );
              },
            ),

            // 4. Antidiabéticos
            _buildCardTatil(
              context,
              titulo: "MEDICAMENTOS ANTI-DIABÉTICOS",
              sub: "Antidiabéticos & Bulas",
              icone: Icons.bloodtype,
              corFundo: Colors.blue[600]!,
              onAcao: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DiabetesScreen()),
                );
              },
            ),

            // 5. Gestantes e Puérperas
            _buildCardTatil(
              context,
              titulo: "GESTANTES",
              sub: "Hábitos Saudáveis\nPré-natal\nAmamentação",
              icone: Icons.pregnant_woman,
              corFundo: Colors.pink[600]!,
              onAcao: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GestantesScreen()),
                );
              },
            ),

            // 6. Situações de Emergência
            _buildCardTatil(
              context,
              titulo: "EMERGÊNCIA",
              sub: "Pico Hipertensivo\nHiperglicemia\nHipoglicemia\nSAMU 192",
              icone: Icons.warning_rounded,
              corFundo: Colors.red[900]!,
              onAcao: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EmergenciaScreen()),
                );
              },
            ),

            // 7. Cadastro Hiperdia
            _buildCardTatil(
              context,
              titulo: "CADASTRO",
              sub: "Passo a Passo\nDocumentos",
              icone: Icons.description,
              corFundo: Colors.green[700]!,
              onAcao: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CadastroHiperdiaScreen()),
                );
              },
            ),

            // 8. Exames & Documentos Hiperdia
            _buildCardTatil(
              context,
              titulo: "EXAMES HIPERDIA",
              sub: "Rotinas\nDocumentos Exigidos",
              icone: Icons.folder_shared,
              corFundo: Colors.teal[800]!,
              onAcao: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HiperdiaScreen()),
                );
              },
            ),

            // 9. Histórico de Medições
            _buildCardTatil(
              context,
              titulo: "MEDIÇÕES",
              sub: "Pressão e Glicemia salvas",
              icone: Icons.show_chart,
              corFundo: Colors.indigo[900]!,
              onAcao: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HistoricoMedicoesScreen()),
                );
              },
            ),

            // 10. Cartão do SUS Digital
            _buildCardTatil(
              context,
              titulo: "CARTÃO SUS",
              sub: "Carteira digital virtual",
              icone: Icons.badge,
              corFundo: Colors.blue[800]!,
              onAcao: () => _abrirCartaoSus(context),
            ),

            // 11. Gravador de Consultas
            _buildCardTatil(
              context,
              titulo: "GRAVADOR",
              sub: "Salvar áudio da consulta",
              icone: Icons.mic_external_on,
              corFundo: Colors.indigo[800]!,
              onAcao: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GravadorConsultaScreen()),
                );
              },
            ),

            // 12. Assistente por Voz Ativa
            _buildCardTatil(
              context,
              titulo: "VOZ ATIVA",
              sub: "Fale para navegar",
              icone: Icons.settings_voice,
              corFundo: Colors.blueGrey[900]!,
              onAcao: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ComandosVozScreen()),
                );
              },
            ),

            // 13. Cuidado Integral
            _buildCardTatil(
              context,
              titulo: "CUIDADO INTEGRAL",
              sub: "Saúde Mental\nBem-estar\nAcompanhamento",
              icone: Icons.favorite,
              corFundo: Colors.amber[800]!,
              onAcao: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ImportanciaScreen()),
                );
              },
            ),

            // 14. Prevenção de Complicações
            _buildCardTatil(
              context,
              titulo: "PREVENÇÃO",
              sub: "Complicações\nSinais de Alerta\nCuidados",
              icone: Icons.health_and_safety,
              corFundo: Colors.indigo[700]!,
              onAcao: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PrevencaoScreen()),
                );
              },
            ),

            // 15. Cuidados Pós-Operatórios
            _buildCardTatil(
              context,
              titulo: "PÓS-OPERATÓRIO",
              sub: "Cuidados Domiciliares\nHipertensão\nDiabetes",
              icone: Icons.monitor_heart,
              corFundo: Colors.cyan[700]!,
              onAcao: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PosOperatorioScreen()),
                );
              },
            ),

            // 16. Locais de Atendimento
            _buildCardTatil(
              context,
              titulo: "POSTOS & MAPA",
              sub: "UBS\nFarmácia Popular\nMapa",
              icone: Icons.location_on,
              corFundo: Colors.teal[700]!,
              onAcao: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LocaisScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardTatil(
  BuildContext context, {
  required String titulo,
  required String sub,
  required IconData icone,
  required Color corFundo,
  required VoidCallback onAcao,
}) {
  return Semantics(
    label: "$titulo. $sub. Toque duas vezes para abrir.",
    excludeSemantics: true,
    child: InkWell(
      onTap: onAcao,
      borderRadius: BorderRadius.circular(16),
      child: ExcludeSemantics(
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: corFundo,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icone,
                color: Colors.white,
                size: 28,
              ),
              const SizedBox(height: 6),
              Text(
                titulo,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                sub,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

}