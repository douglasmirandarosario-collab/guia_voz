import 'package:flutter/material.dart';

class AssistenteVozFab extends StatelessWidget {
  final VoidCallback onPressed;

  const AssistenteVozFab({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      backgroundColor: Colors.blueGrey,
      icon: const Icon(Icons.mic),
      label: const Text("Guia Voz"),
    );
  }
}