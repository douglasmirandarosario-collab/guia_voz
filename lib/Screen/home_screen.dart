import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import '../camera_screen.dart';
import 'diabetes_screen.dart'; // Importando a nova tela

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Assistente Hiperdia - SUS")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _buildMenuButton(
              context,
              "Leitor de Câmera",
              Icons.camera_alt,
              Colors.purple[100]!,
              () async {
                final cameras = await availableCameras();
                if (context.mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraScreen(camera: cameras.first),
                    ),
                  );
                }
              },
            ),
            _buildMenuButton(
              context,
              "Emergência (SAMU)",
              Icons.local_hospital,
              Colors.red[200]!,
              () {},
            ),
            _buildMenuButton(
              context,
              "Anti-Hipertensivos",
              Icons.medication,
              Colors.red[100]!,
              () {},
            ),
            _buildMenuButton(
              context,
              "Antidiabéticos",
              Icons.bloodtype,
              Colors.blue[100]!,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DiabetesScreen(),
                  ),
                );
              },
            ),
            _buildMenuButton(
              context,
              "Cadastro Hiperdia",
              Icons.description,
              Colors.green[100]!,
              () {},
            ),
            _buildMenuButton(
              context,
              "Locais (Mapa)",
              Icons.map,
              Colors.grey[300]!,
              () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(
    BuildContext context,
    String label,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return Semantics(
      label: "Botão $label. Toque duas vezes para abrir.",
      button: true,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
